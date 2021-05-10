//
//  FLGlyph.swift
//  FontLabJsonKit
//
//  Created by Łukasz Dziedzic on 28/10/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public class FontLabGlyph:Codable {
    public var name:String = ""
    public var unicode: String? = ""
    public var colorFlag : Int? = nil
    public var layers:[FontLabLayer]? = nil
    
    
    //MARK: for debug only
    enum Keys: CodingKey {
        case name
        case unicode
        case layers
        case colorFlag
    }
    public required init(from decoder: Decoder) throws {
        
        let containr = try decoder.container(keyedBy: Keys.self)
        self.name = try containr.decode(String.self, forKey: .name)
        self.colorFlag = try containr.decode(Int?.self, forKey: .colorFlag)
        self.layers = containr.decode([FontLabLayer]?.self, forKey: .layers)
        print (self.name)
    }
}



extension FontLabGlyph: CustomStringConvertible {
    public var description: String {
        return ("\"\(name)\" \(layers?.count ?? 0) layers")
    }
}
