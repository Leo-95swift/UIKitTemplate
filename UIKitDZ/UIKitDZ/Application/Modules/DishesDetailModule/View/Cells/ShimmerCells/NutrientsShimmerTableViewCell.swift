// NutrientsShimmerTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для количества КБЖУ
final class NutrientsShimmerTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "NutrientsShimmerTableViewCell"

        enum Insets {}

        enum Texts {
            static let verdanaFont = "Verdana"
            static let verdanaBoldFont = "Verdana-Bold"
            static let enercKcalLabelText = "Enerc kcal"
            static let carbohydratesLabelText = "Carbohydrates"
            static let fatsLabelText = "Fats"
            static let proteinsLabelText = "Proteins"
        }
    }

    // MARK: - Visual Components

    private lazy var enercKcalNutriantStackView = makeNutriantStackView()
    private lazy var carbohydratesKcalNutriantStackView = makeNutriantStackView()
    private lazy var fatsNutriantStackView = makeNutriantStackView()
    private lazy var proteinsNutriantStackView = makeNutriantStackView()
    private let enercKcalNutriantStackViewLayer = CAGradientLayer()
    private let carbohydratesKcalNutriantStackViewLayer = CAGradientLayer()
    private let fatsNutriantStackViewLayer = CAGradientLayer()
    private let proteinsNutriantStackViewLayer = CAGradientLayer()

    private lazy var nutrientsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.addArrangedSubviews([
            enercKcalNutriantStackView,
            carbohydratesKcalNutriantStackView,
            fatsNutriantStackView,
            proteinsNutriantStackView
        ])
        return stackView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        configureNutrientsStackViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        configureNutrientsStackViewConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configureLayers()
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

    private func setupGradientLayer(view: UIView, layer: CAGradientLayer, key: String, animation: CAAnimationGroup) {
        layer.frame = view.bounds
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)

        layer.cornerRadius = view.layer.cornerRadius
        view.layer.addSublayer(layer)
        layer.add(animation, forKey: key)
    }

    private func configureLayers() {
        setupGradientLayer(
            view: enercKcalNutriantStackView,
            layer: enercKcalNutriantStackViewLayer,
            key: "EnercKcal",
            animation: makeAnimationGroup()
        )
        setupGradientLayer(
            view: carbohydratesKcalNutriantStackView,
            layer: carbohydratesKcalNutriantStackViewLayer,
            key: "Carbohydrates",
            animation: makeAnimationGroup()
        )
        setupGradientLayer(
            view: fatsNutriantStackView,
            layer: fatsNutriantStackViewLayer,
            key: "Fats",
            animation: makeAnimationGroup()
        )
        setupGradientLayer(
            view: proteinsNutriantStackView,
            layer: proteinsNutriantStackViewLayer,
            key: "Proteins",
            animation: makeAnimationGroup()
        )
    }

    private func setupSubviews() {
        contentView.addSubviews([nutrientsStackView], prepareForAutolayout: true)
    }

    private func configureNutrientsStackViewConstraints() {
        NSLayoutConstraint.activate([
            nutrientsStackView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            nutrientsStackView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            nutrientsStackView.widthAnchor.constraint(
                equalToConstant: 311
            ),
            nutrientsStackView.heightAnchor.constraint(
                equalToConstant: 58
            )
        ])
    }
}

/// Расширение для добавления функции создающую nutriantsStackView
extension NutrientsShimmerTableViewCell {
    private func makeNutriantStackView() -> UIStackView {
        lazy var nutrientStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            stackView.layer.cornerRadius = 16
            stackView.layer.masksToBounds = false

            stackView.addArrangedSubviews([
                nutrientTypeLabel,
            ])
            return stackView
        }()

        let nutrientTypeLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.textAlignment = .center
            label.textColor = .white

            label.font = .myFont(fontName: Constants.Texts.verdanaFont, fontSize: 9)
            return label
        }()
        return nutrientStackView
    }
}
