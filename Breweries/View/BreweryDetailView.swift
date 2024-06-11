//
//  BreweryDetailView.swift
//  Breweries
//
//  Created by Slack, Ed (AMM) on 11/06/2024.
//

import SwiftUI

struct BreweryDetailView: View {
    let breweryId: String
    let breweryWebAdaptor = BreweryWebAdaptor.shared

    
    var body: some View {
        VStack{
            Text("\(Brewery)")
            //more pretty UI showing brewery details
        }
        .onAppear{
            breweryWebAdaptor.breweryData(for: breweryId) { returnedBrewery in
                
            }
            //call the brewery web adaptor
        }
    }
}

#Preview {
    BreweryDetailView(breweryId: "test")
}
