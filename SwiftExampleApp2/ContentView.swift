//
//  ContentView.swift
//  SwiftExampleApp2
//
//  Created by Ashton Huxtable on 11/4/25.
//

import SwiftUI
import Segment

struct TrackProperties: Codable {
    let quote: String
    let age: String
}

struct MyTraits: Codable {
    let name: String
    let email: String
}

struct ContentView: View {
    var body: some View {

        ZStack {
            Color(red: 0.0, green: 0.1, blue: 0.2) // Dark navy background
                        .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                Text("SwiftExampleApp")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)  // iOS 15+
                    .padding(.top, 100)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                // Button Group
                VStack(spacing: 16) {
                    ActionButton(title: "Track") {
                        analytics.track(
                            name: "Track Tapped",
                            properties: TrackProperties(quote: "Hello, World", age: "22")
                        )
                    }
                    
                    ActionButton(title: "Identify") {
                        analytics.identify(
                            userId: "12345",
                            traits: MyTraits(name: "john doe", email: "johnd2@example.com")
                        )
                    }
                    
                    ActionButton(title: "Screen") {
                        analytics.screen(title: "Home Screen Tapped")
                    }
                    
                    ActionButton(title: "Alias") {
                        analytics.alias(newId: "09876")
                    }
                    
                    ActionButton(title: "Group") {
                        analytics.group(groupId: "888888")
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
                .padding(.top, 40)
                
                Spacer()
               
                SmallActionButton(title: "Flush") {
                               analytics.flush()  // Add your flush action here
                           }
                           .padding(.horizontal, 20)
                           .padding(.bottom, 50)
            }
            
        }
    }
}

// MARK: - Reusable Button Component
struct ActionButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}

struct SmallActionButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.black)  // Add this line
                .frame(maxWidth: 200)
                .frame(height: 50)
        }
        .buttonStyle(.borderedProminent)
        .tint(.mint)
        .controlSize(.small)
    }
}

#Preview {
    ContentView()
}
