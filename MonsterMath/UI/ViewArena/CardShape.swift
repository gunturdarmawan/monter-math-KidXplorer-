//
//  CardShape.swift
//  MonsterMath
//
//  Created by guntur darmawan on 20/08/23.
//

import SwiftUI

struct CardShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addArc(center: CGPoint(x: 0, y: 0), radius: 0, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0), clockwise: false)
            
            path.move(to: CGPoint(x: rect.width, y: 0))
            path.addArc(center: CGPoint(x: rect.width, y: 0), radius: 0, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0), clockwise: false)
        }
    }
}
