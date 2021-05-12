//
//  FLElementData.swift
//  FontLabJsonKit
//
//  Created by Łukasz Dziedzic on 28/10/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public class FontLabElementData: Codable {
    public var composite: FontLabComposite?
    public var name: String?
    public var contours: [FontLabContour]?
}

extension FontLabElementData: CustomStringConvertible {
    public var description: String {
        return "\nContours" + (contours ?? []).reduce(into: "\nContour \(name ?? "no name")\n", {result, elemData in
            result += elemData.nodes.reduce(into: "") { res, node in
                res += "\tnode: \(node.description)\n"
            }
        })
    }
}
