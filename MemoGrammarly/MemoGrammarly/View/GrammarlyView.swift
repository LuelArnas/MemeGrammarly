//
//  GrammarlyView.swift
//  MemoGrammarly
//
//  Created by 스마트 on 2024/12/18.
//

import SwiftUI

//<script src="webSpellChecker.min.js의 url"></script>
//<link rel="stylesheet" href="webSpellChecker.min.css의 url">

struct GrammarlyView: View {
    @EnvironmentObject var store: MemoStore
    
    var memo: Memo? = nil
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content)
                    .padding()
                    .onAppear{
                        if let memo = memo{
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "메모 검사" : "검사기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading){
                    Button{
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                //'webSpellChecker.config': {
                //    'url': 'https://svc.webspellchecker.net/api',
                //    'customerid': '라이센스 구매 후 발급 받은 key',
                //    'defaultLanguage': '맞춤법 검사 대상 언어'
                //},
                
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button{
                        if let memo = memo {
                            store.update(memo: memo, content: content)
                        } else {
                            store.insert(memo: content)
                        }
                                                
                        dismiss()
                    } label: {
                        Text("실행")
                    }
                }
                
                
                
            }
        }
    }
}

struct GrammarlyView_Previews: PreviewProvider {
    static var previews: some View {
        GrammarlyView()
            .environmentObject(MemoStore())
    }
}
