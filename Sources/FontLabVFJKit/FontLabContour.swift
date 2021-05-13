//
//  FLContour.swift
//  FontLabJsonKit
//
//  Created by Łukasz Dziedzic on 28/10/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public class FontLabContour: Codable {
    public var nodes: [FontLabNode]
}

extension FontLabContour: CustomStringConvertible {
    public var description: String {
        return "FL Layer, \(nodes.count) node \(nodes.count == 1 ? "" : "s")"
    }
}
