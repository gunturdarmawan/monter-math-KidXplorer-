//
//  BgBlurSingle.swift
//  MonsterMath
//
//  Created by guntur darmawan on 20/08/23.
//

import SwiftUI

struct BgBlurSingle: View {
    @State var animate = false
    
    var body: some View {
        ZStack {
            BgCircleView(color: Color(red: 117/255, green: 123/255, blue: 200/255))
                .blur(radius: animate ? 60 : 150)
                .offset(x:animate ? -10 : -30, y: animate ? -10 : -80)
                .task {
                    withAnimation(.easeInOut(duration: 7).repeatForever()){
                        animate.toggle()
                    }
                }
        }
        
    }
        
}

struct BgBlurSingle_Previews: PreviewProvider {
    static var previews: some View {
        BgBlurSingle()
    }
}
