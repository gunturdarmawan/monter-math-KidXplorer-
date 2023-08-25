//
//  FragmentHome.swift
//  Quiz Monster
//
//  Created by guntur darmawan on 16/08/23.
//

import SwiftUI


struct FragmentView: View {
    
    @State var index = 0
    
    var body: some View {
        HStack{
            Text("All Level")
                .font(.subheadline)
                .foregroundColor(index == 0 ? .white :
                                    Color(.white).opacity(0.85))
                .fontWeight(.bold)
                .padding(.vertical, 6)
                .padding(.horizontal, 20)
                .background(Color(.black).opacity(index == 0 ? 1 : 0))
                .clipShape(Capsule())
                .onTapGesture {
                    index = 0
                }
            
            Text("My Level")
                .font(.subheadline)
                .foregroundColor(index == 1 ? .white :
                                    Color(.white).opacity(0.85))
                .fontWeight(.bold)
                .padding(.vertical, 6)
                .padding(.horizontal, 20)
                .background(Color(.black).opacity(index == 01 ? 1 : 0))
                .clipShape(Capsule())
                .onTapGesture {
                    index = 1
                }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct FragmentView_Previews: PreviewProvider {
    static var previews: some View {
        FragmentView()
    }
}
