//
//  ViewModel.swift
//  DisneyCharacterGuesser
//
//  Created by Thomas Ogawa on 5/15/24.
//

import Foundation

class DisneyCharacterViewModel: ObservableObject {
    @Published var character: DisneyCharacter?
    @Published var errorMessage: String?

    //let characterIDs = [5074, 5416, 6160, 7381] // No longer needed just for testing
    
    func fetchRandomCharacter() {
        guard let randomID = validCharacterIds.randomElement() else {
            self.errorMessage = "No character ID available"
            return
        }
        let urlString = "https://api.disneyapi.dev/characters/\(randomID)"
        
        guard let url = URL(string: urlString) else {
            self.errorMessage = "Invalid URL"
            return
        }
        
//        print("Request URL: \(url)")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Error fetching data: \(error.localizedDescription)"
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data received"
                }
                return
            }

            do {
                let character = try self.decodeCharacter(from: data)
                DispatchQueue.main.async {
                    self.character = character
                }
//                print("Decoded response: \(character)")
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Error decoding data: \(error.localizedDescription)"
                }
            }
        }.resume()
    }

    private func decodeCharacter(from data: Data) throws -> DisneyCharacter {
        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        guard let dataObject = json?["data"] as? [String: Any] else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Data key not found"])
        }

        guard let name = dataObject["name"] as? String,
              let films = dataObject["films"] as? [String],
              let imgUrl = dataObject["imageUrl"] as? String else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid data structure"])
        }

        return DisneyCharacter(name: name, films: films, imgUrl: imgUrl)
    }
}
