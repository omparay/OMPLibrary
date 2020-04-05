//
// String+Extension.swift
//
// Created by Oliver Paray on 04/05/2020
//

import Foundation

public extension String{

    //MARK: Properties
    static var empty: String{
        return String()
    }

    var length: Int{
        return self.count
    }
    
    //MARK: Initializers
    init(queryStringFromDictionary input: Dictionary<AnyHashable,Any>){
        self.init()
        for (key,value) in input{
            if let key1 = ("\(key)").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                let value1 = ("\(value)").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
                self.append("\(key1)=\(value1)&")
            }
        }
        if self.count > 0{
            self.insert("?", at: self.startIndex)
            self.removeLast(1)
        }
    }

    init(forceCastOrEmpty: Any?){
        if let temp = forceCastOrEmpty as? String {
            self.init(temp)
        } else {
            self.init(String.empty)
        }
    }

    //MARK: Class Methods
    
    
    //MARK: Public Methods
    func subString(start: Int) -> String{
        let startIndex = self.index(self.startIndex, offsetBy: start)
        return String(self[startIndex...])
    }
    
    func subString(end: Int) -> String{
        let endIndex = self.index(self.startIndex, offsetBy: end)
        return String(self[..<endIndex])
    }
    
    func subString(start: Int, end: Int) -> String{
        let startIndex = self.index(self.startIndex, offsetBy: start-1)
        let endIndex = self.index(self.startIndex, offsetBy: end)
        return String(self[startIndex..<endIndex])
    }

    func toBool() -> Bool?{
        switch self {
        case "TRUE", "True", "true", "YES", "Yes", "yes", "1":
            return true
        case "FALSE", "False", "false", "NO", "No", "no", "0":
            return false
        default:
            return nil
        }
    }
    
    func redComponent() -> String?{
        if self.count >= 2{
            return self.subString(end: 2)
        }
        return nil
    }
    
    func greenComponent() -> String?{
        if self.count >= 4{
            return self.subString(start: 3, end: 4)
        }
        return nil
    }

    func blueComponent() -> String?{
        if self.count >= 6{
            return self.subString(start: 5, end: 6)
        }
        return nil
    }

    func alphaComponent() -> String?{
        if self.count >= 8{
            return self.subString(start: 7, end:8)
        }
        return nil
    }
            
    //MARK: Private Methods
    
    
}