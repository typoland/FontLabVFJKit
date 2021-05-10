//
//  FLNode.swift
//  FontLabJsonKit
//
//  Created by Łukasz Dziedzic on 28/10/2018.
//  Copyright © 2018 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public class FontLabNode: Codable {
    
    public init() {}
    
    enum errors:Error {
        case wrongPointsNumber(nr:Int) // 1 or 3
        case unknownType(type: String) //sgc
    }
    
    public enum NodeType : String, CaseIterable {
        case closeTo = "c"
        case smooth = "s"
        case genius = "g2"
        case offQuad = "o"
        case servantX = "sx"
        case servantY = "sy"
         
        static var wordList:Set<String> {
            return Set(NodeType.allCases.map {$0.rawValue})
        }
        
        var re:NSRegularExpression {
            let pattern = "\\b\(self.rawValue)"
            return try! NSRegularExpression.init(pattern: "\(pattern)", options: [NSRegularExpression.Options.caseInsensitive])
        }

        func inside(text:String) -> Bool {
            let found = self.re.matches(in: text, options: [], range: NSMakeRange(0, text.count))
            return found.count > 0
        }
    }
    
    public required convenience init(from decoder: Decoder) throws {
        do {
            let string = try decoder.singleValueContainer().decode(String.self)
            try self.init(from: string)
        } catch {
            throw error
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        let numbersString = (0..<points.count).map {"\(String(format:"%0.0f %0.0f ",points[$0].x, points[$0].y))"}.reduce ("", +)
        let nameString = name != nil ? "{p:'\(name!)'} ": ""
        let typesString = nodeTypes.map {"\($0.rawValue) "}.reduce("", +)
        let s = String((numbersString + typesString + nameString).dropLast())
        var container = encoder.singleValueContainer()
        try container.encode(s)
        
    }
    
    //var nodeTypeCharacterSet = NodeType.characterSet
    public var nodeTypes:Set<NodeType> = []
    
    public var servantX: Bool {
        get {
            return nodeTypes.contains(.servantX)
        }
        set {
            if newValue {
                nodeTypes.insert(.servantX)
            } else {
                nodeTypes.remove(.servantX)
            }
        }
    }
    
    public var points : [CGPoint] = []
    public var name : String? = nil
    
    init(from string: String) throws {
        let scanner =  Scanner.init(string: string)
        let spaceCharacterSet = CharacterSet.whitespacesAndNewlines
        scanner.charactersToBeSkipped = spaceCharacterSet
        var number: Float = 0
        var numbers: [CGFloat] = []
        while scanner.scanFloat(&number){
            numbers.append(CGFloat (number))
        }

        points = (0..<numbers.count/2).map{NSMakePoint(numbers[$0*2], numbers[$0*2+1])}
//        if !(points.count != 1 || points.count != 3){
//            throw errors.wrongPointsNumber(nr: points.count)
//        }

        for nodeType in NodeType.allCases {
            if nodeType.inside(text: string) {
                nodeTypes.insert(nodeType)
            }
        }

        if let r1 = string.range(of: "{")?.upperBound,
            let r2 = string.range(of: "}")?.lowerBound {
            let s = String(string[r1..<r2]).split(separator: ",").map {$0.split(separator: ":")}
            let dict = s.reduce (into: [String:String]()) { (dict, element) in
                //var dict = dict
                dict[String(element[0])] = String(element[1].dropFirst().dropLast())
                //return dict
            }
            name = dict["p"]
        }
    }
}

extension FontLabNode:CustomStringConvertible {
    public var description: String {
        return "\(name != nil ? name!+":" : "") \(nodeTypes != [] ? nodeTypes.reduce("", {$0 + "\($1) "}).dropLast() : "") \(points)"
    }
}
