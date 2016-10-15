//
//  ContactsFetcher.swift
//  SiriChat
//
//  Created by Nishith Singh on 10/10/16.
//  Copyright © 2016 Awesome developers. All rights reserved.
//

import Foundation

public class ContactsFetcher{
    public init(){}
    
    private let contacts = [Person(personID:"0",name: "Jessie"),
                            Person(personID:"1",name: "Jessie Home"),
                            Person(personID:"2",name: "Jessie Work"),
                            Person(personID:"3",name: "James")]
    
    public func fetchAllContacts() -> [Person]{
        return contacts
    }
}
