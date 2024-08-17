//
//  AvtodorRoads.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 17.08.2024.
//

import Foundation

struct Road : Identifiable {
    
    
    static let roads = Road.getRoads()
    let id: Int
    let organization: String
    let numericName: String
    let name: String
    let distance: Double
    let year: Int = 2020
    var speedLimit: Int = 90
    
   static private func getRoads() -> [Road] {
        let rouds = [
            Road(id: 1, organization: "Автодор", numericName: "M-1", name: "Беларусь", distance: 516, speedLimit: 110),
            Road(id: 2, organization: "Автодор", numericName: "М-3", name: "Украина", distance: 454, speedLimit: 110),
            Road(id: 3, organization: "Автодор", numericName: "М-4", name: "Дон", distance: 1930, speedLimit: 110),
            Road(id: 4, organization: "Автодор", numericName: "M-11", name: "Нева", distance: 678, speedLimit: 130),
            Road(id: 5, organization: "Автодор", numericName: "М-12", name: "Восток", distance: 810, speedLimit: 110),
            Road(id: 6, organization: "Автодор", numericName: "А-113", name: "ЦКАД", distance: 336, speedLimit: 110)
        ]
       return rouds
    }
}


