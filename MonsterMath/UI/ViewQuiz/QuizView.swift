//
//  QuizView.swift
//  MonsterMath
//
//  Created by guntur darmawan on 21/08/23.
//

import SwiftUI

struct QuizView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var show = false
    
    @State var set = "Round_1"
    
    @State var correct = 0
    @State var wrong = 0
    @State var answerd = 0
    
    var body: some View {
        
        NavigationView{
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
                
                Text("Kavsoft")
                    .font(.system(size: 38))
                    .fontWeight(.heavy)
                    .foregroundColor(.purple)
                    .padding(.top)
                
                Text("Choose the way \nyou play!")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.top, 8)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 0)
                
                // Level View
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 35) {
                    // four levels
                    ForEach(1...4, id: \.self) { index in
                        VStack(spacing: 15) {
                            Image("level\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 150)
                            
                            Text("SwiftUI Quiz")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            
                            Text("LEVEL \(index)")
                                .foregroundColor(.black)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(15)
                        // opening QA view as sheet
                        .onTapGesture {
                            set = "Round_\(index)"
                            show.toggle()
                        }
                    }
                }
                .padding()
                
                Spacer(minLength: 0)
            }
            
            .sheet(isPresented: $show) {
                QA(correct: $correct, wrong: $wrong, answered: $answerd, set: set)
            }
        }
        .navigationBarHidden(true)

    }
}
