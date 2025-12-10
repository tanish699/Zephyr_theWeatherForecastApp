//
//  ViewModel.swift
//  Zephyr
//
//  Created by Tanish on 10/12/25.
//

import Foundation


struct WeatherProvider {

    static func sample() -> WeatherSnapshot {
        return WeatherSnapshot(
            city: "New Delhi",
            temperature: "32°",
            symbolName: "sun.max.fill",
            forecast: [
                .init(symbolName: "sun.max.fill", temp: "34°"),
                .init(symbolName: "cloud.sun.fill", temp: "31°"),
                .init(symbolName: "cloud.fill", temp: "29°"),
                .init(symbolName: "cloud.rain.fill", temp: "27°"),
                .init(symbolName: "sun.max.fill", temp: "33°")
            ]
        )
    }
}
