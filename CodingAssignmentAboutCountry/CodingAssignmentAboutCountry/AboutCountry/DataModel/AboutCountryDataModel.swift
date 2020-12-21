//
//  AboutCountryDataModel.swift
//  CodingAssignmentAboutCountry
//
//  Created by Prerak on 21/12/20.
//  Copyright © 2020 PrerakHomePC. All rights reserved.
//

import UIKit


//MARK: About Country Data Model
struct AboutCountryResponseData:Decodable {
    var title : String?
    var rows: [AboutCountryItemObject]
}

struct AboutCountryItemObject : Decodable {
    var title: String?
    var description: String?
    var imageHref: String?
}

