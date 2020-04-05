//
// Dictionary+Extension.swift
//
// Created by Oliver Paray on 04/05/2020
//

import Foundation

public extension Dictionary{

    //MARK: Properties
    var allKeys: [Any]{
        return Array(self.keys)
    }
    
    var queryString: String{
        return String(queryStringFromDictionary: self)
    }

    //MARK: Initializers
    
    
    //MARK: Class Methods


    //MARK: Public Methods
    func containsKey(_ key:Key) -> Bool{
        return self.keys.contains(key)
    }

    func merged(with dict:Dictionary) -> Dictionary{
        var result = self
        result.merge(with: dict)
        return result
    }
    
    //MARK: Private Methods
    fileprivate mutating func merge(with dict:Dictionary){
        dict.forEach { updateValue($1, forKey: $0) }
    }
        
}