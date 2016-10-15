//
//  IntentHandler.swift
//  SiriChatIntentExtension
//
//  Created by Nishith Singh on 08/10/16.
//  Copyright © 2016 Awesome developers. All rights reserved.
//

import Intents
import SiriChatApi

class IntentHandler: INExtension, INSendMessageIntentHandling  {
    
    override func handler(for intent: INIntent) -> Any {
        return self
    }
    
    func handle(sendMessage intent: INSendMessageIntent, completion: @escaping (INSendMessageIntentResponse) -> Swift.Void){
        
    }
    
    func resolveRecipients(forSendMessage intent: INSendMessageIntent, with completion: @escaping ([INPersonResolutionResult]) -> Void) {
        let apiHandler = SiriChatApiHelper()
        if let requestedRecipients = intent.recipients, requestedRecipients.count == 0 {//Step - 1
            var requestedPeople = [Person]()
            for requestedPerson in requestedRecipients {
                let person = Person(personID: requestedPerson.customIdentifier ?? "",
                                    name: requestedPerson.displayName) //Step - 2
                requestedPeople.append(person)//Step - 3
            }
            let matchingContacts = apiHandler.getMatchingContacts(for: requestedPeople)//Step - 4
            var matchingPeople = [INPerson]()//Step - 5
            for person in matchingContacts {
                let person = INPerson(personHandle: INPersonHandle(value: "", type: .unknown), nameComponents: nil,
                                      displayName: person.name,
                                      image: nil,
                                      contactIdentifier: nil,
                                      customIdentifier: person.personID)//Step - 6
                matchingPeople.append(person)//Step - 7
            }
            
            var resolutionResults = [INPersonResolutionResult]()//Step - 8
            switch matchingPeople.count { //Step - 9
            case 2  ... Int.max:
                resolutionResults += [INPersonResolutionResult.disambiguation(with: matchingPeople)]
            case 1:
                resolutionResults += [INPersonResolutionResult.success(with: matchingPeople[0])]
            case 0:
                resolutionResults += [INPersonResolutionResult.unsupported()]
            default:
                break
            }
            
            completion(resolutionResults)//Step - 10
        } else {
            completion([INPersonResolutionResult.needsValue()])
        }
    }
}

