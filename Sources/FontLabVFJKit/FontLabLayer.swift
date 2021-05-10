//
//  FLLayer.swift
//  FontLabJsonKit
//
//  Created by Łukasz Dziedzic on 28/10/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

import Foundation


public class FontLabLayer:Codable {
    
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

}


extension FontLabLayer: CustomStringConvertible {
    public var description: String {
        return ("\(name ?? "<no name>")")
    }
}
