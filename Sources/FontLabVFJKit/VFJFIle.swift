//
//  FLFIle.swift
//  FontLabJsonKit
//
//  Created by Łukasz Dziedzic on 28/10/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public struct VFJFile: Codable {
    public var version: Int
    public var font: FontLabFont
}
