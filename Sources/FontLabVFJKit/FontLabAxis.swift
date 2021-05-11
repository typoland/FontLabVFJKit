//
//  Axis.swift
//  FontLabVFJKit
//
//  Created by Łukasz Dziedzic on 05/11/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public class FontLabAxis: Codable {
    public var name: String
    public var shortName: String
    public var tag: String
    public var minimum: Double
    public var maximum: Double
    public var designMinimum : Double
    public var designMaximum : Double
    public var `default`: Double
    public var playStart: Double?
    public var playEnd: Double?
    //var axisInstances":[
}

extension FontLabAxis: CustomStringConvertible {
    public var description: String {
        return "FontLabAxis \(name) <\(shortName)>: \(minimum)...\(maximum)"
    }
}
