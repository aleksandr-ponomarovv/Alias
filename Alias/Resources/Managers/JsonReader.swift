//
//  JsonReader.swift
//  Alias
//
//  Created by Aleksandr on 10.04.2022.
//

import Foundation

class JsonReader {
    static func readLocalFile<T: Codable>(for name: FileNames) -> T? {
        guard let bundlePath = Bundle.main.path(forResource: name.rawValue, ofType: "json"),
              let jsonData = try? String(contentsOfFile: bundlePath).data(using: .utf8),
              let decodedData = try? JSONDecoder().decode(T.self, from: jsonData) else { return nil }
        return decodedData
    }
}
