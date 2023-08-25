//
//  ListQuizView.swift
//  MonsterMath
//
//  Created by guntur darmawan on 20/08/23.
//

import SwiftUI

struct Payer: Identifiable {
    var id = UUID().uuidString
    var image: String
    var name: String
    var subLevelTitle : String
    var progresslv : Int
    var bgColor: Color

    var offset: CGFloat = 0
    var payAmount: CGFloat = 0
}

struct ListQuizView: View {
    @Binding var payer: Payer
    var totalAmount: CGFloat
    @Binding var payers: [Payer]
    @Binding var sharedAmount: CGFloat
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var show = false
    // Storing Level for Fetching Questions
    @State var set = "Round_1"
    
    
    var body: some View {
        
        VStack(spacing: 15) {
            HStack {
                Image(payer.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .background(payer.bgColor)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 6){
                    Text(payer.name)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(payer.subLevelTitle)
                        .font(.subheadline)
                }
                .foregroundColor(.white)
                Spacer()
                
                VStack{
                    HStack {
                        ForEach(0..<3) { index in
                            Image(index < starCount ? "starGold" : "starDefault")
                                .resizable()
                                .frame(width: 16, height: 16)
                        }
                    }
                    
                    Text(getPrice())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
     
                Image(systemName: "chevron.right")
                        .foregroundColor(Color("card"))
                        .padding()
                        .cornerRadius(15)
    
            }     
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Capsule() //background indikator statis
                    .fill(Color.black.opacity(0.25))
                    .frame(height: 30)
                
                Capsule() //indikator background dinamis
                    .fill(payer.bgColor)
                    .frame(width: payer.progresslv == 70 ? UIScreen.main.bounds.width - 100 : CGFloat(payer.progresslv) * 1.2 * (UIScreen.main.bounds.width - 100) / 100, height: 30) // Adjusted
                
                HStack(spacing: (UIScreen.main.bounds.width - 100) / 12) {
                    ForEach(0..<12, id: \.self) { index in
                        Circle()
                            .fill(Color.white)
                            .frame(width: index % 3 == 1 ? 7 : 5, height: index % 3 == 1 ? 7 : 3)
                    }
                }
                .padding(.leading)
                
                Circle()
                    .fill(Color("card"))
                    .frame(width: 26, height: 26) // Set fixed width and height
                    .background(Circle().stroke(Color.white, lineWidth: 5))
                    .offset(x: payer.progresslv == 70 ? UIScreen.main.bounds.width - 100 - 13 : CGFloat(payer.progresslv) * 1.18 * (UIScreen.main.bounds.width - 100) / 100 - 13)
            }

        }
        .padding()
    }
    
    var starCount: Int {
            if payer.progresslv >= 100 {
                return 3
            } else if payer.progresslv >= 75 {
                return 2
            } else if payer.progresslv >= 50 {
                return 1
            } else {
                return 0
            }
        }
    
    func getPrice() -> String {
        let percent = CGFloat(payer.progresslv) / 100 // Use payer.progresslv
        let amount = percent * totalAmount
        return String(format: "%.0f%%", amount)
    }

}

struct ListQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ArenaView()
    }
}
