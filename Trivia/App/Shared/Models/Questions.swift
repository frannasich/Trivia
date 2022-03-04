//
//  Questions.swift
//  Trivia
//
//  Created by Fran Nasich on 02/03/2022.
//

import Foundation

struct Questions: Codable {
    let response_code: Int
    let results: [Question]
}
