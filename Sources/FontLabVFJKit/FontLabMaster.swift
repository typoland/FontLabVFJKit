//
//  Master.swift
//  FontLabVFJKit
//
//  Created by Łukasz Dziedzic on 05/11/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//


import Foundation
public class FontLabMaster:Codable {
    public var fontMaster: FontLabFontMaster
}


extension FontLabMaster:CustomStringConvertible {
    public var description:String {
        return "\(fontMaster)"
    }
}

