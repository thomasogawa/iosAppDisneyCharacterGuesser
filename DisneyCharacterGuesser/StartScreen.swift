//
//  StartScreen.swift
//  DisneyCharacterGuesser
//
//  Created by Thomas Ogawa on 5/15/24.
//

import SwiftUI

struct StartScreen: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Text("Disney Character")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text("Guessing Game")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Image("white_mickey_question")
                    .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Text("Tap to Continue...")
                    .foregroundColor(Color.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor(rgb: 0x43B0FF)))
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}

