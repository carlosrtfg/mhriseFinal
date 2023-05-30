import XCTest
import SwiftUI
@testable import MonsterHunterRiseAppBeta

class MonstersViewTests: XCTestCase {
    
    func testMonsterRow() {
        let monster = Monster(
            id: "1",
            name: "monster 1",
            image: URL(string: "https://example.com/image.jpg")!,
            monsterClass: "Test Class",
            element: "Test Element",
            ailments: [],
            weakestTo: [],
            habitat: [],
            size: Size(smallGoldelCrown: 1.0, bigGoldelCrown: 2.0)
        )
        
        let monsterRow = MonsterRow(monster: monster)
        
        // Verifica que el nombre del monstruo salga bien
        XCTAssertEqual(monsterRow.monster.name, "monster 1")
        
        // Verifica que la vista se renderice bien
        XCTAssertNotNil(monsterRow.body)
    }
}
