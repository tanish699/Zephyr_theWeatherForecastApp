//
//  WeatherSnapshot.swift
//  Zephyr
//
//  Created by Tanish on 10/12/25.
//

import Foundation
import UIKit

struct WeatherSnapshot {
    let city: String
    let temperature: String
    let symbolName: String
    let forecast: [ForecastItem]
}

struct ForecastItem {
    let symbolName: String
    let temp: String
}
