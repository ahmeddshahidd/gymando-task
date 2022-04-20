//
//  ExcerciseCoordinator.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 20.04.22.
//

import SwiftUI

struct ExcerciseListCoordinator: View {
    
    @State private var selectedExcercise: Excercise?
    
    var body: some View {
        VStack {
            ExcerciseListView(tapOnExcerciseAction: { excercise in
                selectedExcercise = excercise
                debugPrint("go to excercise detail: \(selectedExcercise?.id)")
            })
                .listStyle(PlainListStyle())
                .navigationTitle("Excercises")
        }
    }
}
