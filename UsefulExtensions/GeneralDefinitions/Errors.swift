//
//  Errors.swift
//  UsefulExtensions
//
//  Created by Douglas Gehring on 16/11/20.
//  Copyright © 2020 Douglas Gehring. All rights reserved.
//

import Foundation

enum AppErrors: LocalizedError {
    
    case dicInvalidKey
    
    var errorDescription: String? {
        switch self {
        case .dicInvalidKey: return "Dictionary null elements error"
        }
    }
    
    var errorCode: Int? {
        switch self {
        case .dicInvalidKey: return -1
        }
    }
}
