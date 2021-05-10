//
//  File.swift
//  
//
//  Created by Łukasz Dziedzic on 10/05/2021.
//

import Foundation
public struct FontLabAnchor : Codable {
    public var name: String
    public var point: CGPoint
    
    enum Keys: CodingKey {
        case name
        case point
    }
    
    enum Errors:Error {
        case wrongDataForPoint([Double])
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.name = try container.decode(String.self, forKey: .name)
        let pData = (try container.decode([Double].self, forKey: .point))
            
        guard pData.count == 2 else {throw Errors.wrongDataForPoint(pData) }
        self.point = CGPoint(x: pData[0], y: pData[1])
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        try container.encode(name, forKey: .name)
        try container.encode([point.x, point.y], forKey: .point)
    }
}
