//
//  MemoStore.swift
//  MemoGrammarly
//
//  Created by 스마트 on 2024/12/18.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var  list: [Memo]
    
    init() {
        list = [
            Memo(content: "테스트용", insertDate: Date.now),
            Memo(content: "Awesome", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "너무 긴장하지 마. 진짜 빡센 거면 어떻게 매년 집안 어른들이 다 모이겠어? 어차피 긴장하지 말라고 내가 와서 알려주는 거니까 걱정 마. 어차피 다들 처음에는 몇 번씩 실수하거든? 작은아버지 알지? 그 분은 6번이나 실수하셨다더라. 제일 많이 실패한 사람은 21번이긴 한데 뭐 아무튼. 글로 알려주면 좋을 텐데 니가 한자를 못 읽는 거 같으니까 그냥 설명해줄게. 열 가지 정도 되니까 중간에 까먹으면 언제든 다시 물어봐. 뭐? 아홉 가지 아니냐고? 듣기나 해 임마. 첫 번째로, 네가 죽을 일은 없어. 사실 생각하면 당연한 거지. 시제가 뭐냐? 결국 큰 제사 아니냐. 조상님들이 제사 잘못 지냈다고 후손들을 저주하거나 죽이겠어? 다만 실수하면 일이 귀찮아지기는 해. 조상님들 방식이 진짜 옛날 방식이라서..... 너 아버지 말대로 나폴리탄 괴담 좀 보고 왔지? 거기서 안 죽는 거야. 이해되지? 잘 명심해둬.", insertDate: Date.now.addingTimeInterval(3600 * -48)),
            Memo(content: "간장공장공장장", insertDate: Date.now.addingTimeInterval(3600 * -72)),
            Memo(content: "에세이만 쓰다가 소설에 도전해 봤습니다. 1년 정도 틈나면 써 본 소설인데 모아보니 제법 많은 이야기들이 되었네요. 실력이 부족해서 짧은 이야기들로 구성해 봤습니다. 짧아서 쉽게 읽힐 수는 있을 것 같습니다. 소설이 상상의 종합이라고 하지만 그 안에는 남모를 작가의 경험과 아픔, 그리고 바람이 담겨져 있음을 느낍니다. 부족한 글이지만 함께 읽으며 저의 상상 속으로 들어와 주세요. 편안함은 없을지라도 기분전환하기엔 좋은 글들을 담았습니다. 글의 배경과 등장인물은 모두 다르지만 주제는 하나입니다. 사람, 바로 나와 당신의 이야기입니다.", insertDate: Date.now.addingTimeInterval(3600 * -94))
            
        
        ]
        
    }
    
    func insert(memo: String){
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String){
        guard let memo = memo else {
            return
        }
        
        memo.content = content
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
