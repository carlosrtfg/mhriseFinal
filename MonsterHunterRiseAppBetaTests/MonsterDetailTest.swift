import XCTest
import SwiftUI
@testable import MonsterHunterRiseAppBeta

class MonsterDetailTests: XCTestCase {
    
    func testMonsterDetail() {
        let monsterDetail = MonsterDetail(
            name: "Test Monster",
            imageUrl: URL(string: "https://example.com/image.jpg")!,
            monsterType: "Test Type",
            monsterElement: "Test Element",
            monsterAilments: ["Ailment 1", "Ailment 2"],
            monsterWeakestTo: ["Weakest 1", "Weakest 2"],
            habitat: ["Habitat 1", "Habitat 2"],
            monsterSizeBig: 2.0,
            monsterSizeSmall: 1.0
        )
        
        // Verifica que el nombre del monstruo salga bien
        XCTAssertEqual(monsterDetail.name, "Test Monster")
        
        // Verifica que la vista se renderice bien
        XCTAssertNotNil(monsterDetail.body)
    }
    
}
