//
//  ScrollingGrid.swift
//  Weather
//
//  Created by Ron Lemire on 3/31/22.
//

import SwiftUI

struct ScrollingGrid: View {
    var body: some View {
        HorizontalScrollingGrid()
        //HorizontalScrollingGridWithAdaptiveLayout()
    }
}

// Grid which drags horizontally from right/left and left/right.
struct HorizontalScrollingGrid: View {
    // Define number of rows with a fixed row height.
    let layout = [
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40))
    ]

    var body: some View {
        VStack {
            Spacer()
            Text("HorizontalScrollingGrid")
            Spacer()
            
            ScrollView(.horizontal) {           // LazyHGrid must be within ScrollView.
                LazyHGrid(rows: layout) {       // Scroll horizontally from right/left and left/right.
                    ForEach(0..<10) { col in    // 10 columns
                        ForEach(11..<16) { num in
                            Text("Item\(num)")
                        }         // 5 Items per column
                    }
                }
            }
            .frame(height: 250)
            .background(Color.blue)
            
            Spacer()
            Text("Some Component")
            Spacer()
            Text("Another Component")
            Spacer()
        }
    }
}

struct HorizontalScrollingGridWithAdaptiveLayout: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
        GridItem(.adaptive(minimum: 80, maximum: 120)),
        GridItem(.adaptive(minimum: 80, maximum: 120)),
        GridItem(.adaptive(minimum: 80, maximum: 120)),
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) { column in
                    Text("Iteeeeem \("1")")
                    Text("Item \("2")")
                    Text("Item \("3")")
                    Text("Item \("4")")
                    Text("Item \("5")")
                }
            }
        }
        .frame(height: 250)
        .background(Color.blue)
    }
}


struct ScrollingGrid_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingGrid()
    }
}
