

import SwiftUI

struct ArenaView: View {
    // Total amount
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var bill: CGFloat = 100
    @State var totalProgressArena: Double = 0
    
    @State var payers = [
        Payer(image: "2", name: "Level 1", subLevelTitle: "Penjumlahan", progresslv: 80, bgColor: Color("animojiColor2")),
        Payer(image: "1", name: "Level 2",  subLevelTitle: "Pengurangan", progresslv: 65, bgColor: Color("animojiColor1")),
        Payer(image: "3", name: "Level 3",  subLevelTitle: "Perkalian", progresslv: 30, bgColor: Color("animojiColor3")),
        Payer(image: "4", name: "Level 4",  subLevelTitle: "Pembagian", progresslv: 90, bgColor: Color("animojiColor1")),
        Payer(image: "5", name: "Level 5",  subLevelTitle: "Kombinasi Perhitungan", progresslv: 85, bgColor: Color("animojiColor2")),
    ]
    
    // Temp Offset
    @State var pay = false
    @State var sharedAmount: CGFloat = 0
    @State var show = false
    // Storing Level for Fetching Questions
    @State var set = "Round_1"
    
    // for analytics
    @State var correct = 0
    @State var wrong = 0
    @State var answerd = 0
    
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                
                ZStack{
                    
                    BgBlurSingle().padding(.bottom, 650)
                    
                    VStack {
                        HStack {
                            
                            Button(
                                action: {
                                    presentationMode.wrappedValue.dismiss()
                                },
                                label: {
                                        
                                        Image(systemName: "chevron.left")
                                            .font(.title2)
                                            .foregroundColor(Color("card"))
                                            .padding()
                                            .background(Color.black.opacity(0.25))
                                            .cornerRadius(15)
          
                                }
                            )

                            Spacer()
                        }
                        .padding()
                        
                        // Bill Card View
                        VStack(spacing: 15) {
                            
                            HStack{
                                Button(action: {}, label: {
                                    Text("Arena 1")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                        .background(Color("bg"))
                                        .cornerRadius(12)
                                })
                                
                                Spacer()

                            }
              
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Monster Name")
                                        .font(.caption)
                                    
                                    Text("Perhitungan ")
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                }
                                .foregroundColor(Color("bg"))
                                .padding(.horizontal, 10)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Progress Arena")
                                        .font(.caption)
                                    
                                    Text("\(totalProgressArena, specifier: "%.0f")%")
                                        .font(.title2)
                                        .fontWeight(.heavy)

                                }
                                .foregroundColor(Color("bg"))
                                .frame(maxWidth: .infinity)
                                .padding(.top, 10)
                            }
                            
                            // Animoji Viwes
                            VStack {
                                HStack(spacing: -20) {
                                    
                                    ForEach(payers) { payer in
                                        
                                        Image(payer.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 60, height: 60)
                                            .padding(0)
                                            .background(payer.bgColor)
                                            .clipShape(Circle())
                                    }
                                }
                                
                                Text("Monster Squad")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("bg"))
                            .cornerRadius(25)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("card").clipShape(CardShape()).cornerRadius(25))
                        .padding(.horizontal)
                        
                        ForEach(payers.indices) { index in
                            ListQuizView(payer: $payers[index], totalAmount: bill, payers: $payers, sharedAmount: $sharedAmount)
                                .onTapGesture {
                                    set = "Round_\(index)"
                                    show.toggle()
                                }
                        }
                        
                        Spacer(minLength: 25)
                        
                        // Play Button
                        
                        
                        HStack {
                            
                            HStack(spacing: 0) {
                                ForEach(1...6, id: \.self) { index in
                                    
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 20, weight: .heavy))
                                        .foregroundColor(Color.white.opacity(Double(index) * 0.06))
                                }
                            }
                            .padding(.leading, 45)
                            
                            Spacer()
                            
                            Button(action: {
                                pay.toggle()
                            }, label: {
                                Text("Next Arena")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("card"))
                                    .padding(.horizontal, 25)
                                    .padding(.vertical)
                                    .background(Color("bg"))
                                    .clipShape(Capsule())
                            })
                        }
                        .padding()
                        .background(Color.black.opacity(0.25))
                        .clipShape(Capsule())
                        .padding(.horizontal)
                    }
                }
                .sheet(isPresented: $show) {
                    QA(correct: $correct, wrong: $wrong, answered: $answerd, set: set)
                }
                
            }
            .background(Color("bg").ignoresSafeArea(.all, edges: .all))
            // Alert View
            .alert(isPresented: $pay) {
                Alert(title: Text("Alert"), message: Text("Confirm to play?"), primaryButton: .default(Text("Play")) {
                    // Do some code here
                }, secondaryButton: .destructive(Text("Cancel")) {
                    // do some code here
                })
            }
            .onAppear {
                    calculateTotalProgress()
                }
        }.navigationBarHidden(true)
    }
        
        
    
    func calculateTotalProgress() {
        let totalProgressSum = payers.reduce(0) { $0 + Double($1.progresslv) }
        totalProgressArena = totalProgressSum / Double(payers.count)
    }

        
}


struct ArenaView_Previews: PreviewProvider {
    static var previews: some View {
       ArenaView()
    }
}
