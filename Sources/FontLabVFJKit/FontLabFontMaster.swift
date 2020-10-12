//
//  FontMaster.swift
//  FontLabVFJKit
//
//  Created by Łukasz Dziedzic on 06/11/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

import Foundation
public struct FontLabFontMaster: Codable{
    public var name:String
    public var tsn: String?
    public var sgn: String?
    public var ffn: String?
    public var psn: String?
    public var weight_name: String?
    public var width_name: String?
    public var other_name: String?
    public var slope_name: String?
    public var ascender: Double
    public var descender: Double
    public var xHeight: Double
    public var capsHeight: Double
    public var measurement: Double
    public var weight: Double
    public var width: Double
    public var lineGap: Double
    public var safeTop: Double
    public var safeBottom: Double
    public var underlineThickness: Double
    public var underlinePosition: Double
    public var curveTension: Double?
    public var cornerTension: Double?
    public var inktrapLen: Double?
    public var location: FontLabLocation?
    public var fontNote: String?
}

extension FontLabFontMaster : CustomStringConvertible {
    public var description: String {
        return "FontMaster \"\(name)\" \(location?.description ?? "no loc")\n\(fontNote ?? "")"
    }
}
