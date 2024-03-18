// DishesDetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия с view
protocol DishesDetailViewControllerProtocol: AnyObject {
    /// Обновляет вью в зависимости от состояния
    func updateState()
    /// Обновляет данные у вью
    func updateData(_ data: DishDetail)
    /// Закрывает текущий экран
    func showAlert()
    /// Показывает активити контроллер
    func showActivityController()
}

/// Экран для показа блюд
final class DishesDetailViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Insets {
            static let vInset: CGFloat = 20
            static let top: CGFloat = 20
            static let leading: CGFloat = 40
            static let trailing: CGFloat = -40
            static let labelHeight: CGFloat = 30
        }

        enum Texts {
            static let navigationTxt = "navigations.txt"
            static let sharingTxt = "sharings.txt"
            static let navigationContent = "Пользователь открыл Экран деталей блюд"
            static let sharingContent = "Пользователь поделился рецептом из"
            static let verdanaFont = "Verdana"
            static let verdanaBoldFont = "Verdana-Bold"
            static let alertTitle = "Функционал в разработке"
            static let okActionTitle = "Ok"
        }
    }

    // MARK: - Visual Components

    private let refreshControl = UIRefreshControl()

    private let dishNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .myFont(fontName: Constants.Texts.verdanaBoldFont, fontSize: 20)
        label.numberOfLines = 0
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            DishImageTableViewCell.self,
            forCellReuseIdentifier: DishImageTableViewCell.Constants.identifier
        )
        tableView.register(
            NutrientsTableViewCell.self,
            forCellReuseIdentifier: NutrientsTableViewCell.Constants.identifier
        )
        tableView.register(
            DetailRecipeTableViewCell.self,
            forCellReuseIdentifier: DetailRecipeTableViewCell.Constants.identifier
        )
        tableView.register(
            DishImageShimmerTableViewCell.self,
            forCellReuseIdentifier: DishImageShimmerTableViewCell.Constants.identifier
        )
        tableView.register(
            NutrientsShimmerTableViewCell.self,
            forCellReuseIdentifier: NutrientsShimmerTableViewCell.Constants.identifier
        )
        tableView.register(
            DetailRecipeShimmerTableViewCell.self,
            forCellReuseIdentifier: DetailRecipeShimmerTableViewCell.Constants.identifier
        )
        tableView.register(NoDataTableViewCell.self, forCellReuseIdentifier: NoDataTableViewCell.Constants.identifier)
        tableView.register(ErrorTableViewCell.self, forCellReuseIdentifier: ErrorTableViewCell.Constants.identifier)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    // MARK: - Public Properties

    var presenter: DishesDetailPresenterProtocol?
    var fileManagerService: FileManagerService?

    // MARK: - Private Properties

    private let cellTypes: [DishesDetailCellType] = [
        .dishImageItem,
        .nutrients,
        .dishRecipe
    ]

    private var dishDetail: DishDetail?
    var isFavoriteDish = false

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSubviews()
        configureTableViewConstraints()
        setupRefreshControl()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchDishDetails()
        fileManagerService?.sendInfoToDirectory(
            txtFileName: Constants.Texts.navigationTxt,
            content: Constants.Texts.navigationContent
        )
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubviews([tableView], prepareForAutolayout: true)
    }

    private func setupAlert() {
        let alert = UIAlertController(title: Constants.Texts.alertTitle, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.Texts.okActionTitle, style: .cancel))
        present(alert, animated: true)
    }

    private func setupActivityController() {
        guard let recipeText = dishDetail?.label else { return }
        let activityController = UIActivityViewController(
            activityItems: [recipeText],
            applicationActivities: nil
        )
        present(activityController, animated: true)
    }

    private func updateFavoriteButton(isFavorite: Bool) {
        let addToFavoritesButton = navigationItem.rightBarButtonItem?.customView?.subviews
            .compactMap { $0 as? UIButton }
            .first { $0.tag == 2 }

        let favoriteButtonImage: UIImage = isFavorite
            ? .isFavoriteSelected
            : .isFavoriteNotSelected

        addToFavoritesButton?.setImage(
            favoriteButtonImage,
            for: .normal
        )

        navigationController?.navigationBar.layoutIfNeeded()
    }

    private func checkIsDishInFavorites(_ dish: DishDetail) {
        isFavoriteDish = FavoritesDataManager.shared.sharedDataMap
            .map(\.value)
            .contains(where: { $0.dishName == dish.label })
    }

    private func setupRefreshControl() {
        refreshControl.addTarget(
            self,
            action: #selector(refreshDishDetailData(_:)),
            for: .valueChanged
        )
        tableView.refreshControl = refreshControl
    }

    @objc private func refreshDishDetailData(_ sender: UIRefreshControl) {
        presenter?.fetchDishDetails()

        sender.endRefreshing()
    }
}

// MARK: - DishesDetailViewController + UITableViewDataSource

extension DishesDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        switch presenter?.state {
        case .loading, .data:
            cellTypes.count
        default:
            1
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter?.state {
        case .loading:
            let cellType = cellTypes[indexPath.section]
            switch cellType {
            case .dishImageItem:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: DishImageShimmerTableViewCell.Constants.identifier,
                    for: indexPath
                ) as? DishImageShimmerTableViewCell else { return UITableViewCell() }
                return cell
            case .nutrients:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: NutrientsShimmerTableViewCell.Constants.identifier,
                    for: indexPath
                ) as? NutrientsShimmerTableViewCell else { return UITableViewCell() }
                return cell
            case .dishRecipe:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: DetailRecipeShimmerTableViewCell.Constants.identifier,
                    for: indexPath
                ) as? DetailRecipeShimmerTableViewCell else { return UITableViewCell() }
                return cell
            }
        case let .data(dishDetails):
            dishNameLabel.text = dishDetails.label
            let cellType = cellTypes[indexPath.section]
            switch cellType {
            case .dishImageItem:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: DishImageTableViewCell.Constants.identifier,
                    for: indexPath
                ) as? DishImageTableViewCell else { return UITableViewCell() }
                cell.configure(data: dishDetails)
                return cell
            case .nutrients:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: NutrientsTableViewCell.Constants.identifier,
                    for: indexPath
                ) as? NutrientsTableViewCell else { return UITableViewCell() }
                cell.configure(data: dishDetails)
                return cell
            case .dishRecipe:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: DetailRecipeTableViewCell.Constants.identifier,
                    for: indexPath
                ) as? DetailRecipeTableViewCell else { return UITableViewCell() }
                cell.configure(data: dishDetails)
                return cell
            }
        case .noData:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NoDataTableViewCell.Constants.identifier,
                for: indexPath
            ) as? NoDataTableViewCell else { return UITableViewCell() }
            tableView.isScrollEnabled = false
            tableView.allowsSelection = false
            return cell
        case .error, .none:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ErrorTableViewCell.Constants.identifier,
                for: indexPath
            ) as? ErrorTableViewCell else { return UITableViewCell() }
            tableView.allowsSelection = false
            tableView.isScrollEnabled = false
            return cell
        }
    }
}

// MARK: - DishesDetailViewController + UITableViewDelegate

extension DishesDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch presenter?.state {
        case .loading:
            return UITableView.automaticDimension
        case .data:
            return UITableView.automaticDimension
        case .noData, .error, .none:
            return UIScreen.main.bounds.height / 1.5
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch cellTypes[section] {
        case .dishImageItem:
            return dishNameLabel
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch cellTypes[section] {
        case .dishImageItem:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
}

// MARK: - DishesDetailViewController + DishesDetailViewControllerProtocol

extension DishesDetailViewController: DishesDetailViewControllerProtocol {
    func updateState() {
        tableView.reloadData()
    }

    func updateData(_ data: DishDetail) {
        dishDetail = data
        dishNameLabel.text = dishDetail?.label
        guard let dishDetail = dishDetail else { return }
        checkIsDishInFavorites(dishDetail)
        updateFavoriteButton(isFavorite: isFavoriteDish)
    }

    func showAlert() {
        setupAlert()
    }

    func showActivityController() {
        setupActivityController()
    }
}

/// Расширение для установки навигейшн бара
extension DishesDetailViewController {
    private func setupNavigationBar() {
        let rightCustomView = UIView()

        let shareButton = UIButton(type: .custom)
        shareButton.setImage(.shareButton, for: .normal)
        shareButton.contentMode = .scaleAspectFill
        shareButton.addTarget(
            self,
            action: #selector(didTapShareButton),
            for: .touchUpInside
        )

        let addToFavoritesButton = UIButton(type: .custom)
        addToFavoritesButton.tag = 2

        guard let dish = dishDetail else { return }
        checkIsDishInFavorites(dish)

        let favoriteButtonImage: UIImage = isFavoriteDish
            ? .isFavoriteSelected
            : .isFavoriteNotSelected

        addToFavoritesButton.setImage(
            favoriteButtonImage,
            for: .normal
        )
        addToFavoritesButton.contentMode = .scaleAspectFill
        addToFavoritesButton.addTarget(
            self,
            action: #selector(didTapAddToFavoritesButton),
            for: .touchUpInside
        )

        let leftCustomView = UIView()

        let backButton = UIButton(type: .custom)
        backButton.isUserInteractionEnabled = true
        backButton.setImage(.backButton, for: .normal)
        backButton.contentMode = .scaleAspectFill
        backButton.addTarget(
            self,
            action: #selector(didTapBackButton),
            for: .touchUpInside
        )

        // setupSubviews
        view.addSubviews([
            rightCustomView,
            leftCustomView
        ])
        rightCustomView.addSubviews([
            shareButton,
            addToFavoritesButton
        ])
        leftCustomView.addSubviews([
            backButton
        ])

        // configureSubviews
        configureRightCustomViewConstraints(
            rightCustomView: rightCustomView,
            addToFavoritesButton: addToFavoritesButton,
            shareButton: shareButton
        )

        configureLeftCustomViewConstraints(
            leftCustomView: leftCustomView,
            backButton: backButton
        )

        // setup customBar
        let customBarLeftButtonItem = UIBarButtonItem(
            customView: leftCustomView
        )
        let customBarRightButtonItem = UIBarButtonItem(
            customView: rightCustomView
        )
        navigationItem.leftBarButtonItem = customBarLeftButtonItem
        navigationItem.rightBarButtonItem = customBarRightButtonItem
    }

    private func configureRightCustomViewConstraints(
        rightCustomView: UIView,
        addToFavoritesButton: UIButton,
        shareButton: UIButton
    ) {
        NSLayoutConstraint.activate([
            rightCustomView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            rightCustomView.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            rightCustomView.heightAnchor.constraint(
                equalToConstant: 44
            ),

            addToFavoritesButton.trailingAnchor.constraint(
                equalTo: rightCustomView.trailingAnchor
            ),
            addToFavoritesButton.centerYAnchor.constraint(
                equalTo: rightCustomView.centerYAnchor
            ),

            shareButton.trailingAnchor.constraint(
                equalTo: addToFavoritesButton.leadingAnchor,
                constant: -20
            ),
            shareButton.centerYAnchor.constraint(
                equalTo: rightCustomView.centerYAnchor
            ),
            shareButton.leadingAnchor.constraint(
                equalTo: rightCustomView.leadingAnchor
            )
        ])
    }

    private func configureLeftCustomViewConstraints(
        leftCustomView: UIView,
        backButton: UIButton
    ) {
        NSLayoutConstraint.activate([
            leftCustomView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            leftCustomView.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            leftCustomView.heightAnchor.constraint(
                equalToConstant: 44
            ),

            backButton.leadingAnchor.constraint(
                equalTo: leftCustomView.leadingAnchor
            ),
            backButton.trailingAnchor.constraint(equalTo: leftCustomView.trailingAnchor),
            backButton.centerYAnchor.constraint(
                equalTo: leftCustomView.centerYAnchor
            )
        ])
    }
}

/// Расширение для установки расположений и размеров UI элементов

extension DishesDetailViewController {
    private func configureTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.layoutMarginsGuide.topAnchor
            ),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

/// Расширение для добавления @objc методов
extension DishesDetailViewController {
    @objc private func didTapBackButton() {
        presenter?.moveToDishes()
    }

    @objc private func didTapShareButton() {
        fileManagerService?.sendInfoToDirectory(
            txtFileName: Constants.Texts.sharingTxt,
            content: Constants.Texts.sharingContent
        )
        presenter?.showActivityController()
    }

    @objc private func didTapAddToFavoritesButton() {
        guard let dishDetail = dishDetail else { return }
        // presenter?.updateStateForDish(dishDetail)

        checkIsDishInFavorites(dishDetail)
        updateFavoriteButton(isFavorite: isFavoriteDish)
    }
}
