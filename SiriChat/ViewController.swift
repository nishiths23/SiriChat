//
//  ViewController.swift
//  SiriChat
//
//  Created by Nishith Singh on 08/10/16.
//  Copyright © 2016 Awesome developers. All rights reserved.
//

import UIKit
import Intents
import SiriChatApi

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchContactsAndSyncWithSiri()
    }
    
    private func fetchContactsAndSyncWithSiri(){
        let contactsFetcher = ContactsFetcher()
        let people = contactsFetcher.fetchAllContacts()
        
        let names = people.map { $0.name } //Step 1
        let workoutNames = NSOrderedSet(array: names)//Step 2
        let vocabulary = INVocabulary.shared()
        vocabulary.setVocabularyStrings(workoutNames, of: .contactName)//Step 3
    }
}

