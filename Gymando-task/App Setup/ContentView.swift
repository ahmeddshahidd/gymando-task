//
//  ContentView.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 20.04.22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ExcerciseListCoordinator()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
