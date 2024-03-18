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
    func moveToDishesDetail(data: (String, String))
    /// Просит презентера получить данные о конкретном блюде
    func passDataToDishesDetail(data: (String, String))
    /// Просит презентера получить данные о блюдах с сервера
    func updateDishes()
    /// Просит презентера получить данные о названии категории
    func fetchCategory()
}

/// Presenter для страницы рецептов
final class DishesPresenter {
    // MARK: - Private Properties

    private weak var view: DishesViewControllerProtocol?
    private weak var recipesCoordinator: RecipesCoordinator?
    let networkService: NetworkServiceProtocol?
    var dishes: [Dish] = []
    var category: Category
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
        networkService: NetworkServiceProtocol,
        categoty: Category
    ) {
        self.view = view
        recipesCoordinator = coordinator
        self.networkService = networkService
        category = categoty
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

    func moveToDishesDetail(data: (String, String)) {
        recipesCoordinator?.pushDishesDetailView(data: data)
    }

    func passDataToDishesDetail(data: (String, String)) {
        moveToDishesDetail(data: data)
    }

    func updateDishes() {
        state = .loading
        let mainCourses = ["Chicken", "Meat", "Fish", "Side dish"]
        var dishType = category.categoryName
        dishType = mainCourses.contains { $0 == dishType }
            ? "Main course"
            : dishType
        let coreDataSavedDishes = CoreDataService.shared.fetchDishes(by: dishType)
        if coreDataSavedDishes.isEmpty {
            networkService?.getDishes(
                dishType: dishType,
                completionHandler: { result in
                    switch result {
                    case let .success(dishes):
                        self.state = !dishes.isEmpty ? .data(dishes) : .noData
                        CoreDataService.shared.create(dishes: dishes, by: dishType)
                        self.dishes = dishes
                    case .failure(.invalidStatusCode), .failure(.networkFailure):
                        self.state = .error
                    }
                }
            )
        } else {
            dishes = coreDataSavedDishes
            state = .data(dishes)
        }
    }

    func fetchCategory() {
        view?.updateCategory(category: category)
    }
}
