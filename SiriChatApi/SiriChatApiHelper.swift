//
//  SiriChatApiHelper.swift
//  SiriChat
//
//  Created by Nishith Singh on 10/10/16.
//  Copyright © 2016 Awesome developers. All rights reserved.
//

import Foundation

public class SiriChatApiHelper {
    public init() {}
    public func getMatchingContacts(for people:[Person]) -> [Person] {
        let contacts = ContactsFetcher().fetchAllContacts()//Step 1
        let matchingContacts = contacts.filter {//Step 2
            for name in people{
                if !$0.personID.isEmpty && !name.personID.isEmpty{//Step 3
                    return $0.personID == name.personID //Step 4
                }
                return $0.name.contains(name.name)//Step 5
            }
            return false
        }
        return matchingContacts//Step 6
    }
}
