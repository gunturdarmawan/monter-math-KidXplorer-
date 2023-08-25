//
//  QuestionView.swift
//  MonsterMath
//
//  Created by guntur darmawan on 21/08/23.
//

import SwiftUI

struct QuestionView: View {
    @Binding var question: Question
    @Binding var correct: Int
    @Binding var wrong: Int
    @Binding var answered: Int
    @StateObject var data = QuestionViewModel()
    
    @State var selected = ""
    
    var body: some View {
        VStack(spacing: 15) {
            
//            HStack{
//
//                Text("Arena 1")
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .padding(10)
//                    .background(Color("animojiColor2"))
//                    .cornerRadius(12)
//
//                Spacer()
//
//            }
            
            HStack{
                Spacer()
                Text(question.question!)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("bg"))
                    .multilineTextAlignment(.center)
                    .padding(.top, 15)
                Spacer()
            }
            
            Spacer()
            
            // Options
            Button(action: {
                selected = question.optionA!
            }) {
                Text(question.optionA!)
                    .foregroundColor(Color("bg"))
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(color(option: question.optionA!), lineWidth: 4)
                    )
            }
            
            Button(action: {
                selected = question.optionB!
            }) {
                Text(question.optionB!)
                    .foregroundColor(Color("bg"))
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(color(option: question.optionB!), lineWidth: 4)
                    )
            }
            
            Button(action: {
                selected = question.optionC!
            }) {
                Text(question.optionC!)
                    .foregroundColor(Color("bg"))
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(color(option: question.optionC!), lineWidth: 4)
                    )
            }
            
            Button(action: {
                selected = question.optionD!
            }) {
                Text(question.optionD!)
                    .foregroundColor(color(option: question.optionD!))
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                           
                            .stroke(color(option: question.optionD!), lineWidth: 4)
                    )
            }
            
            Spacer(minLength: 0)
            
            // Buttons
            HStack(spacing: 15) {
                Button(action: checkAns) {
                    Text("Submit")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("bg"))
                        .cornerRadius(15)
                }
                // disabling
                .disabled(question.isSubmitted)
                .opacity(question.isSubmitted ? 0.7 : 1)
                
                Button(action: {
                    withAnimation {
                        question.completed.toggle()
                        answered += 1
                    }
                }) {
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("bg"))
                        .cornerRadius(15)
                }
                .disabled(!question.isSubmitted)
                .opacity(!question.isSubmitted ? 0.5 : 1)
            }
            .padding(.bottom)
        }
        .padding()
        .background(Color("card")).ignoresSafeArea(.all, edges: .all)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
    }
    
    // highlighting Answer
    func color(option: String) -> Color {
        if option == selected {
            // displaying if correct means green, else red
            if question.isSubmitted {
                if selected == question.answer! {
                    
                    return Color.green
                    
                } else {
                    return Color.red
                }
            } else {
                return Color.blue
            }
        } else {
            // displaying right if wrong selected
            if question.isSubmitted && option != selected {
                if question.answer! == option {
                    return Color.green
                }
            }
            return (Color("bg"))
        }
    }
    
    // check Answer
    func checkAns() {
        if selected == question.answer! {
            correct += 1
        } else {
            wrong += 1
        }
        
        question.isSubmitted.toggle()
    }
    
    func progress() -> CGFloat {
        let fraction = CGFloat(answered) / CGFloat(data.questions.count)
        
        let width = UIScreen.main.bounds.width - 30
        
        return fraction * width
    }
}
