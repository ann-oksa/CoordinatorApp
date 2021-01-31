
import Foundation

// As all those models look weird,
// it make sense to explain why they look so (a hack from google api, auto generated code)
// https://www.labnol.org/code/19909-google-translate-api


enum PurpleTranslation: Codable {
    case string(String)
    case unionArrayArray([[TranslationTranslation]])
    case null

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([[TranslationTranslation]].self) {
            self = .unionArrayArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if container.decodeNil() {
            self = .null
            return
        }
        throw DecodingError.typeMismatch(PurpleTranslation.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for PurpleTranslation"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .unionArrayArray(let x):
            try container.encode(x)
        case .null:
            try container.encodeNil()
        }
    }
}

enum TranslationTranslation: Codable {
    case integer(Int)
    case string(String)
    case stringArrayArrayArray([[[String]]])
    case null

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode([[[String]]].self) {
            self = .stringArrayArrayArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if container.decodeNil() {
            self = .null
            return
        }
        throw DecodingError.typeMismatch(TranslationTranslation.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for TranslationTranslation"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        case .stringArrayArrayArray(let x):
            try container.encode(x)
        case .null:
            try container.encodeNil()
        }
    }
}

typealias Translation = [PurpleTranslation]
