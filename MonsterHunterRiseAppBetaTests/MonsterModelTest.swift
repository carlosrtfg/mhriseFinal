import XCTest
@testable import MonsterHunterRiseAppBeta

class MonsterModelTests: XCTestCase {
    
    func testMonsterModelInitialization() {
        let monsterModel = MonsterModel()
        
        //verifica que se haga bien la carga inicial del modolo
        XCTAssertFalse(monsterModel.monsters.isEmpty)
    }
    
    func testMonsterModelDecoding() {
        let jsonString = """
        [
            {
                "id": "1",
                "name": "Monster 1",
                "image": "https://example.com/image1.jpg",
                "monsterClass": "Class 1",
                "element": "Element 1",
                "ailments": ["ai1","ai2"],
                "weakestTo": ["wk1"],
                "Habitat": ["Habitat 1"],
                "size": {
                    "smallGoldelCrown": 1.0,
                    "bigGoldelCrown": 2.0
                }
            },
            {
                "id": "2",
                "name": "Monster 2",
                "image": "https://example.com/image2.jpg",
                "monsterClass": "Class 2",
                "element": "Element 2",
                "ailments": ["ai1"],
                "weakestTo": [],
                "Habitat": ["Habitat 2"],
                "size": {
                    "smallGoldelCrown": 0.5,
                    "bigGoldelCrown": 1.5
                }
            }
        ]
        """
        
        let jsonData = jsonString.data(using: .utf8)!
        
        do {
            let decoder = JSONDecoder()
            let monsters = try decoder.decode([Monster].self, from: jsonData)
            
            let monsterModel = MonsterModel()
            monsterModel.monsters = monsters
            
            // Verifica que el modelo tenga los monstruos bien decodificados
            XCTAssertEqual(monsterModel.monsters.count, 2)
            
            // Verifica que los nombres de los monstruos esten bien
            XCTAssertEqual(monsterModel.monsters[0].name, "Monster 1")
            XCTAssertEqual(monsterModel.monsters[1].name, "Monster 2")
        } catch {
            //para forzar este error cambiar, por ejemplo el nombre de string a int
            XCTFail("Error al decodificar los datos: \(error)")
        }
    }
}
