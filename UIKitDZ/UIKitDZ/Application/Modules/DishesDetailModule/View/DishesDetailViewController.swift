// DishesDetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия с view
protocol DishesDetailViewControllerProtocol: AnyObject {
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
        presenter?.fetchDish()
        setupNavigationBar()
        setupSubviews()
        configureTableViewConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchDish()
        fileManagerService?.sendInfoToDirectory(
            txtFileName: Constants.Texts.navigationTxt,
            content: Constants.Texts.navigationContent
        )
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
}

// MARK: - DishesDetailViewController + UITableViewDataSource

extension DishesDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cellTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch cellTypes[section] {
        case .dishImageItem, .dishRecipe, .nutrients:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let safeDish = dishDetail else { return UITableViewCell() }
        let cellType = cellTypes[indexPath.section]
        switch cellType {
        case .dishImageItem:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DishImageTableViewCell.Constants.identifier,
                for: indexPath
            ) as? DishImageTableViewCell else { return UITableViewCell() }
            cell.configure(data: safeDish)
            return cell
        case .nutrients:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NutrientsTableViewCell.Constants.identifier,
                for: indexPath
            ) as? NutrientsTableViewCell else { return UITableViewCell() }
            cell.configure(data: safeDish)
            return cell
        case .dishRecipe:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DetailRecipeTableViewCell.Constants.identifier,
                for: indexPath
            ) as? DetailRecipeTableViewCell else { return UITableViewCell() }
            cell.configure(data: safeDish)
            return cell
        }
    }
}

// MARK: - DishesDetailViewController + UITableViewDelegate

extension DishesDetailViewController: UITableViewDelegate {
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
