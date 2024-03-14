// FavoritesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для общения с FavoritesPresenter
protocol FavoritesPresenterProtocol {
    /// просит презентера получить данные о выбранных блюд
    func fetchFavoriteDishes()
}

/// Презентер для экрана с избранными
final class FavoritesPresenter {
    // MARK: - Private Properties

    private weak var favortiesCoordinator: FavoritesCoordinator?
    private weak var view: FavoritesViewControllerProtocol?

    // MARK: - Initializers

    init(
        view: FavoritesViewControllerProtocol,
        coordinator: FavoritesCoordinator
    ) {
        self.view = view
        favortiesCoordinator = coordinator
    }
}

extension FavoritesPresenter: FavoritesPresenterProtocol {
    func fetchFavoriteDishes() {
        view?.updateFavoritesData(
            FavoritesDataManager.shared.sharedDataMap
                .map(\.value)
        )
    }
}
