// DetailRecipeShimmerTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для подробного описания рецепта
final class DetailRecipeShimmerTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "DetailRecipeShimmerTableViewCell"

        enum Insets {
            static let gradientStartPoint = CGPoint(x: 0.5, y: 0)
            static let gradientEndPoint = CGPoint(x: 0.5, y: 1)
        }

        enum Texts {
            static let verdanaFont = "Verdana"
            static let verdanaBoldFont = "Verdana-Bold"
            static let shimmerText = """
                            asdasdasdsadadadadadaasdasdasdsadadadadadaasd
            asdasdsadadadadadaasdasdasdsadadada
            """
        }
    }

    // MARK: - Visual Components

    private let recipeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        return view
    }()

    private let recipeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .loginLabelForeground
        label.font = .myFont(fontName: Constants.Texts.verdanaFont, fontSize: 14)
        label.text = Constants.Texts.shimmerText
        return label
    }()

    // MARK: - Private Properties

    private let recipeLabelLayer = CAGradientLayer()
    private let gradientLayer = CAGradientLayer()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        configureRecipeViewConstraints()
        configureRecipeLabelConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        configureRecipeViewConstraints()
        configureRecipeLabelConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradientLayer()
        setupShimmer(view: recipeLabel, layer: recipeLabelLayer, key: "recipeLabel", animation: makeAnimationGroup())
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

    private func setupShimmer(view: UIView, layer: CAGradientLayer, key: String, animation: CAAnimationGroup) {
        layer.frame = view.bounds
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)

        layer.cornerRadius = view.layer.cornerRadius
        view.layer.addSublayer(layer)
        layer.add(animation, forKey: key)
    }

    private func setupSubviews() {
        contentView.addSubviews([recipeView], prepareForAutolayout: true)
        recipeView.addSubviews([recipeLabel], prepareForAutolayout: true)
    }

    private func setupGradientLayer() {
        gradientLayer.frame = recipeView.bounds
        gradientLayer.colors = [
            UIColor(.gradientBlue).cgColor,
            UIColor(.gradientWhite).cgColor
        ]
        gradientLayer.startPoint = Constants.Insets.gradientStartPoint
        gradientLayer.endPoint = Constants.Insets.gradientEndPoint
        recipeView.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func configureRecipeViewConstraints() {
        NSLayoutConstraint.activate([
            recipeView.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 20
            ),
            recipeView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            recipeView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            recipeView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            )
        ])
    }

    private func configureRecipeLabelConstraints() {
        NSLayoutConstraint.activate([
            recipeLabel.topAnchor.constraint(
                equalTo: recipeView.topAnchor,
                constant: 27
            ),
            recipeLabel.leadingAnchor.constraint(
                equalTo: recipeView.leadingAnchor, constant: 27
            ),
            recipeLabel.trailingAnchor.constraint(
                equalTo: recipeView.trailingAnchor, constant: -27
            ),
            recipeLabel.widthAnchor.constraint(
                equalToConstant: 336
            ),
            recipeLabel.bottomAnchor.constraint(
                equalTo: recipeView.bottomAnchor
            ),
        ])
    }
}
