//
//  ContentView.swift
//  airslip
//
//  Created by Tibor Hanis on 06/09/2021.
//

import SwiftUI

struct Response: Codable {
    var countries: [Countries]
}

struct ContentView: View {
    @State private var countries = [Countries]()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List(countries, id: \.id) { country in
                NavigationLink(
                    destination: EditView(country: country)
                )  {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Country: ")
                                .bold()
                            Text(country.place)
                        }
                        HStack {
                            Text("Population: ")
                                .bold()
                            Text("\(country.population)")
                        }
                        HStack {
                            Text("Currency: ")
                                .bold()
                            Text(country.currency)
                        }
                        HStack {
                            Text("Date: ")
                                .bold()
                            Text(country.date)
                        }
                    }
                }
                
            }
            .onAppear {
                getData().getCountries  { (countries) in
                    self.countries = countries
                }
            }
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { searchText in
            
            if !searchText.isEmpty {
                countries = countries.filter {
                    $0.place.contains(searchText)
                }
            } else {
                countries = countries
            }
        }
    }
}
    
    
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
