import SwiftUI

struct MonsterDetail: View {
    //variables que se inicializan en en MonsterView
    var name: String
    var imageUrl: URL
    var monsterType: String
    var monsterElement: String
    var monsterAilments: Array<String>
    var monsterWeakestTo: Array<String>
    var habitat: Array<String>
    var monsterSizeBig: Double
    var monsterSizeSmall: Double
    
    var body: some View {
        
        //nivigation list con diseño de "card" para mostrar el monstruo y sus datos
        //intento 2
        
        NavigationStack {
            
            List() {
                
                HStack {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 200)
                            .padding(.leading, 90)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Text("Type: ")
                    .foregroundColor(Color.pink)
                    .bold()
                + Text("\(monsterType)")
                
                Text("Element: ")
                    .foregroundColor(Color.pink)
                    .bold()
                + Text("\(monsterElement)")
                
                Text("Ailments: ")
                    .foregroundColor(Color.pink)
                    .bold()
                + Text("\(monsterAilments.joined(separator: ", "))")
                
                Text("Weakest to: ")
                    .foregroundColor(Color.pink)
                    .bold()
                + Text("\(monsterWeakestTo.joined(separator: ", "))")
                
                Text("Habitat: ")
                    .foregroundColor(Color.pink)
                    .bold()
                + Text("\(habitat.joined(separator: ", "))")
                
                VStack {
                    HStack {
                        Text("Max size golden crown: ")
                            .foregroundColor(Color.pink)
                            .bold()
                        + Text("\(monsterSizeBig.description)")
                        
                        Spacer()
                        
                        Image("bigcrown")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    
                    
                    HStack {
                        Text("Min size golden crown: ")
                            .foregroundColor(Color.pink)
                            .bold()
                        + Text("\(monsterSizeSmall.description)")
                        
                        Spacer()
                        
                        Image("smallcrown")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.trailing, 5)
                    }
                }
            }
            .navigationBarTitle("\(name)")
            
        }
    }
}

var urlInitializer = URL(string: "Test")

struct MonsterDetail_Previews: PreviewProvider {
    static var previews: some View {
        MonsterDetail(
            name: "monsterName",
            imageUrl: urlInitializer!,
            monsterType: "monsterType",
            monsterElement: "MonsterElement",
            monsterAilments: ["MonsterAilment","monsterAilment2"],
            monsterWeakestTo: ["WeakestTo"],
            habitat: ["Habitat"],
            monsterSizeBig: 2.0,
            monsterSizeSmall: 1.0)
    }
}
