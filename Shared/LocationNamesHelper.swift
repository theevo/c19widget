//
//  LocationNamesHelper.swift
//  c19widget
//
//  Created by Theo Vora on 1/6/22.
//

import Foundation
import CoreLocation

public struct StateNamesHelper {
    public let stateDictionary = [ "AK": "Alaska",
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
                                   "GU": "Guam",
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
}

extension CLPlacemark {
    var city: String? {
        self.locality
    }
    
    /// Returns the name of the county excluding the suffix "County." Use `countyCounty` to include the suffix "County."
    var county: String? {
        guard let countyCounty = countyCounty else { return nil }
        
        let county = "County"
        let array = countyCounty.split(separator: " ")
        guard let last = array.last,
              last == county else { return self.countyCounty }
        return array.dropLast().joined(separator: " ")
    }
    
    /// Returns the name of the county including the suffix "County." Use `county` to get the county name without "County" at the end.
    var countyCounty: String? {
        self.subAdministrativeArea
    }
    
    /// This property is consumed by the view. returns "unknown" if county or state could not be determined
    var countyCommaState: String {
        let county = self.countyCounty ?? "unknown"
        let stateAbbr = self.stateAbbreviation ?? "unknown"
        
        return [county, stateAbbr].joined(separator: ", ")
    }
    
    var stateAbbreviation: String? {
        self.administrativeArea
    }
    
    var state: String? {
        guard let stateAbbreviation = stateAbbreviation else { return nil }
        return StateNamesHelper().stateDictionary[stateAbbreviation]
    }
}
