//
//  QuestionViewModel.swift
//  MonsterMath
//
//  Created by guntur darmawan on 21/08/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class QuestionViewModel: ObservableObject {
    @Published var questions: [Question] = []
    
    func getQuestions(set: String) {
        let db = Firestore.firestore()

        db.collection(set).getDocuments { (snapshot, err) in
            
            guard let data = snapshot else { return }
            
            DispatchQueue.main.async {
                self.questions = data.documents.compactMap({ (doc) -> Question? in
                    return try? doc.data(as: Question.self)
                })
                print(self.questions)
            }
            
        }
    }
}
