// FileManagerService.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Сервиз для управления хранением данных
final class FileManagerService {
    let fileManager = FileManager.default

    func fetchImageFromDirectory(with imageName: String) -> UIImage? {
        guard let documentsDirectory = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first else {
            print("Не удалось получить путь к директории документов")
            return nil
        }

        let fileURL = documentsDirectory.appendingPathComponent(imageName)

        if fileManager.fileExists(atPath: fileURL.path) {
            if let imageData = try? Data(contentsOf: fileURL), let image = UIImage(data: imageData) {
                return image
            } else {
                print("Не удалось создать изображение из данных файла")
                return nil
            }
        } else {
            print("Файл с именем \(imageName) не найден")
            return nil
        }
    }

    func sendImageToDirectory(imageURL: URL, imageName: String) {
        guard let documentsDirectory = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first
        else {
            print("Не удалось получить путь к директории документов")
            return
        }

        let fileURL = documentsDirectory.appendingPathComponent(imageName)

        if fileManager.fileExists(atPath: fileURL.path) {
            print("Файл с именем \(imageName) уже существует.")
            return
        } else {
            do {
                let imageData = try Data(contentsOf: imageURL)
                try imageData.write(to: fileURL, options: .atomic)
                print("Изображение было успешно сохранено.")
            } catch {
                print("Ошибка при сохранении изображения: \(error)")
            }
        }
    }

    func sendInfoToDirectory(txtFileName: String, content: String) {
        guard let documentsDirectory = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first else {
            return
        }

        let fileURL = documentsDirectory.appendingPathComponent(txtFileName)
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
            }
        } catch {
            print("Ошибка при работе с файлом: \(error)")
        }
    }
}
