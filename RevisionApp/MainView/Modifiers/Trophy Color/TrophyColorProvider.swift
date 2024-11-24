//
//  TrophyColorProvider.swift
//  RevisionApp
//
//  Created by Joe Taylor on 14/11/2024.
//

import SwiftUI

protocol TrophyColorProvider {
    func trophyColor(for percentage: Int) -> CommodityColor
}

class DefaultTrophyColorProvider: TrophyColorProvider {
    func trophyColor(for percentage: Int) -> CommodityColor {
        switch percentage {
        case 100:
            return CommodityColor.gold
        case 90..<100:
            return CommodityColor.silver
        case 70..<90:
            return CommodityColor.bronze
        default:
            return CommodityColor.standard
        }
    }
}

enum CommodityColor {
    case gold
    case silver
    case platinum
    case bronze
    case standard
    var colors: [Color] {
        switch self {
        case .gold: return [ Color(hex: "0xDBB400"),
                             Color(hex: "0xEFAF00"),
                             Color(hex: "0xF5D100"),
                             Color(hex: "0xF5D100"),
                             Color(hex: "0xD1AE15"),
                             Color(hex: "0xDBB400"),
        ]
            
        case .silver: return [ Color(hex: "0x70706F"),
                               Color(hex: "0x7D7D7A"),
                               Color(hex: "0xB3B6B5"),
                               Color(hex: "0x8E8D8D"),
                               Color(hex: "0xB3B6B5"),
                               Color(hex: "0xA1A2A3"),
        ]
            
        case .platinum: return [ Color(hex: "0x000000"),
                                 Color(hex: "0x444444"),
                                 Color(hex: "0x000000"),
                                 Color(hex: "0x444444"),
                                 Color(hex: "0x111111"),
                                 Color(hex: "0x000000"),
        ]
            
        case .bronze: return [ Color(hex: "0x804A00"),
                               Color(hex: "0x9C7A3C"),
                               Color(hex: "0xB08D57"),
                               Color(hex: "0x895E1A"),
                               Color(hex: "0x804A00"),
                               Color(hex: "0xB08D57"),
        ]
         
        case .standard: return [ Color(hex: "0xf1f1f1")]
        }
    }
    
    var linearGradient: LinearGradient
    {
        return LinearGradient(
            gradient: Gradient(colors: self.colors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff
        )
    }
}
