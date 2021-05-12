//
//  FLLayer.swift
//  FontLabJsonKit
//
//  Created by Łukasz Dziedzic on 28/10/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

import Foundation


public class FontLabLayer: Codable {
    
    public var name: String?
    public var colorFlag: Int?
    public var flags: Int?
    public var advanceWidth: Double
    public var advanceHeight: Double?
    public var elements: [FontLabElement]?
    public var hints: [FontLabHint]?
    public var anchors: [FontLabAnchor]?
    public var guidelines: [FontLabGuideline]?
    public var color: String?
    
    public init() {
        name = ""
        colorFlag = nil
        flags = nil
        advanceWidth = 0
        advanceHeight = nil
        elements = nil
        hints = nil
        guidelines = nil
        color = nil
    }
    
//#if DEBUG
    
    enum Keys: CodingKey {
        case name
        case colorFlag
        case flags
        case advanceWidth
        case advanceHeight
        case elements
        case hints
        case anchors
        case guidelines
        case color
    }
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.name = try container.decode(String?.self, forKey: .name)
        self.colorFlag = try? container.decode(Int?.self, forKey: .colorFlag)
        self.flags = try? container.decode(Int?.self, forKey: .flags)
        self.advanceWidth = try container.decode(Double.self, forKey: .advanceWidth)
        self.advanceHeight = try? container.decode(Double?.self, forKey: .advanceHeight)
        self.elements = try? container.decode([FontLabElement]?.self, forKey: .elements)
        self.hints = try? container.decode([FontLabHint]?.self, forKey: .hints)
        self.anchors = try? container.decode([FontLabAnchor]?.self, forKey: .anchors)
        self.guidelines = try? container.decode([FontLabGuideline]?.self, forKey: .guidelines)
        self.color = try container.decode(String?.self, forKey: .color)
    }
    
    //#endif
}


extension FontLabLayer: CustomStringConvertible {
    public var description: String {
        return ("FLLayer name: \(name ?? "<no name>")")
    }
}
