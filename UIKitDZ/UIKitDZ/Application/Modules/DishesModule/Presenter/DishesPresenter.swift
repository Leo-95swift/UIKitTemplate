// DishesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для общения с DishesPresenter
protocol DishesPresenterProtocol {
    /// Состояние загрузки данных
    var state: ViewState<[Dish]> { get }
    /// Массив блюд, который заполняется после загрузки данных с сервера
    var dishes: [Dish] { get set }
    /// Просит презентера обновить UI кнопок сортировки по калориям
    func updateCaloriesControlUI()
    /// Просит презентера обновить UI кнопки сортировки по времени
    func updateTimeControlUI()
    /// Просит презентера обновить состояние кнопок сортировки
    func updateSortingViewState(sender: CustomControlView)
    /// Просит презентера вернуться на экран с категориями рецептов
    func moveToRecipes()
    /// Просит презентера перейти на экран деталей про блюдо
    func moveToDishesDetail(uri: String)
    /// Просит презентера получить данные о конкретном блюде
    func passUriToDishDetail(uri: String)
    /// Просит презентера получить данные о блюдах с сервера
    func updateDishes()
}

/// Presenter для страницы рецептов
final class DishesPresenter {
    // MARK: - Private Properties

    private weak var view: DishesViewControllerProtocol?
    private weak var recipesCoordinator: RecipesCoordinator?
    let networkService: NetworkServiceProtocol?
    var dishes: [Dish] = []
    private var dishDetail: DishDetail?
    var state: ViewState<[Dish]> = .noData {
        didSet {
            view?.updateState()
        }
    }

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
//        view?.updateState(sender: sender)
    }

    func moveToRecipes() {
        recipesCoordinator?.returnToRecipes()
    }

    func moveToDishesDetail(uri: String) {
        recipesCoordinator?.pushDishesDetailView(uri: uri)
    }

    func passUriToDishDetail(uri: String) {
        moveToDishesDetail(uri: uri)
    }

    func updateDishes() {
        state = .loading
        networkService?.getDishes(completionHandler: { result in
            switch result {
            case let .success(dishes):
                self.state = !dishes.isEmpty ? .data(dishes) : .noData
                self.dishes = dishes
            case let .failure(error):
                self.state = .error(error)
            }
        })
    }
}
