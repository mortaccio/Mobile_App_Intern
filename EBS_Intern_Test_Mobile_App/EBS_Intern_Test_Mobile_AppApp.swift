//
//  EBS_Intern_Test_Mobile_AppApp.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 14/03/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore

@main
struct EBS_Intern_Test_Mobile_AppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
