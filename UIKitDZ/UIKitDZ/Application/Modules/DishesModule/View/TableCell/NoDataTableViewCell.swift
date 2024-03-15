// NoDataTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class NoDataTableViewCell: UITableViewCell {
    enum Constants {
        static let identifier = "NoDataTableViewCell"
        static let lightningImageName = "lightningImage"
        static let reloadImageName = "reloadImage"
        static let nodataLabelText = "No Data Received"
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

    private let noDataLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.nodataLabelText
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
        mainStackView.addArrangedSubviews([lightningView, noDataLabel, reloadStackView])
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
        noDataLabel.topAnchor.constraint(equalTo: lightningView.bottomAnchor, constant: 17).isActive = true
        noDataLabel.centerXAnchor.constraint(equalTo: lightningView.centerXAnchor).isActive = true
    }

    func setupReloadStackViewConstraints() {
        reloadStackView.topAnchor.constraint(equalTo: noDataLabel.bottomAnchor, constant: 25).isActive = true
        reloadStackView.centerXAnchor.constraint(equalTo: noDataLabel.centerXAnchor).isActive = true
        reloadStackView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        reloadStackView.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }

    func setupMainStackView() {
        mainStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
