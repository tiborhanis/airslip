//
//  editView.swift
//  editView
//
//  Created by Tibor Hanis on 06/09/2021.
//

import SwiftUI

struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var country: Countries
    
    var body: some View {
        VStack {
            HStack {
                Text("Country: ")
                    .bold()
                TextField("place", text: $country.place)
            }
            HStack {
                Text("Population: ")
                    .bold()
                TextField("population", value: $country.population, formatter: NumberFormatter())
            }
            HStack {
                Text("Currency: ")
                    .bold()
                TextField("currency", text: $country.currency)
            }
            Button(action: {
                sendCountry()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save changes")
            }
        }
        Spacer()
    }
   
    func sendCountry() {
        
        guard let url = URL(string: "https://69228721-0a7d-4842-b013-ea14aeb5b7d6.mock.pstmn.io/v1/demographics") else {
            print("Invalid URL")
            return
        }
        guard let encoded = try? JSONEncoder().encode(country) else {
            print("Failed to encode")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
        }.resume()
    }
    
}
