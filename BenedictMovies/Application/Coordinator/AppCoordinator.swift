//
//  AppCoordinator.swift
//  BenedictMovies
//
//  Created by Reiss Zurbyk on 2025-10-23.
//

import UIKit
import SwiftUI
import Foundation

final class AppCoordinator: AppCoordinatorProtocol {
    private let window: UIWindow
    private let navigationController = UINavigationController()
    private let apiClient: APIClient

    init(window: UIWindow, apiClient: APIClient = APIClient()) {
        self.window = window
        self.apiClient = apiClient
    }

    func start() {
        let movieListVM = MovieListViewModel(apiClient: apiClient)
        let movieListVC = MovieListViewController(viewModel: movieListVM)
        movieListVM.coordinator = self
        navigationController.viewControllers = [movieListVC]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func showMovieDetail(_ movie: Movie) {
        let detailView = MovieDetailView(movie: movie, apiClient: apiClient)
        let hosting = UIHostingController(rootView: detailView)
        navigationController.pushViewController(hosting, animated: true)
    }
}

protocol AppCoordinatorProtocol: AnyObject {
    func showMovieDetail(_ movie: Movie)
}
