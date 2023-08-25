//
//  Question.swift
//  MonsterMath
//
//  Created by guntur darmawan on 21/08/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Question: Identifiable, Codable {
    // it will fetch doc ID
    @DocumentID var id: String?
    var question: String?
    var optionA: String?
    var optionB: String?
    var optionC: String?
    var optionD: String?
    var answer: String?
    
    var isSubmitted = false
    var completed = false

    enum CodingKeys: String, CodingKey {
        case question
        case optionA = "a"
        case optionB = "b"
        case optionC = "c"
        case optionD = "d"
        case answer
    }
}
