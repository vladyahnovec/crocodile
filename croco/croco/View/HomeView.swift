//
//  HomeView.swift
//  croco
//
//  Created by Круглич Влад on 28.06.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm: ViewModel
    var body: some View {
        VStack {
            ZStack {
                Image("bg")
                Button(action: {
                    vm.currentView = "GameView"
                    //vm.randomWord()
                    vm.time = 200
                    vm.startTimer()
                    vm.score = 0
                }) {
                    Text("Начать игру!")
                        .foregroundStyle(.white)
                        .frame(width: 250, height: 70)
                        .background(.green)
                        .cornerRadius(20)
                        .bold()
                        .font(.system(size: 25))
                        .padding(.top, 300)
                }
            }
        }
    }
}
