//
//  ContentView.swift
//  Shared
//
//  Created by Theo Vora on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    let last7days = """
                    Last 7 days
                    Mon
                    Tue
                    Wed
                    Thu
                    Fri
                    Sat
                    Sun
                    """
    
    var body: some View {
        Text(last7days)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
