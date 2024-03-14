// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия с View
protocol ProfileViewControllerProtocol: AnyObject {
    /// Показывает алерт с выходом из учетной записи
    func showLogoutAlert()
    /// Показывает алерт со сменой имени
    func showNameChangeAlert()
}

/// Экран прoфиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"
        static let navigationBarTitle = "Profile"
        static let alertChangeNameTitle = "Change your name and surname"
        static let alertTextFieldPlaceholder = "Name Surname"
        static let cancelActionTitle = "Cancel"
        static let okActionTextTitle = "Ok"
        static let alertLogoutTitle = "Are you sure you want to\nlog out?"
        static let defaultUserName = "Surname Name"
        static let defaultProfileImageName = "profileAvatarImage"
        static let cardViewHeightMultiplier = 0.9
        static let cardHandleAreaHeight: CGFloat = 150
        static let cardViewCornerRadius: CGFloat = 30

        enum Texts {
            static let txt = "navigations.txt"
            static let content = "Пользователь открыл Экран профиля"
            static let defaultUsername = "Name SurName"
        }
    }

    enum CardState {
        case expanded
        case collapsed
    }

    private let caretaker = Caretaker()
    private let termsOfUseStorage = TermsOfUseStorage()

    // MARK: - Visual Components

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserInfoTableCell.self, forCellReuseIdentifier: UserInfoTableCell.Constants.identifier)
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: OptionsTableViewCell.Constants.identifier)
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    // MARK: Public Properties

    var presenter: ProfilePresenterProtocol?
    var fileManagerService: FileManagerService?
    var passTextToCellHandler: StringHandler?

    // MARK: - Private Properties

    private lazy var cardView = CardView(frame: .zero, viewController: self)
    private var cardHeight: CGFloat = 0
    private var cardHandleAreaHeight: CGFloat = 0
    private var cardVisible = false
    private var nextState: CardState {
        cardVisible ? .collapsed : .expanded
    }

    private var runningAnimations: [UIViewPropertyAnimator] = []
    private var animationProggresWhenInterrupted: CGFloat = 0
    private var defaultUserName = Constants.defaultUserName
    private var defaultProfileImageName = Constants.defaultProfileImageName
    private var profileImage: UIImage?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupNavigationBar()
        setupTableViewConstraints()
        fetchUserInfo()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchUserInfo()
        fileManagerService?.sendInfoToDirectory(
            txtFileName: Constants.Texts.txt,
            content: Constants.Texts.content
        )
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureCardView()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews([
            tableView
        ])
        view.backgroundColor = .white
    }

    private func configureCardView() {
        cardView.frame = CGRect(
            x: 0,
            y: view.frame.height - cardHandleAreaHeight,
            width: view.bounds.width,
            height: cardHeight
        )
        cardHeight = view.frame.size.height * Constants.cardViewHeightMultiplier
        cardHandleAreaHeight = Constants.cardHandleAreaHeight
        cardView.setLabelText(
            title: termsOfUseStorage.termsOfUse.title,
            text: termsOfUseStorage.termsOfUse.text
        )
    }

    private func setupNavigationBar() {
        navigationItem.title = Constants.navigationBarTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            )
        ])
    }

    private func setupCardView() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = Constants.cardViewCornerRadius
        view.addSubview(cardView)

        let panGestureRecognizer = UIPanGestureRecognizer(
            target: self,
            action: #selector(handleCardPan(recognizer:))
        )

        cardView.addGestureRecognizer(
            panGestureRecognizer
        )
    }

    private func fetchUserInfo() {
        if let userData = caretaker.loadUserData(for: Login.login) {
            print(userData)
            if let userName = userData.userName {
                defaultUserName = userName
            }
            if let profileImageName = userData.imageName {
                defaultProfileImageName = profileImageName
                profileImage = UIImage(contentsOfFile: profileImageName)
            }
            tableView.reloadData()
        }
    }

    func saveImageToFileSystem(_ image: UIImage, quality: CGFloat = 1.0) -> URL? {
        guard let imageData = image.jpegData(compressionQuality: quality) else { return nil }

        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first else {
            return URL(string: "")
        }
        let fileName = UUID().uuidString + ".jpeg"
        let fileURL = documentsDirectory.appendingPathComponent(fileName)

        do {
            try imageData.write(to: fileURL)
            return fileURL
        } catch {
            print("Error saving image: \(error)")
            return nil
        }
    }

    private func updateUserInfo(
        with userName: String?,
        profileImageName: String?
    ) {
        if let userData = caretaker.loadUserData(for: Login.login) {
            let name = userName == nil && userData.userName == nil
                ? defaultUserName
                : userName == nil ? userData.userName : userName

            let imageName = profileImageName == nil && userData.imageName == nil
                ? defaultProfileImageName
                : profileImageName == nil ? userData.imageName : profileImageName

            let updatedUserData = UserData(
                userName: name,
                login: userData.login,
                password: userData.password,
                imageName: imageName
            )
            do {
                try caretaker.saveUserData(updatedUserData, key: Login.login)
            } catch {}
        }
    }

    // private func nameFromImage

    @objc func imagePickerTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
}

// MARK: - ProfileViewController + UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.loadProfileCellTypes().count ?? 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellType = presenter?.loadProfileCellTypes()[section]
        switch cellType {
        case .userInfo, .bonuses, .privacy, .logout:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let safePresenter = presenter else { return UITableViewCell() }

        let cellType = safePresenter.loadProfileCellTypes()[indexPath.section]
        switch cellType {
        case .userInfo:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: UserInfoTableCell.Constants.identifier,
                for: indexPath
            ) as? UserInfoTableCell else { return UITableViewCell() }
            cell.configureCell(info: safePresenter.loadInfo().userInfo)
            cell.showAlert = { [weak self] in
                self?.presenter?.showNameChangeAlert()
            }
            cell.onImageTap = { [weak self] in
                guard let self else { return }
                self.imagePickerTapped()
            }
            if defaultProfileImageName != Constants.defaultProfileImageName {
                if let image = UIImage(contentsOfFile: defaultProfileImageName) {
                    cell.changeUserAvatar(image: image)
                }
            }

            if let profileImage = profileImage {
                cell.changeUserAvatar(image: profileImage)
            }

            if let newUserName = caretaker.loadUserData(
                for: Login.login
            )?.userName {
                cell.changeUserName(text: newUserName)
            }
            passTextToCellHandler = { text in
                cell.changeUserName(text: text)
                self.updateUserInfo(
                    with: text,
                    profileImageName: nil
                )
            }
            return cell
        case .bonuses:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: OptionsTableViewCell.Constants.identifier,
                for: indexPath
            ) as? OptionsTableViewCell else { return UITableViewCell() }
            cell.configureCell(info: safePresenter.loadInfo().bonuses)
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            return cell
        case .privacy:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: OptionsTableViewCell.Constants.identifier,
                for: indexPath
            ) as? OptionsTableViewCell else { return UITableViewCell() }
            cell.configureCell(info: safePresenter.loadInfo().privacy)
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            return cell
        case .logout:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: OptionsTableViewCell.Constants.identifier,
                for: indexPath
            ) as? OptionsTableViewCell else { return UITableViewCell() }
            cell.configureCell(info: safePresenter.loadInfo().logout)
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
}

// MARK: - ProfileViewController + UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCell = presenter?.loadProfileCellTypes()[indexPath.section]
        switch selectedCell {
        case .userInfo:
            return
        case .bonuses:
            presenter?.pushBonusView()
        case .privacy:
            tabBarController?.tabBar.isHidden = true
            setupCardView()
        case .logout:
            presenter?.showLogoutAlert()
        default:
            break
        }
    }
}

// MARK: - ProfileViewController + ProfileViewControllerProtocol

extension ProfileViewController: ProfileViewControllerProtocol {
    func showNameChangeAlert() {
        let alert = UIAlertController(title: Constants.alertChangeNameTitle, message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = Constants.alertTextFieldPlaceholder
            let cancelAction = UIAlertAction(
                title: Constants.cancelActionTitle,
                style: .cancel
            )
            let okAction = UIAlertAction(
                title: Constants.okActionTextTitle,
                style: .default
            ) { [weak self] _ in
                let userText = alert.textFields?.first?.text
                self?.passTextToCellHandler?(userText ?? "blank")
            }
            alert.addAction(cancelAction)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }

    func showLogoutAlert() {
        let alert = UIAlertController(
            title: Constants.alertLogoutTitle,
            message: nil,
            preferredStyle: .alert
        )
        let cancelAction = UIAlertAction(
            title: Constants.cancelActionTitle,
            style: .cancel
        )
        let okAction = UIAlertAction(
            title: Constants.okActionTextTitle,
            style: .default
        ) { [weak self] _ in
            self?.presenter?.logout()
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

/// Расширение для добавлении логики property animator
extension ProfileViewController {
    @objc private func handleCardPan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startInteractiveTransition(
                state: nextState,
                duration: 0.9
            )
            navigationController?.navigationBar.isHidden = true
        case .changed:
            let translation = recognizer.translation(in: cardView)
            var fractionComplete = translation.y / cardHeight
            fractionComplete = cardVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionComplited: fractionComplete)
        case .ended:
            continueInteractiveTransition()
            switch nextState {
            case .collapsed:
                tabBarController?.tabBar.isHidden = false
                navigationController?.navigationBar.isHidden = false
            default:
                break
            }

        default:
            break
        }
    }

    private func animateTransitionIfNeeded(state: CardState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(
                duration: duration,
                dampingRatio: 1
            ) {
                switch state {
                case .expanded:
                    self.cardView.frame.origin.y = self.view.frame.height - self.cardHeight
                case .collapsed:
                    self.cardView.frame.origin.y = self.view.frame.height
                }
            }

            frameAnimator.addCompletion { _ in
                self.cardVisible.toggle()
                self.runningAnimations.removeAll()
            }
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
        }
    }

    private func startInteractiveTransition(
        state: CardState,
        duration: TimeInterval
    ) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(
                state: state,
                duration: duration
            )
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProggresWhenInterrupted = animator.fractionComplete
        }
    }

    private func updateInteractiveTransition(fractionComplited: CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionComplited + animationProggresWhenInterrupted
        }
    }

    private func continueInteractiveTransition() {
        for animator in runningAnimations {
            animator.continueAnimation(
                withTimingParameters: nil,
                durationFactor: 0
            )
        }
    }
}

/// расширение для использования галерии чтобы поменять фото профиля
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if let fileURL = saveImageToFileSystem(pickedImage) {
                defaultProfileImageName = fileURL.path
            }
            updateUserInfo(
                with: nil,
                profileImageName: defaultProfileImageName
            )
            tableView.reloadData()
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
