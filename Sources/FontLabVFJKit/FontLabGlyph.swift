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
    //public var colorFlag : Int? = nil
    public var layers:[FontLabLayer]? = nil
    
    
    //#if DEBUG
    enum Keys: CodingKey {
        case name
        case unicode
        case layers
        //case colorFlag
    }
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: Keys.self)
        self.name = try container.decode(String.self, forKey: .name)
        print (self.name)
        //self.colorFlag = try containr.decode(Int?.self, forKey: .colorFlag)
        self.layers = try? container.decode([FontLabLayer]?.self, forKey: .layers)
        for layer in layers ?? [] {
            print (self.name, layer.elements ?? [])
        }
        print ("...done")
    }
    //#endif
}



extension FontLabGlyph: CustomStringConvertible {
    public var description: String {
        return ("\"\(name)\" \(layers?.count ?? 0) layers")
    }
}
