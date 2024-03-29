//
//  Covid19APIByCountry.swift
//  c19widget
//
//  Created by Theo Vora on 1/4/22.
//

import Foundation

class Covid19APIByCountry {
    /// county is optional because in US territories like Guam do not have counties in this API
    var county: String?
    var state: String
    
    public init(county: String?, state: String) {
        self.county = county
        self.state = state
    }
    
    public func getData() async -> ([ChartData], Date)? {
        guard let url = buildURL() else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            do {
                let decodedResponse = try JSONDecoder().decode([Covid19APIByCountryResponse].self, from: data)
                
                print("Got data")
                
                return (summarizeData(decodedResponse), Date())
                
                
//                print(decodedResponse)
            } catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            }
        } catch {
            print("Invalid data")
        }
        return nil
    }
    
    private func summarizeData(_ data: [Covid19APIByCountryResponse]) -> [ChartData] {
        
        let saltLake = data.filter { $0.city == county }
        let saltLakeChartData = saltLake.map { response in
            ChartData(label: response.date.covid19WidgetShortDate,
                      value: response.cases)
        }
        
        let saltLakeDates = saltLake.map { response in
            (response.dateString, response.date, response.date.covid19WidgetShortDate)
        }
        
        print(saltLakeChartData)
        print(saltLakeDates)
        
        return saltLakeChartData
    }
    
    private func buildURL() -> URL? {
        //        "https://api.covid19api.com/country/united-states/status/confirmed?from=2021-12-23T00:00:00Z&to=2021-12-29T00:00:00Z&province=Utah"
        
        let baseURL = URL(string: "https://api.covid19api.com/country/united-states/status/confirmed")!
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = buildQueryItems()
        
        let finalURL = urlComponents?.url
        print("finalURL = " + (finalURL?.absoluteString ?? "nil"))
        
        return finalURL
    }
    
    private func buildQueryItems() -> [URLQueryItem] {
        let dateHelper = DateHelper()
        
        return [
            URLQueryItem(name: "from", value: dateHelper.sevenDaysBeforeYesterday.covid19ApiDateString),
            URLQueryItem(name: "to", value: dateHelper.yesterday.covid19ApiDateString),
            URLQueryItem(name: "province", value: state)
        ]
    }
}
