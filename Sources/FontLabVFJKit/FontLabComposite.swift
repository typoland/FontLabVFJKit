//
//  FLComposite.swift
//  FontLabJsonKit
//
//  Created by Łukasz Dziedzic on 29/10/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public class FontLabComponent: Codable {
    public var glyphName, layerName: String?
}

public class FontLabComposite: Codable {
    public var builder: FontLabBuilder
}


public class FontLabBuilder: Codable {
    public var builderGroup: FontLabBuilderGroup
}

public class FontLabBuilderGroup: Codable {
}


public struct FontLabTransform: Codable {
    public var xScale, yScale: Double?
    public var xOffset, yOffset: Double?
}


