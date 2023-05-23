//
//  LaunchScreenView.swift
//  MonsterHunterRiseAppBeta
//
//  Created by Carlos Rodriguez toledo on 23/5/23.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @StateObject var monsters = MonsterModel()

    var body: some View {
        if isActive {
            MonstersView()
                 .environmentObject(monsters)
        } else {
            VStack {
                VStack {
                    
                    Image("launchIcon")
                        .resizable()
                        .frame(width: 230, height: 150)
                        .padding(.bottom, 15)
                    
                    Text("Welcome to MH guide!")
                        .font(Font.custom("Baskerville-bold", size: 26))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 2.0)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
