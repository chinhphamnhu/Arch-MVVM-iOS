//
//  Language.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import Foundation

enum Language: Equatable {
    case english(English)
    case japanese

    enum English {
        case us
        case uk
    }
}

extension Language {

    var code: String {
        switch self {
        case .english(let english):
            switch english {
            case .us: return "en"
            case .uk: return "en-GB"
            }
        case .japanese: return "ja"
        }
    }

    var name: String {
        switch self {
        case .english(let english):
            switch english {
            case .us: return "English"
            case .uk: return "English (UK)"
            }
        case .japanese: return "日本語"
        }
    }
}

extension Language {
    init?(languageCode: String?) {
        guard let languageCode = languageCode else { return nil }
        switch languageCode {
        case "en": self = .english(.us)
        case "en-GB": self = .english(.uk)
        case "ja": self = .japanese
        default: return nil
        }
    }
}
