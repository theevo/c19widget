//
//  Covid19APIByCountryResponse.swift
//  c19widget
//
//  Created by Theo Vora on 12/30/21.
//

import Foundation

/*
 {
         "Country": "United States of America",
         "CountryCode": "US",
         "Province": "Utah",
         "City": "Sevier",
         "CityCode": "49041",
         "Lat": "38.75",
         "Lon": "-111.81",
         "Cases": 0,
         "Status": "confirmed",
         "Date": "2021-12-23T00:00:00Z"
     },
 
 */

struct Covid19APIByCountryResponse: Codable {
    var country: String
    var countryCode: String
    var province: String
    var city: String
    var cityCode: String
    var lat: String
    var lon: String
    var cases: Int
    var status: String
//    var date: String
    
    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case province = "Province"
        case city = "City"
        case cityCode = "CityCode"
        case lat = "Lat"
        case lon = "Lon"
        case cases = "Cases"
        case status = "Status"
//        case date = "Date"
    }
}
