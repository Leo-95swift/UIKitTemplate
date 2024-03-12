// UserDataMemento.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Краткое описание для структуры хранения данных
class UserDataMemento {
    var userDatas: [UserData] = []

    init(userDatas: [UserData]) {
        self.userDatas = userDatas
    }
}
