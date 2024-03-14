// UserInfoTableCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Информация о пользователе
final class UserInfoTableCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "UserInfoTableCell"

        enum Insets {
            static let top: CGFloat = 36
            static let imageSize: CGFloat = 160
            static let halfImageSize: CGFloat = 80
        }

        enum Texts {
            static let verdanaFont = "Verdana"
            static let verdanaBoldFont = "Verdana-Bold"
        }

        enum ImagesNames {
            static let pencilImageName = "pencil"
        }
    }

    // MARK: - Visual Components

    private var profileAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ProfileStorage.Constants.avatarImageName)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = Constants.Insets.halfImageSize
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private var profileImageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .optionsLabelText
        label.textAlignment = .center
        label.font = .myFont(
            fontName: Constants.Texts.verdanaBoldFont,
            fontSize: 25
        )
        return label
    }()

    private lazy var pencilButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: Constants.ImagesNames.pencilImageName), for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .myDarkText
        button.addTarget(self, action: #selector(pencilButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Public Properties

    var showAlert: VoidHandler?
    var onImageTap: VoidHandler?

    // MARK: - Initalizers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        configureSubviews()
        setupImageTap()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        configureSubviews()
        setupImageTap()
    }

    // MARK: - Public Methods

    func configureCell(info: UserInfo) {
        profileAvatarImageView.image = UIImage(named: info.imageName)
        profileImageLabel.text = info.username
    }

    func changeUserName(text: String) {
        profileImageLabel.text = text
    }

    func changeUserAvatar(image: UIImage) {
        profileAvatarImageView.image = image
    }

    func changeUserAvatar(imageName: String) {
        profileAvatarImageView.image = UIImage(named: imageName)
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        contentView.addSubviews([
            profileAvatarImageView,
            profileImageLabel,
            pencilButton
        ])
    }

    private func configureSubviews() {
        setupProfileAvatarImageConstraints()
        setupNameLabelConstraints()
        setupPencilButtonConstraints()
    }

    private func setupImageTap() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(handleImageTap)
        )
        profileAvatarImageView.addGestureRecognizer(tapGesture)
        profileAvatarImageView.isUserInteractionEnabled = true
    }

    @objc private func pencilButtonTapped() {
        showAlert?()
    }

    @objc func handleImageTap() {
        onImageTap?()
    }
}

/// Расширение для установки расположений и размеров UI элементов
extension UserInfoTableCell {
    private func setupProfileAvatarImageConstraints() {
        NSLayoutConstraint.activate([
            profileAvatarImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.Insets.top
            ),
            profileAvatarImageView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            profileAvatarImageView.widthAnchor.constraint(
                equalToConstant: Constants.Insets.imageSize
            ),
            profileAvatarImageView.heightAnchor.constraint(
                equalToConstant: Constants.Insets.imageSize
            ),
        ])
    }

    private func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
            profileImageLabel.topAnchor.constraint(
                equalTo: profileAvatarImageView.bottomAnchor,
                constant: 26
            ),
            profileImageLabel.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            profileImageLabel.heightAnchor.constraint(
                equalToConstant: 30
            ),
            profileImageLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -29
            )
        ])
    }

    private func setupPencilButtonConstraints() {
        NSLayoutConstraint.activate([
            pencilButton.leadingAnchor.constraint(
                equalTo: profileImageLabel.trailingAnchor,
                constant: 8
            ),
            pencilButton.topAnchor.constraint(
                equalTo: profileImageLabel.topAnchor,
                constant: 3
            ),
            pencilButton.centerYAnchor.constraint(
                equalTo: profileImageLabel.centerYAnchor
            ),
            pencilButton.widthAnchor.constraint(
                equalToConstant: 24
            ),
            pencilButton.heightAnchor.constraint(
                equalToConstant: 24
            ),
        ])
    }
}
