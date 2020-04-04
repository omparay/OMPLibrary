//
// Parser.swift
//
// Created by Oliver Paray on 04/04/2020
//

import Foundation

public typealias JSON = Dictionary<String, Any>

public class Parser {

    //MARK: Properties
    public var data: Data?{
        return try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
    
    //MARK: Initializers


    //MARK: Class Methods
    public static func jsonFrom(url: URL) -> JSON?{
        guard let data = try? Data(contentsOf: url),
              let json = jsonFrom(data: data)
        else { return nil}
        return json
    }

    public static func jsonFrom(data: Data) -> JSON?{
        return try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? JSON
    }

    public static func jsonFrom(string: String) -> JSON?{
        guard let data = string.data(using: .utf8) else { return nil }
        return jsonFrom(data: data)
    }
    
    //MARK: Public Methods
    
    
    //MARK: Private Methods
    
    
    //MARK: Delegates
    
    
    //MARK: Datasource
    
    
    //MARK: Handlers
    
    
}