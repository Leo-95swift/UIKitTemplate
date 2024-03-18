// NutrientsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для количества КБЖУ
final class NutrientsTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "NutrientsTableViewCell"

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

    private lazy var enercKcalNutriantStackView = makeNutriantStackView(
        nutriantName: Constants.Texts.enercKcalLabelText,
        nutriantCountLabel: enercKalCountLabel
    )

    private lazy var enercKalCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textColor = .myBackground
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = .myFont(fontName: Constants.Texts.verdanaFont, fontSize: 10)
        return label
    }()

    private lazy var carbohydratesKcalNutriantStackView = makeNutriantStackView(
        nutriantName: Constants.Texts.carbohydratesLabelText,
        nutriantCountLabel: carhbohydratesCountLabel
    )

    private let carhbohydratesCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textColor = .myBackground
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = .myFont(fontName: Constants.Texts.verdanaFont, fontSize: 10)
        return label
    }()

    private lazy var fatsNutriantStackView = makeNutriantStackView(
        nutriantName: Constants.Texts.fatsLabelText,
        nutriantCountLabel: fatsCountLabel
    )

    private let fatsCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textColor = .myBackground
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = .myFont(fontName: Constants.Texts.verdanaFont, fontSize: 10)
        return label
    }()

    private lazy var proteinsNutriantStackView = makeNutriantStackView(
        nutriantName: Constants.Texts.proteinsLabelText,
        nutriantCountLabel: proteinsCountLabel
    )

    private let proteinsCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textColor = .myBackground
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = .myFont(fontName: Constants.Texts.verdanaFont, fontSize: 10)
        return label
    }()

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

    // MARK: - Public Methods

    func configure(data: DishDetail) {
        enercKalCountLabel.text = makeNutrientLabelText(
            count: Double(data.calories),
            type: "kcal"
        )
        carhbohydratesCountLabel.text = makeNutrientLabelText(
            count: data.chocdf,
            type: "g"
        )
        fatsCountLabel.text = makeNutrientLabelText(
            count: data.fats,
            type: "g"
        )
        proteinsCountLabel.text = makeNutrientLabelText(
            count: data.proteins,
            type: "g"
        )
    }

    private func makeNutrientLabelText(count: Double, type: String) -> String {
        let roundedCount = count.rounded()
        let stringCount = String(Int(roundedCount))
        let result = stringCount + " " + type

        return result
    }

    // MARK: - Private Methods

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
extension NutrientsTableViewCell {
    private func makeNutriantStackView(
        nutriantName: String,
        nutriantCountLabel: UILabel
    ) -> UIStackView {
        lazy var nutrientStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            stackView.backgroundColor = UIColor.myBackground
            stackView.layer.cornerRadius = 16
            stackView.layer.masksToBounds = false
            stackView.layer.borderColor = UIColor.myBackground.cgColor
            stackView.layer.borderWidth = 2

            stackView.addArrangedSubviews([
                nutrientTypeLabel,
                nutriantCountLabel
            ])
            return stackView
        }()

        let nutrientTypeLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.text = nutriantName
            label.textAlignment = .center
            label.textColor = .white

            label.font = .myFont(fontName: Constants.Texts.verdanaFont, fontSize: 9)
            return label
        }()
        return nutrientStackView
    }
}
