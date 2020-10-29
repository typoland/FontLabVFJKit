//
//  Master.swift
//  FontLabVFJKit
//
//  Created by Łukasz Dziedzic on 05/11/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

extension String {
    subscript (_ range: ClosedRange<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[startIndex...endIndex])
    }
}


public struct FontLabColor: RawRepresentable, Codable {
    
    public typealias RawValue = String
    public var rawValue: String

    static func hexString(from rgba:(r:Float, g:Float, b:Float, a:Float)) -> String {
        let sr = String(format:"%02X", Int(rgba.r*256+0.5))
        let sg = String(format:"%02X", Int(rgba.g*256+0.5))
        let sb = String(format:"%02X", Int(rgba.b*256+0.5))
        let sa = String(format:"%02X", Int(rgba.a*256+0.5))
        return "#\(sr)\(sg)\(sb)\(sa)"
    }
    
    static let hexValues:[String:String] = [
        "aliceblue" : "#F0F8FFFF",
        "antiquewhite" : "#FAEBD7FF",
        "aqua" : "#00FFFFFF",
        "aquamarine" : "#7FFFD4FF",
        "azure" : "#F0FFFFFF",
        "beige" : "#F5F5DCFF",
        "bisque" : "#FFE4C4FF",
        "black" : "#000000FF",
        "blanchedalmond" : "#FFEBCDFF",
        "blue" : "#0000FFFF",
        "blueviolet" : "#8A2BE2FF",
        "brown" : "#A52A2AFF",
        "burlywood" : "#DEB887FF",
        "cadetblue" : "#5F9EA0FF",
        "chartreuse" : "#7FFF00FF",
        "chocolate" : "#D2691EFF",
        "coral" : "#FF7F50FF",
        "cornflowerblue" : "#6495EDFF",
        "cornsilk" : "#FFF8DCFF",
        "crimson" : "#DC143CFF",
        "cyan" : "#00FFFFFF",
        "darkblue" : "#00008BFF",
        "darkcyan" : "#008B8BFF",
        "darkgoldenrod" : "#B8860BFF",
        "darkgray" : "#A9A9A9FF",
        "darkgrey" : "#A9A9A9FF",
        "darkgreen" : "#006400FF",
        "darkkhaki" : "#BDB76BFF",
        "darkmagenta" : "#8B008BFF",
        "darkolivegreen" : "#556B2FFF",
        "darkorange" : "#FF8C00FF",
        "darkorchid" : "#9932CCFF",
        "darkred" : "#8B0000FF",
        "darksalmon" : "#E9967AFF",
        "darkseagreen" : "#8FBC8FFF",
        "darkslateblue" : "#483D8BFF",
        "darkslategray" : "#2F4F4FFF",
        "darkslategrey" : "#2F4F4FFF",
        "darkturquoise" : "#00CED1FF",
        "darkviolet" : "#9400D3FF",
        "deeppink" : "#FF1493FF",
        "deepskyblue" : "#00BFFFFF",
        "dimgray" : "#696969FF",
        "dimgrey" : "#696969FF",
        "dodgerblue" : "#1E90FFFF",
        "firebrick" : "#B22222FF",
        "floralwhite" : "#FFFAF0FF",
        "forestgreen" : "#228B22FF",
        "fuchsia" : "#FF00FFFF",
        "gainsboro" : "#DCDCDCFF",
        "ghostwhite" : "#F8F8FFFF",
        "gold" : "#FFD700FF",
        "goldenrod" : "#DAA520FF",
        "gray" : "#808080FF",
        "grey" : "#808080FF",
        "green" : "#008000FF",
        "greenyellow" : "#ADFF2FFF",
        "honeydew" : "#F0FFF0FF",
        "hotpink" : "#FF69B4FF",
        "indianred" : "#CD5C5CFF",
        "indigo" : "#4B0082FF",
        "ivory" : "#FFFFF0FF",
        "khaki" : "#F0E68CFF",
        "lavender" : "#E6E6FAFF",
        "lavenderblush" : "#FFF0F5FF",
        "lawngreen" : "#7CFC00FF",
        "lemonchiffon" : "#FFFACDFF",
        "lightblue" : "#ADD8E6FF",
        "lightcoral" : "#F08080FF",
        "lightcyan" : "#E0FFFFFF",
        "lightgoldenrodyellow" : "#FAFAD2FF",
        "lightgray" : "#D3D3D3FF",
        "lightgrey" : "#D3D3D3FF",
        "lightgreen" : "#90EE90FF",
        "lightpink" : "#FFB6C1FF",
        "lightsalmon" : "#FFA07AFF",
        "lightseagreen" : "#20B2AAFF",
        "lightskyblue" : "#87CEFAFF",
        "lightslategray" : "#778899FF",
        "lightslategrey" : "#778899FF",
        "lightsteelblue" : "#B0C4DEFF",
        "lightyellow" : "#FFFFE0FF",
        "lime" : "#00FF00FF",
        "limegreen" : "#32CD32FF",
        "linen" : "#FAF0E6FF",
        "magenta" : "#FF00FFFF",
        "maroon" : "#800000FF",
        "mediumaquamarine" : "#66CDAAFF",
        "mediumblue" : "#0000CDFF",
        "mediumorchid" : "#BA55D3FF",
        "mediumpurple" : "#9370D8FF",
        "mediumseagreen" : "#3CB371FF",
        "mediumslateblue" : "#7B68EEFF",
        "mediumspringgreen" : "#00FA9AFF",
        "mediumturquoise" : "#48D1CCFF",
        "mediumvioletred" : "#C71585FF",
        "midnightblue" : "#191970FF",
        "mintcream" : "#F5FFFAFF",
        "mistyrose" : "#FFE4E1FF",
        "moccasin" : "#FFE4B5FF",
        "navajowhite" : "#FFDEADFF",
        "navy" : "#000080FF",
        "oldlace" : "#FDF5E6FF",
        "olive" : "#808000FF",
        "olivedrab" : "#6B8E23FF",
        "orange" : "#FFA500FF",
        "orangered" : "#FF4500FF",
        "orchid" : "#DA70D6FF",
        "palegoldenrod" : "#EEE8AAFF",
        "palegreen" : "#98FB98FF",
        "paleturquoise" : "#AFEEEEFF",
        "palevioletred" : "#D87093FF",
        "papayawhip" : "#FFEFD5FF",
        "peachpuff" : "#FFDAB9FF",
        "peru" : "#CD853FFF",
        "pink" : "#FFC0CBFF",
        "plum" : "#DDA0DDFF",
        "powderblue" : "#B0E0E6FF",
        "purple" : "#800080FF",
        "rebeccapurple" : "#663399FF",
        "red" : "#FF0000FF",
        "rosybrown" : "#BC8F8FFF",
        "royalblue" : "#4169E1FF",
        "saddlebrown" : "#8B4513FF",
        "salmon" : "#FA8072FF",
        "sandybrown" : "#F4A460FF",
        "seagreen" : "#2E8B57FF",
        "seashell" : "#FFF5EEFF",
        "sienna" : "#A0522DFF",
        "silver" : "#C0C0C0FF",
        "skyblue" : "#87CEEBFF",
        "slateblue" : "#6A5ACDFF",
        "slategray" : "#708090FF",
        "slategrey" : "#708090FF",
        "snow" : "#FFFAFAFF",
        "springgreen" : "#00FF7FFF",
        "steelblue" : "#4682B4FF",
        "tan" : "#D2B48CFF",
        "teal" : "#008080FF",
        "thistle" : "#D8BFD8FF",
        "tomato" : "#FF6347FF",
        "turquoise" : "#40E0D0FF",
        "violet" : "#EE82EEFF",
        "wheat" : "#F5DEB3FF",
        "white" : "#FFFFFFFF",
        "whitesmoke" : "#F5F5F5FF",
        "yellow" : "#FFFF00FF",
        "yellowgreen" : "#9ACD32FF",
        ]
    
    public init?(rawValue: String) {
        self.rawValue = rawValue
    }

    
    var hexString: String {
        return FontLabColor.hexValues[self.rawValue] ?? self.rawValue
    }
    
    var rgba: (r:Float, g:Float, b:Float, a:Float) {
        return (
            r: Float(Int(hexString[1...2], radix:16) ?? 0)/256,
            g: Float(Int(hexString[3...4], radix:16) ?? 0)/256,
            b: Float(Int(hexString[5...6], radix:16) ?? 0)/256,
            a: hexString.count == 9 ?
                Float(Int(hexString[7...8], radix:16) ?? 255)/256
                : 1.0 )
    }
    
    init(from r:Float, g: Float, b:Float, a:Float) {
        let string = FontLabColor.hexString(from: (r: r, g: g, b: b, a: a) )
        if  let exist = FontLabColor.hexValues.filter({$0.value == string}).first {
            self.init(rawValue: exist.key)!
        } else {
            self.init(rawValue: "\(string)")!
        }
    }
    //self.hexString = hexString
    
}

extension FontLabColor {
    
    static let rgbaValues: [String:(r:Float, g:Float, b:Float, a:Float)] = [
        "greenyellow" : (r: 0.675781, g: 0.996094, b: 0.183594, a: 0.996094),
        "lightsalmon" : (r: 0.996094, g: 0.625000, b: 0.476562, a: 0.996094),
        "darkgrey" : (r: 0.660156, g: 0.660156, b: 0.660156, a: 0.996094),
        "maroon" : (r: 0.500000, g: 0.000000, b: 0.000000, a: 0.996094),
        "slateblue" : (r: 0.414062, g: 0.351562, b: 0.800781, a: 0.996094),
        "lightblue" : (r: 0.675781, g: 0.843750, b: 0.898438, a: 0.996094),
        "lightpink" : (r: 0.996094, g: 0.710938, b: 0.753906, a: 0.996094),
        "purple" : (r: 0.500000, g: 0.000000, b: 0.500000, a: 0.996094),
        "seagreen" : (r: 0.179688, g: 0.542969, b: 0.339844, a: 0.996094),
        "sienna" : (r: 0.625000, g: 0.320312, b: 0.175781, a: 0.996094),
        "teal" : (r: 0.000000, g: 0.500000, b: 0.500000, a: 0.996094),
        "dimgray" : (r: 0.410156, g: 0.410156, b: 0.410156, a: 0.996094),
        "gainsboro" : (r: 0.859375, g: 0.859375, b: 0.859375, a: 0.996094),
        "indianred" : (r: 0.800781, g: 0.359375, b: 0.359375, a: 0.996094),
        "mistyrose" : (r: 0.996094, g: 0.890625, b: 0.878906, a: 0.996094),
        "lawngreen" : (r: 0.484375, g: 0.984375, b: 0.000000, a: 0.996094),
        "mediumturquoise" : (r: 0.281250, g: 0.816406, b: 0.796875, a: 0.996094),
        "turquoise" : (r: 0.250000, g: 0.875000, b: 0.812500, a: 0.996094),
        "hotpink" : (r: 0.996094, g: 0.410156, b: 0.703125, a: 0.996094),
        "navajowhite" : (r: 0.996094, g: 0.867188, b: 0.675781, a: 0.996094),
        "blueviolet" : (r: 0.539062, g: 0.167969, b: 0.882812, a: 0.996094),
        "darkturquoise" : (r: 0.000000, g: 0.804688, b: 0.816406, a: 0.996094),
        "aliceblue" : (r: 0.937500, g: 0.968750, b: 0.996094, a: 0.996094),
        "mediumorchid" : (r: 0.726562, g: 0.332031, b: 0.824219, a: 0.996094),
        "silver" : (r: 0.750000, g: 0.750000, b: 0.750000, a: 0.996094),
        "darkblue" : (r: 0.000000, g: 0.000000, b: 0.542969, a: 0.996094),
        "burlywood" : (r: 0.867188, g: 0.718750, b: 0.527344, a: 0.996094),
        "oldlace" : (r: 0.988281, g: 0.957031, b: 0.898438, a: 0.996094),
        "yellowgreen" : (r: 0.601562, g: 0.800781, b: 0.195312, a: 0.996094),
        "darkslategrey" : (r: 0.183594, g: 0.308594, b: 0.308594, a: 0.996094),
        "darkviolet" : (r: 0.578125, g: 0.000000, b: 0.824219, a: 0.996094),
        "navy" : (r: 0.000000, g: 0.000000, b: 0.500000, a: 0.996094),
        "slategrey" : (r: 0.437500, g: 0.500000, b: 0.562500, a: 0.996094),
        "violet" : (r: 0.929688, g: 0.507812, b: 0.929688, a: 0.996094),
        "lightskyblue" : (r: 0.527344, g: 0.804688, b: 0.976562, a: 0.996094),
        "mediumslateblue" : (r: 0.480469, g: 0.406250, b: 0.929688, a: 0.996094),
        "olivedrab" : (r: 0.417969, g: 0.554688, b: 0.136719, a: 0.996094),
        "yellow" : (r: 0.996094, g: 0.996094, b: 0.000000, a: 0.996094),
        "darkcyan" : (r: 0.000000, g: 0.542969, b: 0.542969, a: 0.996094),
        "deeppink" : (r: 0.996094, g: 0.078125, b: 0.574219, a: 0.996094),
        "ghostwhite" : (r: 0.968750, g: 0.968750, b: 0.996094, a: 0.996094),
        "plum" : (r: 0.863281, g: 0.625000, b: 0.863281, a: 0.996094),
        "lightseagreen" : (r: 0.125000, g: 0.695312, b: 0.664062, a: 0.996094),
        "mediumblue" : (r: 0.000000, g: 0.000000, b: 0.800781, a: 0.996094),
        "antiquewhite" : (r: 0.976562, g: 0.917969, b: 0.839844, a: 0.996094),
        "darkolivegreen" : (r: 0.332031, g: 0.417969, b: 0.183594, a: 0.996094),
        "lemonchiffon" : (r: 0.996094, g: 0.976562, b: 0.800781, a: 0.996094),
        "lightslategrey" : (r: 0.464844, g: 0.531250, b: 0.597656, a: 0.996094),
        "orange" : (r: 0.996094, g: 0.644531, b: 0.000000, a: 0.996094),
        "darkgray" : (r: 0.660156, g: 0.660156, b: 0.660156, a: 0.996094),
        "tomato" : (r: 0.996094, g: 0.386719, b: 0.277344, a: 0.996094),
        "lightgoldenrodyellow" : (r: 0.976562, g: 0.976562, b: 0.820312, a: 0.996094),
        "cornflowerblue" : (r: 0.390625, g: 0.582031, b: 0.925781, a: 0.996094),
        "lightyellow" : (r: 0.996094, g: 0.996094, b: 0.875000, a: 0.996094),
        "cadetblue" : (r: 0.371094, g: 0.617188, b: 0.625000, a: 0.996094),
        "lightcyan" : (r: 0.875000, g: 0.996094, b: 0.996094, a: 0.996094),
        "ivory" : (r: 0.996094, g: 0.996094, b: 0.937500, a: 0.996094),
        "wheat" : (r: 0.957031, g: 0.867188, b: 0.699219, a: 0.996094),
        "deepskyblue" : (r: 0.000000, g: 0.746094, b: 0.996094, a: 0.996094),
        "bisque" : (r: 0.996094, g: 0.890625, b: 0.765625, a: 0.996094),
        "fuchsia" : (r: 0.996094, g: 0.000000, b: 0.996094, a: 0.996094),
        "peru" : (r: 0.800781, g: 0.519531, b: 0.246094, a: 0.996094),
        "floralwhite" : (r: 0.996094, g: 0.976562, b: 0.937500, a: 0.996094),
        "darkslateblue" : (r: 0.281250, g: 0.238281, b: 0.542969, a: 0.996094),
        "lightsteelblue" : (r: 0.687500, g: 0.765625, b: 0.867188, a: 0.996094),
        "brown" : (r: 0.644531, g: 0.164062, b: 0.164062, a: 0.996094),
        "skyblue" : (r: 0.527344, g: 0.804688, b: 0.917969, a: 0.996094),
        "salmon" : (r: 0.976562, g: 0.500000, b: 0.445312, a: 0.996094),
        "thistle" : (r: 0.843750, g: 0.746094, b: 0.843750, a: 0.996094),
        "mediumaquamarine" : (r: 0.398438, g: 0.800781, b: 0.664062, a: 0.996094),
        "orchid" : (r: 0.851562, g: 0.437500, b: 0.835938, a: 0.996094),
        "tan" : (r: 0.820312, g: 0.703125, b: 0.546875, a: 0.996094),
        "darkgoldenrod" : (r: 0.718750, g: 0.523438, b: 0.042969, a: 0.996094),
        "snow" : (r: 0.996094, g: 0.976562, b: 0.976562, a: 0.996094),
        "springgreen" : (r: 0.000000, g: 0.996094, b: 0.496094, a: 0.996094),
        "firebrick" : (r: 0.695312, g: 0.132812, b: 0.132812, a: 0.996094),
        "red" : (r: 0.996094, g: 0.000000, b: 0.000000, a: 0.996094),
        "midnightblue" : (r: 0.097656, g: 0.097656, b: 0.437500, a: 0.996094),
        "whitesmoke" : (r: 0.957031, g: 0.957031, b: 0.957031, a: 0.996094),
        "linen" : (r: 0.976562, g: 0.937500, b: 0.898438, a: 0.996094),
        "blanchedalmond" : (r: 0.996094, g: 0.917969, b: 0.800781, a: 0.996094),
        "lightgreen" : (r: 0.562500, g: 0.929688, b: 0.562500, a: 0.996094),
        "cyan" : (r: 0.000000, g: 0.996094, b: 0.996094, a: 0.996094),
        "lightcoral" : (r: 0.937500, g: 0.500000, b: 0.500000, a: 0.996094),
        "mediumvioletred" : (r: 0.777344, g: 0.082031, b: 0.519531, a: 0.996094),
        "crimson" : (r: 0.859375, g: 0.078125, b: 0.234375, a: 0.996094),
        "honeydew" : (r: 0.937500, g: 0.996094, b: 0.937500, a: 0.996094),
        "palegoldenrod" : (r: 0.929688, g: 0.906250, b: 0.664062, a: 0.996094),
        "rosybrown" : (r: 0.734375, g: 0.558594, b: 0.558594, a: 0.996094),
        "mediumspringgreen" : (r: 0.000000, g: 0.976562, b: 0.601562, a: 0.996094),
        "beige" : (r: 0.957031, g: 0.957031, b: 0.859375, a: 0.996094),
        "gray" : (r: 0.500000, g: 0.500000, b: 0.500000, a: 0.996094),
        "rebeccapurple" : (r: 0.398438, g: 0.199219, b: 0.597656, a: 0.996094),
        "aqua" : (r: 0.000000, g: 0.996094, b: 0.996094, a: 0.996094),
        "gold" : (r: 0.996094, g: 0.839844, b: 0.000000, a: 0.996094),
        "darkmagenta" : (r: 0.542969, g: 0.000000, b: 0.542969, a: 0.996094),
        "indigo" : (r: 0.292969, g: 0.000000, b: 0.507812, a: 0.996094),
        "lavenderblush" : (r: 0.996094, g: 0.937500, b: 0.957031, a: 0.996094),
        "mintcream" : (r: 0.957031, g: 0.996094, b: 0.976562, a: 0.996094),
        "lightslategray" : (r: 0.464844, g: 0.531250, b: 0.597656, a: 0.996094),
        "darksalmon" : (r: 0.910156, g: 0.585938, b: 0.476562, a: 0.996094),
        "mediumseagreen" : (r: 0.234375, g: 0.699219, b: 0.441406, a: 0.996094),
        "blue" : (r: 0.000000, g: 0.000000, b: 0.996094, a: 0.996094),
        "orangered" : (r: 0.996094, g: 0.269531, b: 0.000000, a: 0.996094),
        "lightgrey" : (r: 0.824219, g: 0.824219, b: 0.824219, a: 0.996094),
        "paleturquoise" : (r: 0.683594, g: 0.929688, b: 0.929688, a: 0.996094),
        "peachpuff" : (r: 0.996094, g: 0.851562, b: 0.722656, a: 0.996094),
        "sandybrown" : (r: 0.953125, g: 0.640625, b: 0.375000, a: 0.996094),
        "seashell" : (r: 0.996094, g: 0.957031, b: 0.929688, a: 0.996094),
        "darkslategray" : (r: 0.183594, g: 0.308594, b: 0.308594, a: 0.996094),
        "slategray" : (r: 0.437500, g: 0.500000, b: 0.562500, a: 0.996094),
        "black" : (r: 0.000000, g: 0.000000, b: 0.000000, a: 0.996094),
        "khaki" : (r: 0.937500, g: 0.898438, b: 0.546875, a: 0.996094),
        "magenta" : (r: 0.996094, g: 0.000000, b: 0.996094, a: 0.996094),
        "darkgreen" : (r: 0.000000, g: 0.390625, b: 0.000000, a: 0.996094),
        "steelblue" : (r: 0.273438, g: 0.507812, b: 0.703125, a: 0.996094),
        "moccasin" : (r: 0.996094, g: 0.890625, b: 0.707031, a: 0.996094),
        "pink" : (r: 0.996094, g: 0.750000, b: 0.792969, a: 0.996094),
        "papayawhip" : (r: 0.996094, g: 0.933594, b: 0.832031, a: 0.996094),
        "powderblue" : (r: 0.687500, g: 0.875000, b: 0.898438, a: 0.996094),
        "azure" : (r: 0.937500, g: 0.996094, b: 0.996094, a: 0.996094),
        "mediumpurple" : (r: 0.574219, g: 0.437500, b: 0.843750, a: 0.996094),
        "chartreuse" : (r: 0.496094, g: 0.996094, b: 0.000000, a: 0.996094),
        "lime" : (r: 0.000000, g: 0.996094, b: 0.000000, a: 0.996094),
        "darkorchid" : (r: 0.597656, g: 0.195312, b: 0.796875, a: 0.996094),
        "forestgreen" : (r: 0.132812, g: 0.542969, b: 0.132812, a: 0.996094),
        "goldenrod" : (r: 0.851562, g: 0.644531, b: 0.125000, a: 0.996094),
        "grey" : (r: 0.500000, g: 0.500000, b: 0.500000, a: 0.996094),
        "white" : (r: 0.996094, g: 0.996094, b: 0.996094, a: 0.996094),
        "dodgerblue" : (r: 0.117188, g: 0.562500, b: 0.996094, a: 0.996094),
        "limegreen" : (r: 0.195312, g: 0.800781, b: 0.195312, a: 0.996094),
        "royalblue" : (r: 0.253906, g: 0.410156, b: 0.878906, a: 0.996094),
        "saddlebrown" : (r: 0.542969, g: 0.269531, b: 0.074219, a: 0.996094),
        "aquamarine" : (r: 0.496094, g: 0.996094, b: 0.828125, a: 0.996094),
        "darkorange" : (r: 0.996094, g: 0.546875, b: 0.000000, a: 0.996094),
        "chocolate" : (r: 0.820312, g: 0.410156, b: 0.117188, a: 0.996094),
        "lavender" : (r: 0.898438, g: 0.898438, b: 0.976562, a: 0.996094),
        "lightgray" : (r: 0.824219, g: 0.824219, b: 0.824219, a: 0.996094),
        "cornsilk" : (r: 0.996094, g: 0.968750, b: 0.859375, a: 0.996094),
        "darkred" : (r: 0.542969, g: 0.000000, b: 0.000000, a: 0.996094),
        "darkseagreen" : (r: 0.558594, g: 0.734375, b: 0.558594, a: 0.996094),
        "olive" : (r: 0.500000, g: 0.500000, b: 0.000000, a: 0.996094),
        "palegreen" : (r: 0.593750, g: 0.980469, b: 0.593750, a: 0.996094),
        "darkkhaki" : (r: 0.738281, g: 0.714844, b: 0.417969, a: 0.996094),
        "green" : (r: 0.000000, g: 0.500000, b: 0.000000, a: 0.996094),
        "dimgrey" : (r: 0.410156, g: 0.410156, b: 0.410156, a: 0.996094),
        "palevioletred" : (r: 0.843750, g: 0.437500, b: 0.574219, a: 0.996094),
        "coral" : (r: 0.996094, g: 0.496094, b: 0.312500, a: 0.996094)
    ]
}

extension FontLabColor {
    static let aliceblue = FontLabColor(rawValue: "aliceblue")
    static let antiquewhite = FontLabColor(rawValue: "antiquewhite")
    static let aqua = FontLabColor(rawValue: "aqua")
    static let aquamarine = FontLabColor(rawValue: "aquamarine")
    static let azure = FontLabColor(rawValue: "azure")
    static let beige = FontLabColor(rawValue: "beige")
    static let bisque = FontLabColor(rawValue: "bisque")
    static let black = FontLabColor(rawValue: "black")
    static let blanchedalmond = FontLabColor(rawValue: "blanchedalmond")
    static let blue = FontLabColor(rawValue: "blue")
    static let blueviolet = FontLabColor(rawValue: "blueviolet")
    static let brown = FontLabColor(rawValue: "brown")
    static let burlywood = FontLabColor(rawValue: "burlywood")
    static let cadetblue = FontLabColor(rawValue: "cadetblue")
    static let chartreuse = FontLabColor(rawValue: "chartreuse")
    static let chocolate = FontLabColor(rawValue: "chocolate")
    static let coral = FontLabColor(rawValue: "coral")
    static let cornflowerblue = FontLabColor(rawValue: "cornflowerblue")
    static let cornsilk = FontLabColor(rawValue: "cornsilk")
    static let crimson = FontLabColor(rawValue: "crimson")
    static let cyan = FontLabColor(rawValue: "cyan")
    static let darkblue = FontLabColor(rawValue: "darkblue")
    static let darkcyan = FontLabColor(rawValue: "darkcyan")
    static let darkgoldenrod = FontLabColor(rawValue: "darkgoldenrod")
    static let darkgray = FontLabColor(rawValue: "darkgray")
    static let darkgrey = FontLabColor(rawValue: "darkgrey")
    static let darkgreen = FontLabColor(rawValue: "darkgreen")
    static let darkkhaki = FontLabColor(rawValue: "darkkhaki")
    static let darkmagenta = FontLabColor(rawValue: "darkmagenta")
    static let darkolivegreen = FontLabColor(rawValue: "darkolivegreen")
    static let darkorange = FontLabColor(rawValue: "darkorange")
    static let darkorchid = FontLabColor(rawValue: "darkorchid")
    static let darkred = FontLabColor(rawValue: "darkred")
    static let darksalmon = FontLabColor(rawValue: "darksalmon")
    static let darkseagreen = FontLabColor(rawValue: "darkseagreen")
    static let darkslateblue = FontLabColor(rawValue: "darkslateblue")
    static let darkslategray = FontLabColor(rawValue: "darkslategray")
    static let darkslategrey = FontLabColor(rawValue: "darkslategrey")
    static let darkturquoise = FontLabColor(rawValue: "darkturquoise")
    static let darkviolet = FontLabColor(rawValue: "darkviolet")
    static let deeppink = FontLabColor(rawValue: "deeppink")
    static let deepskyblue = FontLabColor(rawValue: "deepskyblue")
    static let dimgray = FontLabColor(rawValue: "dimgray")
    static let dimgrey = FontLabColor(rawValue: "dimgrey")
    static let dodgerblue = FontLabColor(rawValue: "dodgerblue")
    static let firebrick = FontLabColor(rawValue: "firebrick")
    static let floralwhite = FontLabColor(rawValue: "floralwhite")
    static let forestgreen = FontLabColor(rawValue: "forestgreen")
    static let fuchsia = FontLabColor(rawValue: "fuchsia")
    static let gainsboro = FontLabColor(rawValue: "gainsboro")
    static let ghostwhite = FontLabColor(rawValue: "ghostwhite")
    static let gold = FontLabColor(rawValue: "gold")
    static let goldenrod = FontLabColor(rawValue: "goldenrod")
    static let gray = FontLabColor(rawValue: "gray")
    static let grey = FontLabColor(rawValue: "grey")
    static let green = FontLabColor(rawValue: "green")
    static let greenyellow = FontLabColor(rawValue: "greenyellow")
    static let honeydew = FontLabColor(rawValue: "honeydew")
    static let hotpink = FontLabColor(rawValue: "hotpink")
    static let indianred = FontLabColor(rawValue: "indianred")
    static let indigo = FontLabColor(rawValue: "indigo")
    static let ivory = FontLabColor(rawValue: "ivory")
    static let khaki = FontLabColor(rawValue: "khaki")
    static let lavender = FontLabColor(rawValue: "lavender")
    static let lavenderblush = FontLabColor(rawValue: "lavenderblush")
    static let lawngreen = FontLabColor(rawValue: "lawngreen")
    static let lemonchiffon = FontLabColor(rawValue: "lemonchiffon")
    static let lightblue = FontLabColor(rawValue: "lightblue")
    static let lightcoral = FontLabColor(rawValue: "lightcoral")
    static let lightcyan = FontLabColor(rawValue: "lightcyan")
    static let lightgoldenrodyellow = FontLabColor(rawValue: "lightgoldenrodyellow")
    static let lightgray = FontLabColor(rawValue: "lightgray")
    static let lightgrey = FontLabColor(rawValue: "lightgrey")
    static let lightgreen = FontLabColor(rawValue: "lightgreen")
    static let lightpink = FontLabColor(rawValue: "lightpink")
    static let lightsalmon = FontLabColor(rawValue: "lightsalmon")
    static let lightseagreen = FontLabColor(rawValue: "lightseagreen")
    static let lightskyblue = FontLabColor(rawValue: "lightskyblue")
    static let lightslategray = FontLabColor(rawValue: "lightslategray")
    static let lightslategrey = FontLabColor(rawValue: "lightslategrey")
    static let lightsteelblue = FontLabColor(rawValue: "lightsteelblue")
    static let lightyellow = FontLabColor(rawValue: "lightyellow")
    static let lime = FontLabColor(rawValue: "lime")
    static let limegreen = FontLabColor(rawValue: "limegreen")
    static let linen = FontLabColor(rawValue: "linen")
    static let magenta = FontLabColor(rawValue: "magenta")
    static let maroon = FontLabColor(rawValue: "maroon")
    static let mediumaquamarine = FontLabColor(rawValue: "mediumaquamarine")
    static let mediumblue = FontLabColor(rawValue: "mediumblue")
    static let mediumorchid = FontLabColor(rawValue: "mediumorchid")
    static let mediumpurple = FontLabColor(rawValue: "mediumpurple")
    static let mediumseagreen = FontLabColor(rawValue: "mediumseagreen")
    static let mediumslateblue = FontLabColor(rawValue: "mediumslateblue")
    static let mediumspringgreen = FontLabColor(rawValue: "mediumspringgreen")
    static let mediumturquoise = FontLabColor(rawValue: "mediumturquoise")
    static let mediumvioletred = FontLabColor(rawValue: "mediumvioletred")
    static let midnightblue = FontLabColor(rawValue: "midnightblue")
    static let mintcream = FontLabColor(rawValue: "mintcream")
    static let mistyrose = FontLabColor(rawValue: "mistyrose")
    static let moccasin = FontLabColor(rawValue: "moccasin")
    static let navajowhite = FontLabColor(rawValue: "navajowhite")
    static let navy = FontLabColor(rawValue: "navy")
    static let oldlace = FontLabColor(rawValue: "oldlace")
    static let olive = FontLabColor(rawValue: "olive")
    static let olivedrab = FontLabColor(rawValue: "olivedrab")
    static let orange = FontLabColor(rawValue: "orange")
    static let orangered = FontLabColor(rawValue: "orangered")
    static let orchid = FontLabColor(rawValue: "orchid")
    static let palegoldenrod = FontLabColor(rawValue: "palegoldenrod")
    static let palegreen = FontLabColor(rawValue: "palegreen")
    static let paleturquoise = FontLabColor(rawValue: "paleturquoise")
    static let palevioletred = FontLabColor(rawValue: "palevioletred")
    static let papayawhip = FontLabColor(rawValue: "papayawhip")
    static let peachpuff = FontLabColor(rawValue: "peachpuff")
    static let peru = FontLabColor(rawValue: "peru")
    static let pink = FontLabColor(rawValue: "pink")
    static let plum = FontLabColor(rawValue: "plum")
    static let powderblue = FontLabColor(rawValue: "powderblue")
    static let purple = FontLabColor(rawValue: "purple")
    static let rebeccapurple = FontLabColor(rawValue: "rebeccapurple")
    static let red = FontLabColor(rawValue: "red")
    static let rosybrown = FontLabColor(rawValue: "rosybrown")
    static let royalblue = FontLabColor(rawValue: "royalblue")
    static let saddlebrown = FontLabColor(rawValue: "saddlebrown")
    static let salmon = FontLabColor(rawValue: "salmon")
    static let sandybrown = FontLabColor(rawValue: "sandybrown")
    static let seagreen = FontLabColor(rawValue: "seagreen")
    static let seashell = FontLabColor(rawValue: "seashell")
    static let sienna = FontLabColor(rawValue: "sienna")
    static let silver = FontLabColor(rawValue: "silver")
    static let skyblue = FontLabColor(rawValue: "skyblue")
    static let slateblue = FontLabColor(rawValue: "slateblue")
    static let slategray = FontLabColor(rawValue: "slategray")
    static let slategrey = FontLabColor(rawValue: "slategrey")
    static let snow = FontLabColor(rawValue: "snow")
    static let springgreen = FontLabColor(rawValue: "springgreen")
    static let steelblue = FontLabColor(rawValue: "steelblue")
    static let tan = FontLabColor(rawValue: "tan")
    static let teal = FontLabColor(rawValue: "teal")
    static let thistle = FontLabColor(rawValue: "thistle")
    static let tomato = FontLabColor(rawValue: "tomato")
    static let turquoise = FontLabColor(rawValue: "turquoise")
    static let violet = FontLabColor(rawValue: "violet")
    static let wheat = FontLabColor(rawValue: "wheat")
    static let white = FontLabColor(rawValue: "white")
    static let whitesmoke = FontLabColor(rawValue: "whitesmoke")
    static let yellow = FontLabColor(rawValue: "yellow")
    static let yellowgreen = FontLabColor(rawValue: "yellowgreen")
}

import SwiftUI
extension FontLabColor {
   public static var allColors: [Color] {
        rgbaValues.map { (key, value) in
            Color(.sRGB, red: Double(value.r), green: Double(value.g), blue: Double(value.b), opacity: Double(value.a))
        }
    }
}
