//
//  AppStoreData.swift
//  AppstoreDemoRxSwift
//
//  Created by jungwook on 2020/01/29.
//  Copyright © 2020 jungwook. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let appStoreData = try AppStoreData(json)

import Foundation

// MARK: - AppStoreData
struct AppStoreData: Codable {
    let resultCount: Int
    let results: [AppstoreSearchResult]
    enum CodingKeys: String, CodingKey {
         case results = "results"
         case resultCount
       }
}

// MARK: AppStoreData convenience initializers and mutators

extension AppStoreData {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AppStoreData.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        resultCount: Int? = nil,
        results: [AppstoreSearchResult]? = nil
    ) -> AppStoreData {
        return AppStoreData(
            resultCount: resultCount ?? self.resultCount,
            results: results ?? self.results
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Result
struct AppstoreSearchResult: Codable {
    let isGameCenterEnabled: Bool
    let screenshotUrls, ipadScreenshotUrls: [String]
    let appletvScreenshotUrls: [JSONAny]
    let artworkUrl60, artworkUrl512, artworkUrl100: String
    let artistViewURL: String
    let supportedDevices, advisories: [String]
    let kind: Kind
    let features: [Feature]
    let trackCensoredName: String
    let languageCodesISO2A: [String]
    let fileSizeBytes: String
    let contentAdvisoryRating: Rating
    let averageUserRatingForCurrentVersion: Double?
    let userRatingCountForCurrentVersion: Int?
    let trackViewURL: String
    let trackContentRating: Rating
    let releaseDate: Date
    let trackID: Int
    let trackName: String
    let currentVersionReleaseDate: Date
    let releaseNotes: String
    let isVppDeviceBasedLicensingEnabled: Bool
    let primaryGenreName: String
    let genreIDS: [String]
    let primaryGenreID: Int
    let sellerName, minimumOSVersion: String
    let formattedPrice: FormattedPrice
    let currency: Currency
    let version: String
    let wrapperType: Kind
    let artistID: Int
    let artistName: String
    let genres: [String]
    let price: Int
    let resultDescription, bundleID: String
    let averageUserRating: Double
    let userRatingCount: Int
    let sellerURL: String?

    enum CodingKeys: String, CodingKey {
        case isGameCenterEnabled, screenshotUrls, ipadScreenshotUrls, appletvScreenshotUrls, artworkUrl60, artworkUrl512, artworkUrl100
        case artistViewURL = "artistViewUrl"
        case supportedDevices, advisories, kind, features, trackCensoredName, languageCodesISO2A, fileSizeBytes, contentAdvisoryRating, averageUserRatingForCurrentVersion, userRatingCountForCurrentVersion
        case trackViewURL = "trackViewUrl"
        case trackContentRating, releaseDate
        case trackID = "trackId"
        case trackName, currentVersionReleaseDate, releaseNotes, isVppDeviceBasedLicensingEnabled, primaryGenreName
        case genreIDS = "genreIds"
        case primaryGenreID = "primaryGenreId"
        case sellerName
        case minimumOSVersion = "minimumOsVersion"
        case formattedPrice, currency, version, wrapperType
        case artistID = "artistId"
        case artistName, genres, price
        case resultDescription = "description"
        case bundleID = "bundleId"
        case averageUserRating, userRatingCount
        case sellerURL = "sellerUrl"
    }
}

// MARK: Result convenience initializers and mutators

extension AppstoreSearchResult {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AppstoreSearchResult.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        isGameCenterEnabled: Bool? = nil,
        screenshotUrls: [String]? = nil,
        ipadScreenshotUrls: [String]? = nil,
        appletvScreenshotUrls: [JSONAny]? = nil,
        artworkUrl60: String? = nil,
        artworkUrl512: String? = nil,
        artworkUrl100: String? = nil,
        artistViewURL: String? = nil,
        supportedDevices: [String]? = nil,
        advisories: [String]? = nil,
        kind: Kind? = nil,
        features: [Feature]? = nil,
        trackCensoredName: String? = nil,
        languageCodesISO2A: [String]? = nil,
        fileSizeBytes: String? = nil,
        contentAdvisoryRating: Rating? = nil,
        averageUserRatingForCurrentVersion: Double?? = nil,
        userRatingCountForCurrentVersion: Int?? = nil,
        trackViewURL: String? = nil,
        trackContentRating: Rating? = nil,
        releaseDate: Date? = nil,
        trackID: Int? = nil,
        trackName: String? = nil,
        currentVersionReleaseDate: Date? = nil,
        releaseNotes: String? = nil,
        isVppDeviceBasedLicensingEnabled: Bool? = nil,
        primaryGenreName: String? = nil,
        genreIDS: [String]? = nil,
        primaryGenreID: Int? = nil,
        sellerName: String? = nil,
        minimumOSVersion: String? = nil,
        formattedPrice: FormattedPrice? = nil,
        currency: Currency? = nil,
        version: String? = nil,
        wrapperType: Kind? = nil,
        artistID: Int? = nil,
        artistName: String? = nil,
        genres: [String]? = nil,
        price: Int? = nil,
        resultDescription: String? = nil,
        bundleID: String? = nil,
        averageUserRating: Double? = nil,
        userRatingCount: Int? = nil,
        sellerURL: String?? = nil
    ) -> AppstoreSearchResult {
        return AppstoreSearchResult(
            isGameCenterEnabled: isGameCenterEnabled ?? self.isGameCenterEnabled,
            screenshotUrls: screenshotUrls ?? self.screenshotUrls,
            ipadScreenshotUrls: ipadScreenshotUrls ?? self.ipadScreenshotUrls,
            appletvScreenshotUrls: appletvScreenshotUrls ?? self.appletvScreenshotUrls,
            artworkUrl60: artworkUrl60 ?? self.artworkUrl60,
            artworkUrl512: artworkUrl512 ?? self.artworkUrl512,
            artworkUrl100: artworkUrl100 ?? self.artworkUrl100,
            artistViewURL: artistViewURL ?? self.artistViewURL,
            supportedDevices: supportedDevices ?? self.supportedDevices,
            advisories: advisories ?? self.advisories,
            kind: kind ?? self.kind,
            features: features ?? self.features,
            trackCensoredName: trackCensoredName ?? self.trackCensoredName,
            languageCodesISO2A: languageCodesISO2A ?? self.languageCodesISO2A,
            fileSizeBytes: fileSizeBytes ?? self.fileSizeBytes,
            contentAdvisoryRating: contentAdvisoryRating ?? self.contentAdvisoryRating,
            averageUserRatingForCurrentVersion: averageUserRatingForCurrentVersion ?? self.averageUserRatingForCurrentVersion,
            userRatingCountForCurrentVersion: userRatingCountForCurrentVersion ?? self.userRatingCountForCurrentVersion,
            trackViewURL: trackViewURL ?? self.trackViewURL,
            trackContentRating: trackContentRating ?? self.trackContentRating,
            releaseDate: releaseDate ?? self.releaseDate,
            trackID: trackID ?? self.trackID,
            trackName: trackName ?? self.trackName,
            currentVersionReleaseDate: currentVersionReleaseDate ?? self.currentVersionReleaseDate,
            releaseNotes: releaseNotes ?? self.releaseNotes,
            isVppDeviceBasedLicensingEnabled: isVppDeviceBasedLicensingEnabled ?? self.isVppDeviceBasedLicensingEnabled,
            primaryGenreName: primaryGenreName ?? self.primaryGenreName,
            genreIDS: genreIDS ?? self.genreIDS,
            primaryGenreID: primaryGenreID ?? self.primaryGenreID,
            sellerName: sellerName ?? self.sellerName,
            minimumOSVersion: minimumOSVersion ?? self.minimumOSVersion,
            formattedPrice: formattedPrice ?? self.formattedPrice,
            currency: currency ?? self.currency,
            version: version ?? self.version,
            wrapperType: wrapperType ?? self.wrapperType,
            artistID: artistID ?? self.artistID,
            artistName: artistName ?? self.artistName,
            genres: genres ?? self.genres,
            price: price ?? self.price,
            resultDescription: resultDescription ?? self.resultDescription,
            bundleID: bundleID ?? self.bundleID,
            averageUserRating: averageUserRating ?? self.averageUserRating,
            userRatingCount: userRatingCount ?? self.userRatingCount,
            sellerURL: sellerURL ?? self.sellerURL
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Rating: String, Codable {
    case the12 = "12+"
    case the17 = "17+"
    case the4 = "4+"
    case the9 = "9+"
}

enum Currency: String, Codable {
    case krw = "KRW"
}

enum Feature: String, Codable {
    case iosUniversal = "iosUniversal"
}

enum FormattedPrice: String, Codable {
    case 무료 = "무료"
}

enum Kind: String, Codable {
    case software = "software"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }
    public func hash(into hasher: inout Hasher) {
        // No-op
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
