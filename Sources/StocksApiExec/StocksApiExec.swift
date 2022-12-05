//
//  File.swift
//  
//
//  Created by mufkhalif on 05/12/22.
//

import Foundation
import StocksApi


@main
struct StocksApiExec {
    
    static let stocksApi = StocksApi()
    
    static func main() async {
        
        do {
            let quoutes = try await stocksApi.fetchQuotes(symbols: "AAPL,TSLA,GOOG,MSFT")

            print(quoutes)

            let tickers = try await stocksApi.searchTickers(query: "tesla", isEquityTypeOnly: false)

            print(tickers)

            let charts = try await stocksApi.fetchChartData(tickerSymbol: "AAPL", range: .oneDay)
            
            print(charts)
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
