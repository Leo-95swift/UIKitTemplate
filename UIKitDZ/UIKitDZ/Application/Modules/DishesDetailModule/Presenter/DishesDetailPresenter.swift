// DishesDetailPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол для общения с DishesDetailPresenter
protocol DishesDetailPresenterProtocol {
    /// Состояние загрузки данных
    var state: ViewState<DishDetail> { get }
    /// просит презентера получить данные о блюде
    func fetchDishDetails()
    /// Просит презентера вернуться на экран с категориями рецептов
    func moveToDishes()
    /// Просит презентера показать алерт
    func showAlert()
    /// Просит презентера добавить блюдо в избранное
    func updateStateForDish(_ dish: Dish)
    /// Просит презентера показать активити контроллер
    func showActivityController()
}

/// Presenter для страницы рецептов
final class DishesDetailPresenter {
    // MARK: - Private Properties

    private weak var view: DishesDetailViewControllerProtocol?
    private weak var recipesCoordinator: RecipesCoordinator?
    private let networkService: NetworkServiceProtocol?
    private var uri: String
    private var dishName: String
    var state: ViewState<DishDetail> = .loading {
        didSet {
            view?.updateState()
        }
    }

    // MARK: - Initializers

    init(
        view: DishesDetailViewControllerProtocol,
        coordinator: RecipesCoordinator,
        networkService: NetworkServiceProtocol,
        data: (String, String)
    ) {
        self.view = view
        recipesCoordinator = coordinator
        self.networkService = networkService
        uri = data.0
        dishName = data.1
    }
}

// MARK: - DishesDetailPresenter + DishesDetailPresenterProtocol

extension DishesDetailPresenter: DishesDetailPresenterProtocol {
    func fetchDishDetails() {
        state = .loading
        let coreDataSavedDishDetail = CoreDataService.shared.fetchDishDetail(by: dishName)
        if coreDataSavedDishDetail == nil {
            networkService?.getDishesDetail(uri, completionHandler: { result in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    switch result {
                    case let .success(dishDetails):
                        self.state = .data(dishDetails)
                        CoreDataService.shared.create(dishDetail: dishDetails)
                    case .failure(.invalidStatusCode), .failure(.networkFailure):
                        self.state = .error
                    }
                }
            })
        } else {
            guard let dishDetail = coreDataSavedDishDetail else { return }
            state = .data(dishDetail)
        }
    }

    func moveToDishes() {
        recipesCoordinator?.returnToDishes()
    }

    func showAlert() {
        view?.showAlert()
    }

    func showActivityController() {
        view?.showActivityController()
    }

    func updateStateForDish(_ dish: Dish) {
//        FavoritesDataManager.shared.updateStateForDish(
//            dish.dishName,
//            dish: dish
//        )
    }
}
