//
//  Home.swift
//  Quiz Monster
//
//  Created by guntur darmawan on 17/08/23.
//

import SwiftUI

struct MainView: View {
    
    @State var swiped = 0
    
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                
                ZStack{
                    BgBlurView()
                    
                    VStack{
                        
                        TitleView()
                        
                        FragmentView()
                        
                        CardArenaView()
                        
                    } //Vstack
                } //Zstack parent
            } //scroll view
            
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.062, green: 0, blue: 0.168),
                                                                   Color(red: 0.141, green: 0, blue: 0.274)]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
            )
        }.navigationBarHidden(true)
        
        
        //background
        
    } // Body View
    
    func calculatewidth()->CGFloat{
        let screen = UIScreen.main.bounds.width - 50
        let width = screen - (2 * 30)
        return width
    }
  
} //Root Home View


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



