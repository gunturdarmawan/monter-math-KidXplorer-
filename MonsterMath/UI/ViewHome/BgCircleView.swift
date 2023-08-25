//
//  CircleBackground.swift
//  Quiz Monster
//
//  Created by guntur darmawan on 16/08/23.
//

import SwiftUI

struct BgCircleView: View {
        @State var color: Color = Color("greenCircle")
            
            var body: some View {
                Circle()
                    .frame(width: 400, height: 400)
                    .foregroundColor(color)
            }
}

struct BgCircleView_Previews: PreviewProvider {
    static var previews: some View {
        BgCircleView()
    }
}

