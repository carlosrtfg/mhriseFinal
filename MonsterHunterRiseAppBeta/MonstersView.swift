import SwiftUI

struct MonstersView: View {
    @EnvironmentObject var monsters: MonsterModel
    @State var searchMonster: String = ""
    
    var body: some View {
        NavigationStack {
            List() {
                ForEach (
                    monsters.monsters.filter {
                        monster in
                        searchMonster.isEmpty ||
                        monster.name.localizedCaseInsensitiveContains(searchMonster)
                    }
                )
                { monster in
                    NavigationLink(
                        destination: MonsterDetail(
                            name: monster.name,
                            imageUrl: monster.image,
                            monsterType: monster.monsterClass,
                            monsterElement: monster.element,
                            monsterAilments: monster.ailments,
                            monsterWeakestTo: monster.weakestTo,
                            habitat: monster.habitat,
                            monsterSizeBig: monster.size.bigGoldelCrown,
                            monsterSizeSmall: monster.size.smallGoldelCrown
                        )
                    )
                    {
                        MonsterRow(monster: monster)
                    }
                }
            }
            .navigationTitle("Monsters")
            .searchable(
                text: $searchMonster,
                prompt: Text("Monster name")
            )
        }
    }
}

struct MonsterRow: View {
    let monster: Monster
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(monster.name)
                    .font(.headline)
                    .foregroundColor(.pink)
                Text(monster.monsterClass)
                    .font(.footnote)
                    .padding(.leading, 25)
            }
            
            Spacer()
            
            AsyncImage(url: monster.image) {
                image in image
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            
        placeholder: {
            ProgressView()
        }
        }
    }
}

struct Monster_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            
            MonstersView()
                .previewDisplayName("14 pro")
                .previewDevice("iPhone 14 Pro")
                .environmentObject(MonsterModel())
            
            MonstersView()
                .previewDisplayName("SE 3rd")
                .previewDevice("iPhone SE (3rd generation)")
                .environmentObject(MonsterModel())
            
            MonstersView()
                .previewDisplayName("11 pro max")
                .previewDevice("iPhone 11 Pro Max")
                .environmentObject(MonsterModel())
        }
    }
}
