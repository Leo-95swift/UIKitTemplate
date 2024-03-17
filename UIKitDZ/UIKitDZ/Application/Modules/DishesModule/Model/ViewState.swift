// ViewState.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Состояние  данных на экране Блюд
public enum ViewState<Model> {
    /// Данные загружаются
    case loading
    /// Есть данные
    case data(_ dishes: Model)
    /// Нет данных
    case noData
    /// Ошибка
    case error
}
