// TotalDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Структура представляющая кол-во КБЖУ
struct TotalDTO: Codable {
    // Количество КБЖУ
    let quantity: Double
    // Единица измерения
    let unit: String
}
