//
//  SettingsView.swift
//  DisneyCharacterGuesser
//
//  Created by Thomas Ogawa on 5/15/24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var showFilms: Bool
    @Binding var showImg: Bool
    
    var body: some View {
        VStack{
            Text("Settings")
                .font(.system(size: 50.0))
                .foregroundColor(Color.white)
                .padding(.top, 150)
                .underline()
            Toggle("Show Films", isOn: $showFilms)
                .font(.title)
                .foregroundColor(Color.white)
                .padding(.horizontal, 20.0)
                .padding(.top, 50)
            Text("When selected any movies the character has appeared in will be shown as a hint")
                .foregroundColor(Color.white)
                .padding(.horizontal, 10.0)
            
            Toggle("Show Character", isOn: $showImg)
                .font(.title)
                .foregroundColor(Color.white)
                .padding(.horizontal, 20.0)
                .padding(.top, 50)
            
            Text("When selected an image of the charachter will be show. Default is always on")
                .foregroundColor(Color.white)
                .padding(.horizontal, 10.0)

            Spacer(minLength: 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor(rgb: 0x43B0FF)))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SettingsView(showFilms: .constant(true), showImg: .constant(true))
}
