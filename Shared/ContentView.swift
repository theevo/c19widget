//
//  ContentView.swift
//  Shared
//
//  Created by Theo Vora on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var c19Data: [ChartData] = chartDataSet
    
    var body: some View {
        VStack {
            BarChart(title: "Confirmed COVID-19 cases",
                 city: "Salt Lake City, Utah",
                 barColor: .blue,
                 data: c19Data)
            Text("Last updated: 12/30/2021 3:10 PM")
                .font(.caption2)
        }
        .task {
            await loadData()
        }
    }
    
    private func loadData() async {
        guard let url = URL(string: "https://api.covid19api.com/country/united-states/status/confirmed?from=2021-12-23T00:00:00Z&to=2021-12-29T00:00:00Z&province=Utah") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            do {
                let decodedResponse = try JSONDecoder().decode([Covid19APIByCountryResponse].self, from: data)
                
                print("Got data")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
