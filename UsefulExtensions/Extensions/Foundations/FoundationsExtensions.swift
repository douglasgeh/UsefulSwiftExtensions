//
//  FoundationsExtensions.swift
//  UsefulExtensions
//
//  Created by Douglas Gehring on 16/11/20.
//  Copyright © 2020 Douglas Gehring. All rights reserved.
//

import Foundation

public extension Date {
    func toString(withFormat format: DateFormats) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
}

public extension Dictionary {
    func tryValue(forKey key: Key) throws -> Value {
        guard let value = self[key] else { throw AppErrors.dicInvalidKey }
        return value
    }
}

public extension Collection {
    subscript(safe index: Index) -> Element? {
        return startIndex <= index && index < endIndex ? self[index] : nil
    }
}

public extension NSArray {
    func sorted(byOrder order: ArraySortingOrder, withKey key: String) -> NSArray {
        let sortDescriptor = NSSortDescriptor.init(key: key, ascending: order == .ascending)
        guard let array = NSArray(object: sortDescriptor) as? [NSSortDescriptor] else {
            return self
        }
        
        return self.sortedArray(using: array) as NSArray
    }
}

public extension Array {
    func toNSArray() -> NSArray {
        return NSArray.init(array: self)
    }
}

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}

