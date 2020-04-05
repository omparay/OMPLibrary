//
// Feature.swift
//
// Created by Oliver Paray on 04/05/2020
//

import Foundation

public typealias FeatureList = [String: Bool]
public typealias ErrorHandler = (Error) -> Void

public class Features{

    //MARK: Properties
    public static var sharedInstance = Features()

    private var features = FeatureList()
    
    //MARK: Initializers
    
    
    //MARK: Class Methods
    
    
    //MARK: Public Methods
    public func load(_ errorHandler: ErrorHandler?){

    }

    public func save(_ errorHandler: ErrorHandler?){

    }

    public func isEnabled(name: String) -> Bool{
        return false
    }

    public func toggle(name: String){

    }

    public func enable(name: String){

    }

    public func disable(name: String){

    }

    public func export() -> FeatureList?{
        return nil
    }
    
    //MARK: Private Methods
    
    
    //MARK: Delegates
    
    
    //MARK: Datasource
    
    
    //MARK: Handlers
    
    
}