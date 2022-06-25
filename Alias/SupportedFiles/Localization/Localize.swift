//
//  Localize.swift
//  Alias
//
//  Created by Aleksandr on 15.05.2022.
//

import Foundation

final class Localize {
    
    static let shared = Localize()
    
    let baseBundle = "Base"
    private let currentLanguageKey = "AliasCurrentLanguageKey"
    private let startedLanguage = "uk"
    
    var defaultLanguage: String {
        guard let preferredLanguage = Bundle.main.preferredLocalizations.first else { return startedLanguage }
        let availableLanguages: [String] = availableLanguages()
        return availableLanguages.contains(preferredLanguage) ? preferredLanguage : startedLanguage
    }
    
    var currentLanguage: String {
        guard let currentLanguage = UserDefaults.standard.object(forKey: currentLanguageKey) as? String else { return defaultLanguage }
        return currentLanguage
    }
    
    private init() {}
    
    func availableLanguages(_ excludeBase: Bool = true) -> [String] {
        var availableLanguages = Bundle.main.localizations
        if excludeBase,
           let indexOfBase = availableLanguages.firstIndex(of: "Base") {
            availableLanguages.remove(at: indexOfBase)
        }
        return availableLanguages
    }
    
    func setCurrentLanguage(_ language: String) {
        let selectedLanguage = availableLanguages().contains(language) ? language : defaultLanguage
        if selectedLanguage != currentLanguage {
            UserDefaults.standard.set(selectedLanguage, forKey: currentLanguageKey)
            UserDefaults.standard.synchronize()
            NotificationCenter.default.post(name: .languageChange, object: nil)
        }
    }
    
    func resetCurrentLanguageToDefault() {
        setCurrentLanguage(defaultLanguage)
    }
    
    func displayNameForLanguage(_ language: String) -> String {
        let locale = NSLocale(localeIdentifier: currentLanguage)
        return locale.displayName(forKey: NSLocale.Key.identifier, value: language) ?? ""
    }
}
