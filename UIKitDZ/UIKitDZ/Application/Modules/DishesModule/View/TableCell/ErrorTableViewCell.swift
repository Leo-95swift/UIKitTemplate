// ErrorTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для отображения ошибки загрузки данных
class ErrorTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "ErrorTableViewCell"
        static let lightningImageName = "lightningImage"
        static let reloadImageName = "reloadImage"
        static let errorLabelText = "Failed to load data"
        static let reloadLabelText = "Reload"
        static let verdanaFont = "Verdana"
    }

    // MARK: - Visual Components

    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private let lightningImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.lightningImageName))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let lightningView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .mySearchBarBackground
        return view
    }()

    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.errorLabelText
        label.textAlignment = .center
        label.textColor = .myMessageLabel
        label.font = .myFont(fontName: Constants.verdanaFont, fontSize: 14)
        return label
    }()

    private let reloadStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.layer.cornerRadius = 12
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.backgroundColor = .mySearchBarBackground
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    private let reloadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: Constants.reloadImageName)
        return imageView
    }()

    private let reloadLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.reloadLabelText
        label.textColor = .myMessageLabel
        label.font = .myFont(fontName: Constants.verdanaFont, fontSize: 14)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLightningImageViewConstraints()
        setupLightningViewConstraints()
        setupErrorLabelConstraints()
        setupReloadStackViewConstraints()
        setupMainStackView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupLightningImageViewConstraints()
        setupLightningViewConstraints()
        setupErrorLabelConstraints()
        setupReloadStackViewConstraints()
        setupMainStackView()
    }

    // MARK: - Private Methods

    func setupViews() {
        contentView.addSubviews([mainStackView])
        lightningView.addSubviews([lightningImageView])
        reloadStackView.addArrangedSubviews([reloadImageView, reloadLabel])
        mainStackView.addArrangedSubviews([lightningView, errorLabel, reloadStackView])
    }

    func setupLightningImageViewConstraints() {
        lightningImageView.centerXAnchor.constraint(equalTo: lightningView.centerXAnchor).isActive = true
        lightningImageView.centerYAnchor.constraint(equalTo: lightningView.centerYAnchor).isActive = true
        lightningImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        lightningImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }

    func setupLightningViewConstraints() {
        lightningView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        lightningView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func setupErrorLabelConstraints() {
        errorLabel.topAnchor.constraint(equalTo: lightningView.bottomAnchor, constant: 17).isActive = true
        errorLabel.centerXAnchor.constraint(equalTo: lightningView.centerXAnchor).isActive = true
    }

    func setupReloadStackViewConstraints() {
        reloadStackView.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 25).isActive = true
        reloadStackView.centerXAnchor.constraint(equalTo: errorLabel.centerXAnchor).isActive = true
        reloadStackView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        reloadStackView.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }

    func setupMainStackView() {
        mainStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
