//
//  Vocabulary.swift
//  Alias
//
//  Created by Aleksandr on 11.05.2022.
//

import Foundation

enum VocabularyDifficulty: String {
    case easy
    case normal
    case hard
}

struct Vocabulary {
    let title: String
    let discription: String
    let difficulty: VocabularyDifficulty
    let isFree: Bool
    let language: Language
    let words: [String]
    
    var count: Int {
        words.count
    }
    
    var example: String {
        let exampleWords = words[0..<4]
        return exampleWords.joined(separator: ", ")
    }
}
