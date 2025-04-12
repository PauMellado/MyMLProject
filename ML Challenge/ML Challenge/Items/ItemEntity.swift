//
//  Untitled.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 29/03/25.
//

import Foundation

// MARK: - Welcome
struct ReponseMLChallenge: Codable {
    let keywords: String
    let paging: Paging
    let results: [ResultML]
    
    init(keywords: String, paging: Paging, results: [ResultML]) {
        self.keywords = keywords
        self.paging = paging
        self.results = results
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.keywords = try container.decodeIfPresent(String.self, forKey: .keywords) ?? ""
        self.paging = try container.decodeIfPresent(Paging.self, forKey: .paging) ?? Paging(total: 0, limit: 0, offset: 0)
        self.results = try container.decodeIfPresent([ResultML].self, forKey: .results) ?? []
    }
}

// MARK: - Paging
struct Paging: Codable {
    let total, limit, offset: Int
    init(total: Int, limit: Int, offset: Int) {
        self.total = total
        self.limit = limit
        self.offset = offset
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.total = try container.decodeIfPresent(Int.self, forKey: .total) ?? 0
        self.limit = try container.decodeIfPresent(Int.self, forKey: .limit) ?? 0
        self.offset = try container.decodeIfPresent(Int.self, forKey: .offset) ?? 0
    }
}

// MARK: - Result
struct ResultML: Codable {
    let id, status, domainID: String
    let settings: Settings
    let name: String
    let mainFeatures: [JSONAny]
    let attributes: [AttributeML]
    let pictures: [Picture]
    let parentID: String
    let childrenIDS: [JSONAny]
    init(id: String, status: String, domainID: String, settings: Settings, name: String, mainFeatures: [JSONAny], attributes: [AttributeML], pictures: [Picture], parentID: String, childrenIDS: [JSONAny]) {
        self.id = id
        self.status = status
        self.domainID = domainID
        self.settings = settings
        self.name = name
        self.mainFeatures = mainFeatures
        self.attributes = attributes
        self.pictures = pictures
        self.parentID = parentID
        self.childrenIDS = childrenIDS
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        self.domainID = try container.decodeIfPresent(String.self, forKey: .domainID) ?? ""
        self.settings = try container.decodeIfPresent(Settings.self, forKey: .settings) ?? Settings(listingStrategy: "")
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.mainFeatures = try container.decodeIfPresent([JSONAny].self, forKey: .mainFeatures) ?? []
        self.attributes = try container.decodeIfPresent([AttributeML].self, forKey: .attributes) ?? []
        self.pictures = try container.decodeIfPresent([Picture].self, forKey: .pictures) ?? []
        self.parentID = try container.decodeIfPresent(String.self, forKey: .parentID) ?? ""
        self.childrenIDS = try container.decodeIfPresent([JSONAny].self, forKey: .childrenIDS) ?? []
    }
    enum CodingKeys: String, CodingKey {
        case id, status
        case domainID = "domain_id"
        case settings, name
        case mainFeatures = "main_features"
        case attributes, pictures
        case parentID = "parent_id"
        case childrenIDS = "children_ids"
    }
}

// MARK: - Attribute
struct AttributeML: Codable {
    let id, name, valueID, valueName: String
    init(id: String, name: String, valueID: String, valueName: String) {
        self.id = id
        self.name = name
        self.valueID = valueID
        self.valueName = valueName
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.valueID = try container.decodeIfPresent(String.self, forKey: .valueID) ?? ""
        self.valueName = try container.decodeIfPresent(String.self, forKey: .valueName) ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
    }
}

// MARK: - Picture
struct Picture: Codable {
    let id: String
    let url: String
    init(id: String, url: String) {
        self.id = id
        self.url = url
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}

// MARK: - Settings
struct Settings: Codable {
    let listingStrategy: String
    init(listingStrategy: String) {
        self.listingStrategy = listingStrategy
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.listingStrategy = try container.decodeIfPresent(String.self, forKey: .listingStrategy) ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case listingStrategy = "listing_strategy"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
