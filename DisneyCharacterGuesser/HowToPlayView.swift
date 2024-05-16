//
//  HowToPlayView.swift
//  DisneyCharacterGuesser
//
//  Created by Thomas Ogawa on 5/15/24.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        VStack{
            Text("How to Play")
                .font(.system(size: 50))
                .foregroundColor(.white)
                .padding(.top, 150)
                .underline()
            Text("Enter your guess in the bottom of the play screen")
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 20.0)
                .padding(.top, 20)
            Text("Press the 'Reveal Name' button if you can not figure out who the character is")
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 42.0)
                .padding(.top, 20)
            Text("Use the 'New Charcter' button to skip onto the next character")
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 40.0)
                .padding(.top, 20)
            Text("Use the settings tab (bottom left) in order to change preferences to one's liking")
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 39.0)
                .padding(.top, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor(rgb: 0x43B0FF)))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    HowToPlayView()
}
