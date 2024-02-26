//
//  AEXML_ExperimentApp.swift
//  AEXML Experiment
//
//  Created by Amos Deane on 23/02/2024.
//

import SwiftUI

@main
struct AEXML_ExperimentApp: App {
    
    let animals: Animals
    
    init() {
        self.animals = Animals()
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(animals)
        }
    }
}
