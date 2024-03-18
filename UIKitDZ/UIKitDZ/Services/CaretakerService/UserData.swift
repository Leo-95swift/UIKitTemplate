// UserData.swift
// Copyright © RoadMap. All rights reserved.

/// краткое опысание для информации о пользователе
struct UserData: Codable, Equatable {
    // Имя пользователя
    let userName: String?
    // логин пользователя
    let login: String
    // Название картинки пользователя
    let imageName: String?
}
