//
//  WebServiceManager.swift
//  CodingAssignmentAboutCountry
//
//  Created by Prerak on 21/12/20.
//  Copyright © 2020 PrerakHomePC. All rights reserved.
//

import UIKit

class WebServiceManager: NSObject {
    static let sharedInstance = WebServiceManager()
    //API request using NSUrlSession with generic decodable types
    func makeAPIRequest<T: Decodable>(urlString: String, completion: @escaping (T) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            if let err = err {
                print("Failed to fetch response:", err)
                return
            }
            guard let data = data else { return }
            do {
                let jsonObj = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(jsonObj)
                }
            } catch  {
                do {
                    //the below attempt is to solve response type and encoding error
                    guard let string = String(data: data, encoding: String.Encoding.isoLatin1) else { return }
                    guard let convertedData = string.data(using: .utf8, allowLossyConversion: true) else { return }
                    let jsonObj = try JSONDecoder().decode(T.self, from: convertedData)
                    DispatchQueue.main.async {
                        completion(jsonObj)
                    }
                } catch let jsonErr {
                    print("Failed to serialize json:", jsonErr)
                }
                
            }
            
        }.resume()
    }
    
}
