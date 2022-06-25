//
//  String+Extension.swift
//  Alias
//
//  Created by Aleksandr on 16.05.2022.
//

import Foundation

// MARK: - Localization
extension String {
    func commented(_ argument: String) -> String {
        return self
    }
    
    func localizedFormat(arguments: CVarArg..., in bundle: Bundle? = .main) -> String {
        return String(format: localized(in: bundle), arguments: arguments)
    }
    
    func localizedPlural(argument: CVarArg, in bundle: Bundle? = .main) -> String {
        return NSString.localizedStringWithFormat(localized(in: bundle) as NSString, argument) as String
    }
    
    func localized(using tableName: String? = nil, in bundle: Bundle? = .main) -> String {
        let bundle: Bundle = bundle ?? .main
        if let path = bundle.path(forResource: Localize.shared.currentLanguage, ofType: "lproj"),
           let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: tableName)
        } else if let path = bundle.path(forResource: Localize.shared.baseBundle, ofType: "lproj"),
                  let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: tableName)
        }
        return self
    }
    
    func localizedFormat(arguments: CVarArg..., using tableName: String?, in bundle: Bundle?) -> String {
        return String(format: localized(using: tableName, in: bundle), arguments: arguments)
    }
    
    func localizedPlural(argument: CVarArg, using tableName: String?, in bundle: Bundle?) -> String {
        return NSString.localizedStringWithFormat(localized(using: tableName, in: bundle) as NSString, argument) as String
    }
    
    func localized(using tableName: String?) -> String {
        return localized(using: tableName, in: .main)
    }
    
    func localizedFormat(arguments: CVarArg..., using tableName: String?) -> String {
        return String(format: localized(using: tableName), arguments: arguments)
    }
    
    func localizedPlural(argument: CVarArg, using tableName: String?) -> String {
        return NSString.localizedStringWithFormat(localized(using: tableName) as NSString, argument) as String
    }
}
