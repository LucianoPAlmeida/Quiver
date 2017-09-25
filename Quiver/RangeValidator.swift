//
//  RangeValidator.swift
//  Quiver
//
//  Created by Heitor Costa on 19/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

class BetweenComparator<T>: Validator where T: Comparable {
    
    private var value1: T
    private var value2: T
    
    init(value1: T, value2: T) {
        self.value1 = value1
        self.value2 = value2
    }
    
    override func validate(with object: Any?) throws -> Bool {
        if object == nil {
            return true
        }
        
        guard let value = object! as? T else {
            throw ValidationErrorType.typeMismatch(expected: T.self, actual: type(of: object!))
        }
        
        return value > self.value1 && value < self.value2
    }
}

class RangeComparator<T>: Validator where T: Comparable {
    
    private var value1: T
    private var value2: T
    
    init(value1: T, value2: T) {
        self.value1 = value1
        self.value2 = value2
    }
    
    override func validate(with object: Any?) throws -> Bool {
        if object == nil {
            return true
        }
        
        guard let value = object! as? T else {
            throw ValidationErrorType.typeMismatch(expected: T.self, actual: type(of: object!))
        }
        
        return value >= self.value1 && value <= self.value2
    }
}
