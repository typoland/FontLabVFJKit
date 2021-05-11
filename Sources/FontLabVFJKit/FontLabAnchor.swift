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
        var pData = (try container.decode(String.self, forKey: .point)).split(separator: " ").map {Double($0)}.compactMap({$0})
            
        if pData.count != 2 {pData = [0,0] }
        self.point = CGPoint(x: pData[0], y: pData[1])
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        try container.encode(name, forKey: .name)
        try container.encode("\(point.x)  \(point.y)", forKey: .point)
    }
}
