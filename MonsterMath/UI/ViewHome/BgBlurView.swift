//
//  backgroundBlur.swift
//  Quiz Monster
//
//  Created by guntur darmawan on 16/08/23.
//

import SwiftUI

struct BgBlurView: View {
    @State var animate = false
    
    var body: some View {
        ZStack {
            BgCircleView(color: Color(red: 117/255, green: 123/255, blue: 200/255))
                .blur(radius: animate ? 60 : 150)
                .offset(x:animate ? -50 : -130, y: animate ? -30 : -100)
                .task {
                    withAnimation(.easeInOut(duration: 7).repeatForever()){
                        animate.toggle()
                    }
                }
            
            BgCircleView(color: Color(red: 255/255, green: 105/255, blue: 180/255))
                .blur(radius: animate ? 60 : 150)
                .offset(x: animate ? 100 : 130, y: animate ? 150 : 100)
            
        }
        
    }
        
}

struct BgBlurView_Previews: PreviewProvider {
    static var previews: some View {
        BgBlurView()
    }
}
