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
    public var colorFlag : Int? = nil
    public var layers:[FontLabLayer]? = nil
}


extension FontLabGlyph: CustomStringConvertible {
    public var description: String {
        return ("\(name)")
    }
}
