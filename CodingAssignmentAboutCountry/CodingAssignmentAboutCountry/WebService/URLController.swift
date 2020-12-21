//
//  URLController.swift
//  CodingAssignmentAboutCountry
//
//  Created by Prerak on 21/12/20.
//  Copyright © 2020 PrerakHomePC. All rights reserved.
//

import UIKit

class URLController: NSObject {
    static let sharedInstance = URLController()
    
    //Base url for WebService Call
    let kBaseUrl = "https://dl.dropboxusercontent.com/"
    
    //Url to get About Country Tableview data
    func AboutCountryURL() -> String {
        return "\(kBaseUrl)s/2iodh4vg0eortkl/facts.json"
    }
}
