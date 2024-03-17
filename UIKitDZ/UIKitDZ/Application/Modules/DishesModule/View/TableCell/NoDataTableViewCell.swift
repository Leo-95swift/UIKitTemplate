// NoDataTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class NoDataTableViewCell: UITableViewCell {
    enum Constants {
        static let identifier = "NoDataTableViewCell"
        static let searchImageName = "magnifyingglass"
        static let nodataLabelText = "Start typing text"
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

    private let searchImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: Constants.searchImageName))
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let searchView: UIView = {
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLightningImageViewConstraints()
        setupLightningViewConstraints()
        setupErrorLabelConstraints()
        setupMainStackView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupLightningImageViewConstraints()
        setupLightningViewConstraints()
        setupErrorLabelConstraints()
        setupMainStackView()
    }

    // MARK: - Private Methods

    func setupViews() {
        contentView.addSubviews([mainStackView])
        searchView.addSubviews([searchImageView])
        mainStackView.addArrangedSubviews([searchView, noDataLabel])
    }

    func setupLightningImageViewConstraints() {
        searchImageView.centerXAnchor.constraint(equalTo: searchView.centerXAnchor).isActive = true
        searchImageView.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        searchImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        searchImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }

    func setupLightningViewConstraints() {
        searchView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func setupErrorLabelConstraints() {
        noDataLabel.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 17).isActive = true
        noDataLabel.centerXAnchor.constraint(equalTo: searchView.centerXAnchor).isActive = true
    }

    func setupMainStackView() {
        mainStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
