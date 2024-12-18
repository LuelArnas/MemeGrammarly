//
//  Memo.swift
//  MemoGrammarly
//
//  Created by 스마트 on 2024/12/18.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject{
    let id: UUID
    @Published var content: String
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
