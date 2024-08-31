//
//  ContentView.swift
//  croco
//
//  Created by Круглич Влад on 28.06.24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ViewModel()
    var body: some View {
        if vm.currentView == "HomeView" {
            HomeView(vm: vm)
        }
        else if vm.currentView == "GameView" {
            GameView(vm: vm)
        }
    }
}

#Preview {
    ContentView()
}
