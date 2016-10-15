//
//  Person.swift
//  SiriChat
//
//  Created by Nishith Singh on 09/10/16.
//  Copyright © 2016 Awesome developers. All rights reserved.
//

import Foundation

public class Person {
    public var name : String
    public var personID : String
    
    
    public init(personID:String,name:String) {
        self.name = name
        self.personID = personID
    }

}
