import XCTest
@testable import BenedictMovies

final class MovieListViewModelTests: XCTestCase {

    func testLoadMoviesSuccess() async throws {
        let apiClient = MockAPIClient(result: .success(
            TMDBListResponse(
                page: 1,
                results: [
                    Movie(id: 1, title: "Doctor Strange", overview: "A Marvel movie", posterPath: "/poster1.jpg")
                ],
                totalPages: 1,
                totalResults: 1
            )
        ))

        let vm = await MainActor.run {
            MovieListViewModel(apiClient: apiClient)
        }

        await vm.load()

        await MainActor.run {
            XCTAssertEqual(vm.movies.count, 1)
            XCTAssertEqual(vm.movies.first?.title, "Doctor Strange")
            XCTAssertNil(vm.errorMessage)
        }
    }

    func testLoadMoviesFailure() async throws {
        let apiClient = MockAPIClient(result: .failure(NetworkError.invalidResponse))

        let vm = await MainActor.run {
            MovieListViewModel(apiClient: apiClient)
        }

        await vm.load()

        await MainActor.run {
            XCTAssertEqual(vm.movies.count, 0)
            XCTAssertEqual(vm.errorMessage, "The server response was invalid.")
        }
    }

    func testDidSelectRowCallsCoordinator() async throws {
        let apiClient = MockAPIClient(result: .success(
            TMDBListResponse(
                page: 1,
                results: [
                    Movie(id: 1, title: "Doctor Strange", overview: "A Marvel movie", posterPath: "/poster1.jpg")
                ],
                totalPages: 1,
                totalResults: 1
            )
        ))
        let coordinator = MockAppCoordinator()

        let vm = await MainActor.run {
            MovieListViewModel(apiClient: apiClient)
        }

        await MainActor.run {
            vm.coordinator = coordinator
        }

        await vm.load()

        await MainActor.run {
            vm.didSelectRow(at: 0)
            XCTAssertTrue(coordinator.didShowMovieDetailCalled)
        }
    }
}

// MARK: - Mocks

final class MockAPIClient: NetworkServicing {
    let result: Result<TMDBListResponse<Movie>, Error>
    
    init(result: Result<TMDBListResponse<Movie>, Error>) {
        self.result = result
    }
    
    func fetch<T: Decodable>(_ type: T.Type, from endpoint: Endpoint) async throws -> T {
        switch result {
        case .success(let response as T): return response
        case .failure(let error): throw error
        default: fatalError("Type mismatch in MockAPIClient")
        }
    }
    
    func fetchMovies(from endpoint: Endpoint) async throws -> [Movie] {
        switch result {
        case .success(let response): return response.results
        case .failure(let error): throw error
        }
    }
}

final class MockAppCoordinator: AppCoordinatorProtocol {
    var didShowMovieDetailCalled = false
    
    func showMovieDetail(_ movie: Movie) {
        didShowMovieDetailCalled = true
    }
}
