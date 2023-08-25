//
//  Title.swift
//  Quiz Monster
//
//  Created by guntur darmawan on 17/08/23.
//

import SwiftUI

struct TitleView: View {
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {}){
                    Image("Category")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                        .padding(8)
                        .background(.white)
                        .cornerRadius(100)
                }
                Spacer()
                
                HStack{
                    Image("starGold")
                        .resizable()
                        .frame(width: 28, height: 28)
                    
                    Text("16")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }.padding(.horizontal)
                
                
            }.padding(.top, 50)
            .padding(.horizontal, 20)
            
            HStack{
                Text("Monster Math")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                Spacer()
                
            }.padding(.top, 12)
        } // Style View
     
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}


