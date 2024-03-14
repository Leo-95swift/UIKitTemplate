// DishesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для общения с DishesPresenter
protocol DishesPresenterProtocol {
    /// Просит презентера обновить UI кнопок сортировки по калориям
    func updateCaloriesControlUI()
    /// Просит презентера обновить UI кнопки сортировки по времени
    func updateTimeControlUI()
    /// Просит презентера обновить состояние кнопок сортировки
    func updateSortingViewState(sender: CustomControlView)
    /// Просит презентера вернуться на экран с категориями рецептов
    func moveToRecipes()
    /// Просит презентера перейти на экран деталей про блюдо
    func moveToDishesDetail(data: DishDetail)
    /// Просит презентера получить данные о категории
    func fetchDishes()
    /// Просит презентера получить данные о конкретном блюде
    func fetchDishDetailes(uri: String)
}

/// Presenter для страницы рецептов
final class DishesPresenter {
    // MARK: - Private Properties

    private weak var view: DishesViewControllerProtocol?
    private weak var recipesCoordinator: RecipesCoordinator?
    let networkService: NetworkServiceProtocol?
    private var dish: [Dish]?
    private var dishDetail: DishDetail?

    // MARK: - Initializers

    init(
        view: DishesViewControllerProtocol,
        coordinator: RecipesCoordinator,
        networkService: NetworkServiceProtocol
    ) {
        self.view = view
        recipesCoordinator = coordinator
        self.networkService = networkService
    }
}

// MARK: - RecipesPresenter + RecipesPresenterProtocol

extension DishesPresenter: DishesPresenterProtocol {
    func updateTimeControlUI() {
        view?.updateTimeView()
    }

    func updateCaloriesControlUI() {
        view?.updateCaloriesView()
    }

    func updateSortingViewState(sender: CustomControlView) {
        view?.updateState(sender: sender)
    }

    func moveToRecipes() {
        recipesCoordinator?.returnToRecipes()
    }

    func moveToDishesDetail(data: DishDetail) {
        recipesCoordinator?.pushDishesDetailView(data: data)
    }

    func fetchDishes() {
        networkService?.getDishes(completionHandler: { result in
            switch result {
            case let .success(dishes):
                self.dish = dishes
                self.view?.updateDishes(dishes)
            case let .failure(error):
                print(error.localizedDescription)
            }
        })
    }

    func fetchDishDetailes(uri: String) {
        networkService?.getDishesDetail(uri, completionHandler: { result in
            switch result {
            case let .success(dishDetail):
                self.dishDetail = dishDetail
                DispatchQueue.main.async {
                    self.moveToDishesDetail(data: dishDetail)
                }
            case let .failure(error):
                print(error)
            }
        })
    }
}
