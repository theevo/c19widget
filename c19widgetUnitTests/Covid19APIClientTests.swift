//
//  Covid19APIClientTests.swift
//  c19widgetUnitTests
//
//  Created by Theo Vora on 2/7/22.
//

import XCTest
import Mocker
@testable import c19widget

final class Covid19APITestData {
    public static let c19Response: Data = try! Data(contentsOf: Bundle(for: Covid19APITestData.self).url(forResource: "c19Response", withExtension: "json")!)
}

class Covid19APIClientTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Fetch_Covid19API_StatusSuccess() throws {
        let expectation = XCTestExpectation()
        
        let baseURL = URL(string: "https://api.covid19api.com")!
        let url = baseURL.appendingPathComponent("/country/united-states/status/confirmed?from=2021-12-23T00:00:00Z&to=2021-12-29T00:00:00Z&province=Utah")
        
        let mock = Mock(url: url, dataType: .json, statusCode: 200, data: [
            .get: Covid19APITestData.c19Response
        ])
        mock.register()
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("💀💀💀 Failed to get data")
                return
            }
            
            do {
                let c19Data = try JSONDecoder().decode([Covid19APIByCountryResponse].self, from: data)
                
                print(c19Data)
                expectation.fulfill()
            } catch let error {
                print("💀💀💀 Failed to decode JSON")
                print(error)
            }
        }.resume()
        
        wait(for: [expectation], timeout: 10.0)
    }
}
