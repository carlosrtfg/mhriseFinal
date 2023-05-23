import SwiftUI

@main
struct MonsterHunterRiseAppBetaApp: App {
    @StateObject var monsters = MonsterModel()
    
    var body: some Scene {
        WindowGroup {
            MonstersView()
                .environmentObject(monsters)
        }
    }
}
