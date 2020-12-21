//
//  AboutCountryViewModel.swift
//  CodingAssignmentAboutCountry
//
//  Created by Prerak on 21/12/20.
//  Copyright © 2020 PrerakHomePC. All rights reserved.
//

import UIKit

protocol AboutCountryModelDelegate : class {
    func didReceiveCountryData(aboutCountryItemArray : AboutCountryItemArray? , error : Error?)
}

class AboutCountryViewModel: NSObject {
    
    weak var instanceAboutCountryVC : AboutCountryViewController!
    
    weak var delegate : AboutCountryModelDelegate?
    
    init(instanceVC : AboutCountryViewController) {
        self.instanceAboutCountryVC = instanceVC
    }
    
    func loadAboutCanadaData(){
        
        let urlString = URLController.sharedInstance.AboutCountryURL()
        WebServiceManager.sharedInstance.makeAPIRequest(urlString: urlString) { ( aboutCountryData: AboutCountryItemArray) in
            print(AboutCountryItemArray.self)
        }
    }
    
}
