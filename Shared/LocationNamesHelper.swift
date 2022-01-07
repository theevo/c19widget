//
//  LocationNamesHelper.swift
//  c19widget
//
//  Created by Theo Vora on 1/6/22.
//

import Foundation

//struct CountyNamesHelper {
//    func
//}

public struct StateNamesHelper {
    let abbreviation: String
    
    private let stateDictionary = [ "AK": "Alaska",
                                    "AL": "Alabama",
                                    "AR": "Arkansas",
                                    "AS": "American Samoa",
                                    "AZ": "Arizona",
                                    "CA": "California",
                                    "CO": "Colorado",
                                    "CT": "Connecticut",
                                    "DC": "District of Columbia",
                                    "DE": "Delaware",
                                    "FL": "Florida",
                                    "GA": "Georgia",
                                    "GU": "Guam", // 2
                                    "HI": "Hawaii",
                                    "IA": "Iowa",
                                    "ID": "Idaho",
                                    "IL": "Illinois",
                                    "IN": "Indiana",
                                    "KS": "Kansas",
                                    "KY": "Kentucky",
                                    "LA": "Louisiana",
                                    "MA": "Massachusetts",
                                    "MD": "Maryland",
                                    "ME": "Maine",
                                    "MI": "Michigan",
                                    "MN": "Minnesota",
                                    "MO": "Missouri",
                                    "MS": "Mississippi",
                                    "MT": "Montana",
                                    "NC": "North Carolina",
                                    "ND": "North Dakota",
                                    "MP": "Northern Mariana Islands",
                                    "NE": "Nebraska",
                                    "NH": "New Hampshire",
                                    "NJ": "New Jersey",
                                    "NM": "New Mexico",
                                    "NV": "Nevada",
                                    "NY": "New York",
                                    "OH": "Ohio",
                                    "OK": "Oklahoma",
                                    "OR": "Oregon",
                                    "PA": "Pennsylvania",
                                    "PR": "Puerto Rico",
                                    "RI": "Rhode Island",
                                    "SC": "South Carolina",
                                    "SD": "South Dakota",
                                    "TN": "Tennessee",
                                    "TX": "Texas",
                                    "UT": "Utah",
                                    "VA": "Virginia",
                                    "VI": "Virgin Islands",
                                    "VT": "Vermont",
                                    "WA": "Washington",
                                    "WI": "Wisconsin",
                                    "WV": "West Virginia",
                                    "WY": "Wyoming"]
    
    public var stateFullName: String? {
        stateDictionary[abbreviation]
    }
}
