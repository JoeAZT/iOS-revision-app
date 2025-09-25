//
//  ScoreHistoryChartView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 12/12/2024.
//

import Charts
import SwiftUI

struct ScoreHistoryChartView: View {
    
    let scoreHistory: [Int]
    
    let linearGradient = LinearGradient(
        gradient: Gradient(colors: [Color.accentColor.opacity(0.1), Color.accentColor.opacity(0)]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    var body: some View {
        Chart {
            ForEach(Array(scoreHistory.enumerated()), id: \.offset) { index, score in
                LineMark(
                    x: .value("Attempt", index),
                    y: .value("Score", score)
                )
                PointMark(
                    x: .value("Index", index),
                    y: .value("Value", score)
                )
                .foregroundStyle(Color.purple)
                AreaMark(
                    x: .value("Attempt", index),
                    y: .value("Score", score)
                )
                .foregroundStyle(linearGradient)
            }
            .interpolationMethod(.catmullRom)
        }
        .chartLegend(.hidden)
        .padding()
    }
}

#Preview {
    ScoreHistoryChartView(
        scoreHistory: [60, 70, 70, 90, 100, 90, 100, 100]
    )
}
