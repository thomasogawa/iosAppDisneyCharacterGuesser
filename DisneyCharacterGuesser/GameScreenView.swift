//
//  GameScreenView.swift
//  DisneyCharacterGuesser
//
//  Created by Thomas Ogawa on 5/15/24.
//

import SwiftUI

struct GameScreenView: View {
    @ObservedObject var disneyCharacterViewModel: DisneyCharacterViewModel
    @Binding var showFilms: Bool
    @Binding var showImg: Bool
    
    @State private var showName: Bool = false
    @State private var playerGuess: String = ""
    @State private var showAlert: Bool = false
    @State private var isCorrectGuess: Bool = false

    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    nextCharacter()
                }) {
                    Text("New Character")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(UIColor(rgb: 0xB5A491)))
                        .cornerRadius(10)
                }
                .padding(.trailing, 15.0)
                
                Button(action: {
                    showName = true
                }) {
                    Text("Reveal Name")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(UIColor(rgb: 0xB5A491)))
                        .cornerRadius(10)
                }
                .padding(.leading, 15.0)
            }
            Text("Who is this?")
                .font(.system(size: 50.0))
                .foregroundColor(Color.white)
                .padding(.top, 30.0)
                .underline()
            Text("Note* could be multiple people/group")
                .font(.caption2)
                .foregroundColor(Color.white)
            if let character = disneyCharacterViewModel.character {
                if showName {
                    Text(character.name)
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                }
                
                if showImg {
                    if let url = URL(string: character.imgUrl) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
                
                if showFilms {
                    ScrollView(.horizontal){
                        Text("Films: \(character.films.joined(separator: ", "))")
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 10)
                    Text("Swipe to view all films (if applicable)")
                        .foregroundColor(Color.white)
                        .font(.caption)
                }

                TextField("Enter your guess", text: $playerGuess, onCommit: {
                    checkGuess(characterName: character.name)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                Button(action: {
                    checkGuess(characterName: character.name)
                }) {
                    Text("Submit Guess")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(UIColor(rgb: 0xB5A491)))
                        .cornerRadius(10)
                }
            } else {
                Text("No character data available.")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor(rgb: 0x43B0FF)))
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(isCorrectGuess ? "Good job!" : "Wrong!"),
                message: Text(isCorrectGuess ? "You guessed the character correctly!" : "That is not the name of the character. Try again!"),
                dismissButton: .default(Text(isCorrectGuess ? "Next Character" : "Try Again"), action: {
                    if isCorrectGuess {
                        nextCharacter()
                    }
                    playerGuess = ""
                })
            )
        }
        .onAppear {
            nextCharacter()
        }
    }

    func checkGuess(characterName: String) {
        if playerGuess.lowercased() == characterName.lowercased() {
            isCorrectGuess = true
        } else {
            isCorrectGuess = false
        }
        showAlert = true
    }

    func nextCharacter() {
        playerGuess = ""
        disneyCharacterViewModel.fetchRandomCharacter()
        showAlert = false
        showName = false
    }
}

struct GameScreenView_Previews: PreviewProvider {
    static var previews: some View {
        GameScreenView(disneyCharacterViewModel: DisneyCharacterViewModel(), showFilms: .constant(true), showImg: .constant(true))
    }
}

