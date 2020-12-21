//
//  AboutCountryViewModel.swift
//  CodingAssignmentAboutCountry
//
//  Created by Prerak on 21/12/20.
//  Copyright © 2020 PrerakHomePC. All rights reserved.
//

import UIKit

//Delegate added to notify view controller with response data
protocol AboutCountryModelDelegate : class {
    func didReceiveCountryData(aboutCountryItemArray : [AboutCountryItemObject], Title : String)
}

//AboutCountryViewModel Initiation
class AboutCountryViewModel: NSObject {
    
    weak var instanceAboutCountryVC : AboutCountryViewController!
    
    weak var delegate : AboutCountryModelDelegate?
    
    init(instanceVC : AboutCountryViewController) {
        self.instanceAboutCountryVC = instanceVC
    }
}

//Web Service Call toreceive Abount country data and Page Title
extension AboutCountryViewModel {
    func loadAboutCountryData(){
        
        let urlString = URLController.sharedInstance.AboutCountryURL()
        WebServiceManager.sharedInstance.makeAPIRequest(urlString: urlString) { ( aboutCountryData: AboutCountryResponseData) in
            self.delegate?.didReceiveCountryData(aboutCountryItemArray: aboutCountryData.rows.filter(( { $0.title != nil })), Title: aboutCountryData.title ?? "")
            
        }
    }
    
}
