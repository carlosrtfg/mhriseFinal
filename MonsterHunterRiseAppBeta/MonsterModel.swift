import Foundation
import SwiftUI
import Combine

// MARK: - MonsterElement
struct Monster: Codable, Identifiable, Hashable {
    let id, name: String
    let image: URL
    let monsterClass, element: String
    let ailments, weakestTo, habitat: [String]
    let size: Size

    enum CodingKeys: String, CodingKey {
        case id, name, image, monsterClass, element, ailments, weakestTo
        case habitat = "Habitat"
        case size
    }
}

// MARK: - Size
struct Size: Codable, Hashable {
    let smallGoldelCrown, bigGoldelCrown: Double
}

class MonsterModel:ObservableObject {
    @Published var monsters:[Monster]
    
    init() {
        guard let url = Bundle.main.url(forResource: "monsters", withExtension: "json") else{
            monsters = []
            return
        }
        do {
            let data = try Data(contentsOf: url)
            monsters = try JSONDecoder().decode([Monster].self, from: data)
        } catch{
            print("Error en la carga \(error)")
            monsters = []
        }
    }
}
