//
//  Mission.swift
//  Mamuji
//
//  Created by DongKyu Kim on 2022/05/03.
//

import Foundation

// Mission Model
struct Mission: Identifiable{
    var id = UUID().uuidString
    var complete: Bool = false
    var content: String
}

class MissionViewModel: ObservableObject {
    @Published var mission: Mission
    let randomIndex: Int = Int.random(in: 0..<Mission.missions.count)
    
    init() {
        mission = Mission.missions[randomIndex]
    }
    
    func getState() -> Bool {
        return mission.complete
    }
    
    func getContent() -> String {
        return mission.content
    }
    
    func changeState() {
        mission.complete = !mission.complete
    }
}

extension Mission {
    static var missions = [
        Mission(content: "나에게 칭찬 한마디 하기"),
        Mission(content: "코딩테스트 문제 풀기"),
        Mission(content: "팔굽혀펴기 100개 하기"),
        Mission(content: "물 5잔 마시기"),
        Mission(content: "샐러드 먹기"),
        Mission(content: "C5까지 걸어가기"),
        Mission(content: "이름 모르는 러너에게 말걸기")
    ]
}
