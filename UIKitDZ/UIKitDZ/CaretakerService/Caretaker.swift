// Caretaker.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// hbb
class Caretaker {
    // MARK: - Types

    typealias Memento = Data

    // MARK: - Constants

    public enum Error: Swift.Error {
        case gameNotFound
    }

    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

    // MARK: - Public Methodes

    func saveUserData(_ userData: UserData, key: String) throws {
        let data = try encoder.encode(userData)
        UserDefaults.standard.set(data, forKey: key)
    }

    func loadUserData(for login: String) -> UserData? {
        guard let data = UserDefaults.standard.value(forKey: login) as? Data,
              let userData = try? decoder.decode(UserData.self, from: data)
        else { return nil }

        return userData
    }
}
