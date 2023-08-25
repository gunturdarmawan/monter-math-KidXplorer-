//
//  QA.swift
//  MonsterMath
//
//  Created by guntur darmawan on 21/08/23.
//

import SwiftUI

struct QA: View {
    @Binding var correct: Int
    @Binding var wrong: Int
    @Binding var answered: Int
    var set: String
    @StateObject var data = QuestionViewModel()
    
    @Environment(\.presentationMode) var present
    
    var body: some View {
        
            ZStack {
                if data.questions.isEmpty {
//                    ProgressView()
                } else {
                    if answered == data.questions.count {
                        VStack(spacing: 25) {
                            Image("trophy")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                            
                            Text("Finish!")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color("bg"))
                            
                            // Score and Back to Home Button
                            HStack(spacing: 15) {
                                Image(systemName: "checkmark")
                                    .font(.largeTitle)
                                    .foregroundColor(.green)
                                
                                Text("\(correct)")
                                    .font(.largeTitle)
                                    .foregroundColor(Color("bg"))
                                
                                Image(systemName: "xmark")
                                    .font(.largeTitle)
                                    .foregroundColor(.red)
                                    .padding(.leading)
                                
                                Text("\(wrong)")
                                    .font(.largeTitle)
                                    .foregroundColor(Color("bg"))
                            }
                            
                            Button(action: {
                                // closing sheet
                                present.wrappedValue.dismiss()
                                answered = 0
                                correct = 0
                                wrong = 0
                            }) {
                                Text("Next Round")
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width - 150)
                                    .background(Color.blue)
                                    .cornerRadius(15)
                            }
                            
                            Button(action: {
                                // closing sheet
                                present.wrappedValue.dismiss()
                                answered = 0
                                correct = 0
                                wrong = 0
                            }) {
                                Text("Back to Arena")
                                .fontWeight(.heavy)
                                .foregroundColor(Color("bg"))
                                .padding()
                                .frame(width: UIScreen.main.bounds.width - 150)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color("bg"), lineWidth: 4)
                                )
                            }
                            
                            
                        }.background(Color.white)
                    } else {
            
                            VStack {
    //                            HStack{
    //                                Button(action: {}, label: {
    //                                    Text("Arena 1")
    //                                        .fontWeight(.bold)
    //                                        .foregroundColor(.white)
    //                                        .padding(.vertical, 10)
    //                                        .padding(.horizontal, 20)
    //                                        .background(Color("card"))
    //                                        .cornerRadius(12)
    //                                }).padding(.vertical, 30)
    //                                    .padding(.horizontal, 30)
    //
    //                                Spacer()
    //
    //                            }
                                
                                HStack {
                                    VStack{
                                        Image("16")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                            .background(Color("animojiColor1"))
                                            .clipShape(Circle())
                                        
                                        Text("Me")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("animojiColor1"))
                                    }
                                    Spacer()
                                    
                                    Text("VS")
                                        .font(.title)
                                        .fontWeight(.black)
                                        .foregroundColor(Color("animojiColor2"))
                                    
                                    Spacer()
                                    
                                    VStack{
                                        Image("3")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                            .background(Color("animojiColor3"))
                                            .clipShape(Circle())
                                        
                                        Text("Monster")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("animojiColor3"))
                                    }
                        
                                }.padding(.horizontal ,50)
                                    .padding(.top,  40)
                                    .foregroundColor(.white)
                                
                                // Top Progress View
                                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                                    
                                    Capsule()
                                        .fill(Color.black.opacity(0.25))
                                        .frame(height: 26)
                                    
                                    Capsule()
                                        .fill(Color("animojiColor1"))
                                        .frame(width: progressPlayer(), height: 26)
                                    
                                    Capsule()
                                        .fill(Color("animojiColor3"))
                                        .frame(width: progressMonster(), height: 26)
                                    
                                    
                                    HStack(spacing: (UIScreen.main.bounds.width - 100) / 12) {
                                        ForEach(0..<12, id: \.self) { index in
                                            Circle()
                                                .fill(Color.white)
                                                .frame(width: index % 3 == 1 ? 5 : 3, height: index % 3 == 1 ? 5 : 2)
                                        }
                                    }
                                    .padding(.leading)
                                    
                                    Image("16")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .offset(x: progressPlayer() - 43)
                                    
                                    Image("3")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .offset(x: progressMonster() - 43)
                                    
                                    Image("flag")
                                               .resizable()
                                               .frame(width: 40, height: 40)
                                               .offset(x: UIScreen.main.bounds.width - 30  - 60)
                        
                                }
                                .padding(.horizontal, 50)
                                
                                // Correct and Wrong Count
        //                        HStack {
        //                            Label {
        //                                Text(correct == 0 ? "" : "\(correct)")
        //                                    .font(.largeTitle)
        //                                    .foregroundColor(.black)
        //                            } icon: {
        //                                Image(systemName: "checkmark")
        //                                    .font(.largeTitle)
        //                                    .foregroundColor(.green)
        //                            }
        //
        //                            Spacer()
        //
        //                            Label {
        //                                Text(wrong == 0 ? "" : "\(wrong)")
        //                                    .font(.largeTitle)
        //                                    .foregroundColor(.black)
        //                            } icon: {
        //                                Image(systemName: "xmark")
        //                                    .font(.largeTitle)
        //                                    .foregroundColor(.red)
        //                            }
        //                        }
        //                        .padding()
        //                        .frame(height: 40)

                                    // QuestionView
                                ZStack {
                                    ForEach(data.questions.reversed().indices) { index in
                                        // View
                                        QuestionView(question: $data.questions[index], correct: $correct, wrong: $wrong, answered: $answered)
                                            .offset(x: data.questions[index].completed ? 1000 : 0)
                                            .rotationEffect(Angle(degrees: data.questions[index].completed  ? 10 : 0))
                                    }
                                }
                                .padding()
                            }
        
                    }
                }
            } .background(Color("bg"))

        // fetching
        .onAppear {
            data.getQuestions(set: set)
        }
    }
    
    // progress
    func progressPlayer() -> CGFloat {
        let totalAnswered = min(CGFloat(correct), CGFloat(data.questions.count))
        let fraction = totalAnswered / CGFloat(data.questions.count)
        let width = UIScreen.main.bounds.width - 30
        
        return fraction * width
    }


    func progressMonster() -> CGFloat {
        let totalAnswered = CGFloat(wrong)
        let fraction = totalAnswered / CGFloat(data.questions.count)
        let width = UIScreen.main.bounds.width - 30
        
        return fraction * width
    }

}

