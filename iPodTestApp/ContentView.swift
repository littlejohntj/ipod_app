//
//  ContentView.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/2/21.
//

import SwiftUI
import MusicKit

class MyState: ObservableObject {
    
    @Published var selected: Int = 0
    var items: [RowItem] = [ RowItem(name: "Music", arrow: true),
                             RowItem(name: "Extras", arrow: true),
                             RowItem(name: "Settings", arrow: true),
                             RowItem(name: "Shuffle Songs", arrow: true),
                             RowItem(name: "Backlight", arrow: false) ]
    
    func up() {
        if selected < 4 {
            selected += 1
        }
    }
    
    func down() {
        if selected > 0 {
            selected -= 1
        }
    }
    
}

struct ContentView: View {
    
    @StateObject var state: MyState
    
    var body: some View {
        VStack {
            TopMenuBar()
            .frame(height: 20.0)
            List {
                ForEach(state.items.indices, id: \.self) { index in
                    CustomeText(text: state.items[index].name, selected: state.selected == index, arrow: state.items[index].arrow)
                }
            }
            Wheel(state: state)
        }
    }
}

struct CustomeText: View {
    var text: String
    var selected: Bool
    var arrow: Bool
    
    var body: some View {
        ZStack {
            selected ? Color.purple.ignoresSafeArea() : Color.green.ignoresSafeArea()
            HStack {
                Text(text).padding()
                Spacer()
                if arrow { Image(systemName: "chevron.right").padding() }
            }
        }
    }
}

struct Wheel: View {
    
    var state: MyState
    var spaceingDistance: CGFloat = 100
    static let shift: CGFloat = 0.2
    
    
    @State var prev: CGFloat = -1 * shift
    @State var current: CGFloat = 0
    @State var next:CGFloat = Wheel.shift
    
    var body: some View {
        VStack {
            Ring(ratio: 0.4)
                .fill(Color.blue)
                .spinnable(onChanged: { (rotation) in
                    if rotation.laps > next {
                        prev = current
                        current = next
                        next = next + Wheel.shift
                        state.up()
                    } else if rotation.laps < prev {
                        next = current
                        current = prev
                        prev = prev - Wheel.shift
                        state.down()
                    }
                    print(rotation.laps)
                }, onEnded: { rotation in
                    print("SUCK ME")
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(state: MyState())
//        MusicView()
    }
}

struct RowItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let arrow: Bool
}

struct Ring: Shape {
    
    var ratio: CGFloat

    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.width / 2,
                             y: rect.height / 2)
        var path = Path()
        path.addArc(center: center,
                    radius: radius,
                    startAngle: .zero,
                    endAngle: .init(radians: .pi * 2),
                    clockwise: true)

        path.addArc(center: center,
                    radius: radius * ratio,
                    startAngle: .zero,
                    endAngle: .init(radians: .pi * 2),
                    clockwise: false)

        return path
    }
}
 
struct MusicView: View {
    var body: some View {
        VStack {
            List {
                Text("sup")
                Text("dude")
            }
            Button("Auth") {
                async {
                    let status = await getAuth()
                    print(status)
                }
            }.padding()
            Button("Play") {
                
            }.padding()
            Button("Pause") {
                SystemMusicPlayer.shared.pause()
            }.padding()
        }
    }
    
    func getAuth() async -> MusicAuthorization.Status {
        let status = await MusicAuthorization.request()
        return status
    }
}
