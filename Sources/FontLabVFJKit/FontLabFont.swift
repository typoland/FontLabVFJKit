//
//  FLFont.swift
//  FontLabJsonKit
//
//  Created by Łukasz Dziedzic on 27/10/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public class FontLabFont:Codable {
    public var glyphsCount:Int {
        return glyphs.count
    }

    enum CodingKeys: String, CodingKey {
        case upm
        case glyphs
        case axes
        case masters
    }

    public var upm:Int
    public var glyphs:[FontLabGlyph]
    public var axes: [FontLabAxis]
    public var masters:[FontLabMaster]
}

extension FontLabFont:CustomStringConvertible {
    public var description:String {
        return "Font with \(masters.count) masters: [\(masters.reduce ("", {$0+"\($1.fontMaster.name), "}).dropLast(2) )]\n\t\(axes.count) Axes: [\(axes.reduce ("", {$0+"\($1.name), "}).dropLast(2) )] "
    }
}
