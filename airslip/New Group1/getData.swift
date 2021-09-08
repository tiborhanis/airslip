//
//  getData.swift
//  airslip
//
//  Created by Tibor Hanis on 06/09/2021.
//

import Foundation


class getData {
    func getCountries(completion:@escaping ([Countries]) -> ()) {
        guard let url = URL(string: "https://d521ed20-4eae-4ee4-83fb-48b45afb2173.mock.pstmn.io/v1/demographics") else {
            print("Invalid URL")
            return
            
        }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let countries = try! JSONDecoder().decode([Countries].self, from: data!)
            
            DispatchQueue.main.async {
                completion(countries)
            }
        }
        .resume()
    }
}



