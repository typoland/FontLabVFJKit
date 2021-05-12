//
//  File.swift
//  FontLabVFJKit
//
//  Created by Łukasz Dziedzic on 31/10/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public enum FontLabElementDataUnion: Codable {
    case elementData(FontLabElementData)
    case imageData(FontLabImageData)
    //case string(String)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
        if let x = try? container.decode(FontLabImageData.self) {
            self = .imageData(x)
            return
            
        }
        if let x = try? container.decode(FontLabElementData.self) {
            self = .elementData(x)
            return
        }
        throw DecodingError.typeMismatch(FontLabElementDataUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ElementDataUnion"))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .elementData(let x):
            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
        case .imageData(let x):
            try container.encode(x)
        }
    }
}

extension FontLabElementDataUnion: CustomStringConvertible {
    public var description: String {
        switch self {
        case .elementData(let elementData): return elementData.description
        case .imageData(let image): return "🖼 \(image)"
        }
    }
}
