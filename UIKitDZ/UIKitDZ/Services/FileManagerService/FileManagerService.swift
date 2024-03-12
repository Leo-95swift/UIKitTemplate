// FileManagerService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Сервиз для управления хранением данных
final class FileManagerService {
    let fileManager = FileManager.default

    func sendInfoToDirectory(txtFileName: String, content: String) {
        guard let documentsDirectory = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first else {
            return
        }

        let fileURL = documentsDirectory.appendingPathComponent(txtFileName)
        print("aaa \(fileURL.path())")
        do {
            if fileManager.fileExists(atPath: fileURL.path) {
                let existingContentData = try Data(contentsOf: fileURL)
                let existingContent = String(
                    data: existingContentData,
                    encoding: .utf8
                ) ?? ""
                let combinedContent = "\(existingContent)\n\(content) \(Date())"
                if let combinedContentData = combinedContent.data(using: .utf8) {
                    try combinedContentData.write(to: fileURL, options: .atomic)
                }
            } else {
                let combinedContent = "\(content) \(Date())"
                guard let contentData = combinedContent.data(using: .utf8)
                else { return }
                fileManager.createFile(
                    atPath: fileURL.path,
                    contents: contentData,
                    attributes: nil
                )
                print(" documentDirectory is \(documentsDirectory.path)")
            }
        } catch {
            print("Ошибка при работе с файлом: \(error)")
        }
    }
}
