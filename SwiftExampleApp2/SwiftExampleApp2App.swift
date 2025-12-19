//
//  SwiftExampleApp2App.swift
//  SwiftExampleApp2
//
//  Created by Ashton Huxtable on 11/4/25.
//

import SwiftUI
import Segment


// Make analytics globally accessible
var analytics: Analytics!

@main
struct SwiftExampleApp2App: App {
    
    init() {
        // Configure Segment Analytics
        let configuration = Configuration(writeKey: "yT6KE54HpykfdryGTSjAn7Y0RPELOHJH")
            .setTrackedApplicationLifecycleEvents(.all)
            .flushInterval(10)  // Flush events every 10 seconds
            .flushAt(20)  // Flush when 20 events are queued
       
        Analytics.debugLogsEnabled = true

            
        analytics = Analytics(configuration: configuration)
        analytics?.add(plugin: InjectTraits())
        
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
            
        
        }
    }
}
