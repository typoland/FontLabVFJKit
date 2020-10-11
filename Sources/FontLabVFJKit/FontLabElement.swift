//
//  FLElement.swift
//  FontLabJsonKit
//
//  Created by Łukasz Dziedzic on 28/10/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public class FontLabElement: Codable {
    public var elementData: FontLabElementDataUnion?
    public var transform: FontLabTransform?
    public var active: Bool?
    public var component: FontLabComponent?
    public var nonSpacing: Bool?
}

