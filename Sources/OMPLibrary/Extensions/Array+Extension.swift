//
// Array+Extension.swift
//
// Created by Oliver Paray on 04/05/2020
//

import Foundation

public extension Array where Element:Equatable{

    //MARK: Properties
    
    
    //MARK: Initializers
    
    
    //MARK: Class Methods
    
    
    //MARK: Public Methods
    mutating func remove(_ obj:Element?){
        guard let temp = obj, let idx = firstIndex(of: temp) else { return }
        remove(at: idx)
    }

    mutating func removeEach(_ col:[Element]?){
        guard let temp = col, temp.count > 0 else { return }
        for item in temp{
            remove(item)
        }
    }
    
    //MARK: Private Methods
    
        
}

public extension Array{

    //MARK: Properties
    var csv: String{
        return concatenatedString()
    }

    //MARK: Initializers
    
    
    //MARK: Class Methods
    
    
    //MARK: Public Methods
    func concatenatedString(delimiter: String = ",") -> String{
        let result = self.reduce("", { (initial, element) -> String in
            initial + "\(element)" + delimiter
        })
        return String(result[result.startIndex..<result.index(result.endIndex, offsetBy: -delimiter.length)])
    }

    func clamp(_ index:Int) -> Int{
        return index <= 0 ? 0 : count < index ? count : index
    }
    
    mutating func cut(from:Int,to:Int) -> [Element]?{
        let from = clamp(from)
        let to = clamp(to)
        
        guard from < to else {return nil}
        
        let result = [Element](self[from...to])
        
        self.removeSubrange(from...to)
        
        return result
    }
    
    mutating func cut(from:Int) -> [Element]?{
        return cut(from: from, to: count)
    }
    
    mutating func cut(to:Int) -> [Element]?{
        return cut(from: 0, to: to)
    }
    
    //MARK: Private Methods
    
    
}