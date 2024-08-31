//
//  GameView.swift
//  croco
//
//  Created by Круглич Влад on 28.06.24.
//

import SwiftUI

struct GameView: View {
    @StateObject var vm: ViewModel
    var body: some View {
        VStack {
            if vm.time == 0 {
                VStack {
                    ZStack {
                        Image("bg1")
                            .resizable()
                            .frame(width: 300, height: 200)
                            .cornerRadius(30)
                        Text("СЧЕТ: \(vm.score)")
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                            .bold()
                    }
                    HStack {
                        Button(action: {
                            vm.currentView = "HomeView"
                        }) {
                            Image(systemName: "house")
                                .foregroundColor(.white)
                                .frame(width: 140, height: 50)
                                .background(.green)
                                .cornerRadius(20)
                                .font(.system(size: 30))
                        }
                        Button(action: {
                            vm.currentView = "GameView"
                            vm.time = 200
                            vm.score = 0
                        }) {
                            Image(systemName: "gobackward")
                                .foregroundColor(.white)
                                .frame(width: 140, height: 50)
                                .background(.gray)
                                .cornerRadius(20)
                                .font(.system(size: 30))
                        }

                    }   
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(Color.gray.opacity(0.4))
            }
            else {
                ZStack {
                    Image("bg1")
                    VStack {
                        Spacer()
                        VStack {
                            HStack {
                                HStack {
                                    Text("Время:")
                                    Text("\(vm.time)")
                                }
                                Spacer()
                                HStack {
                                    Text("Счет:")
                                    Text("\(vm.score)")
                                }
                            }
                            .bold()
                            .font(.system(size: 20))
                            .padding(.horizontal, 70)
                            Image(vm.word.image)
                                .resizable()
                                .frame(width: 300, height: 230)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                            Text(vm.word.word)
                                .bold()
                                .font(.system(size: 40))
                                .foregroundStyle(.white)
                        }
                        .padding(.top, 50)
                        Spacer()
                        VStack {
                            Button(action: {
                                vm.randomWord()
                                vm.plusScore()
                            }) {
                                Text("Засчитано")
                                    .foregroundStyle(.white)
                                    .frame(width: 250, height: 70)
                                    .background(.green)
                                    .cornerRadius(20)
                                    .bold()
                                    .font(.system(size: 25))
                            }
                            Button(action: {
                                vm.randomWord()
                                vm.minusScore()
                            }) {
                                Text("Не засчитано")
                                    .foregroundStyle(.white)
                                    .frame(width: 250, height: 70)
                                    .background(.red)
                                    .opacity(0.8)
                                    .cornerRadius(20)
                                    .bold()
                                    .font(.system(size: 25))
                            }
                            
                            HStack {
                                Button(action: {
                                    vm.currentView = "HomeView"
                                }) {
                                    Image(systemName: "house")
                                        .foregroundColor(.white)
                                        .frame(width: 50, height: 50)
                                        .background(.gray)
                                        .cornerRadius(20)
                                        .font(.system(size: 20))
                                }
                                Button(action: {
                                    vm.time = 200
                                    vm.score = 0
                                }) {
                                    Image(systemName: "gobackward")
                                        .foregroundColor(.white)
                                        .frame(width: 50, height: 50)
                                        .background(.gray)
                                        .cornerRadius(20)
                                        .font(.system(size: 20))
                                }
                            }

                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    GameView(vm: ViewModel())
}
