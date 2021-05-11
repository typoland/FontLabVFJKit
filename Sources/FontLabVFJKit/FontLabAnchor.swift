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
        if let pData = (try? container.decode(String.self, forKey: .point)), pData.count == 2 {
            let p = pData.split(separator: " ").map {Double($0)}.compactMap({$0})
            self.point = CGPoint(x: p[0], y: p[1])
        } else {
            self.point = CGPoint()
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        try container.encode(name, forKey: .name)
        try container.encode("\(point.x)  \(point.y)", forKey: .point)
    }
}
