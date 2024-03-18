// DishImageViewShimmerTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с изображением блюда
final class DishImageShimmerTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "DishImageShimmerTableViewCell"
        static let weightImageName = "totalWightIcon"
        static let cookingTimeImageName = "timer"
        static let viewBackgroundColor = UIColor(
            red: 112 / 255,
            green: 185 / 255,
            blue: 190 / 255,
            alpha: 0.6
        )

        enum Insets {
            static let top: CGFloat = 20
            static let leading: CGFloat = 12
            static let trailing: CGFloat = -12
            static let size: CGFloat = 300
            static let totalWightSize: CGFloat = 50
        }

        enum Texts {
            static let verdanaFont = "Verdana"
            static let verdanaBoldFont = "Verdana-Bold"
        }
    }

    // MARK: - Visual Components

    private let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 46
        view.clipsToBounds = true
        return view
    }()

    private let mainViewLayer = CAGradientLayer()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        configureMainViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        configureMainViewConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradientLayer(
            view: mainView,
            layer: mainViewLayer,
            key: "mainView",
            animation: makeAnimationGroup()
        )
    }

    // MARK: - Private Methods

    private func makeAnimationGroup() -> CAAnimationGroup {
        let animationDuration: CFTimeInterval = 1.5

        let firstAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        firstAnimation.fromValue = UIColor.white.cgColor
        firstAnimation.toValue = UIColor.textFieldBorder.cgColor
        firstAnimation.duration = animationDuration
        firstAnimation.beginTime = 0.0

        let secondAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        secondAnimation.fromValue = UIColor.textFieldBorder.cgColor
        secondAnimation.toValue = UIColor.white.cgColor
        secondAnimation.duration = animationDuration
        secondAnimation.beginTime = firstAnimation.beginTime + firstAnimation.duration

        let group = CAAnimationGroup()
        group.animations = [firstAnimation, secondAnimation]
        group.repeatCount = .greatestFiniteMagnitude
        group.duration = secondAnimation.beginTime + secondAnimation.duration
        group.isRemovedOnCompletion = false

        return group
    }

    func setupGradientLayer(view: UIView, layer: CAGradientLayer, key: String, animation: CAAnimationGroup) {
        layer.frame = view.bounds
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)

        layer.cornerRadius = view.layer.cornerRadius
        view.layer.addSublayer(layer)
        layer.add(animation, forKey: key)
    }

    private func setupSubviews() {
        contentView.addSubviews([
            mainView
        ])
    }

    private func configureMainViewConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 20
            ),
            mainView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            mainView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            mainView.widthAnchor.constraint(
                equalToConstant: Constants.Insets.size
            ),
            mainView.heightAnchor.constraint(
                equalToConstant: Constants.Insets.size
            )
        ])
    }
}
