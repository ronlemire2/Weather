//
//  ColumnAlignment.swift
//  Weather
//
//  Created by Ron Lemire on 3/30/22.
//

import SwiftUI

// Layout Guide
// https://www.hackingwithswift.com/books/ios-swiftui/layout-and-geometry-introduction
// Grid
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-position-views-in-a-grid-using-lazyvgrid-and-lazyhgrid
// Fixed size spacer
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-make-a-fixed-size-spacer
// Stacks
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-stacks-using-vstack-and-hstack

// Uses Preferences
// https://stackoverflow.com/questions/56588332/align-two-swiftui-text-views-in-hstack-with-correct-alignment

// Uses LazyGrid
// https://stackoverflow.com/questions/64972016/how-align-columns-for-multiple-items-on-a-vstack-on-swiftui
struct ColumnAlignment: View {
    let data = ["a", "b", "cdefghl alalala", "i", "j"]
    
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
            ],
            alignment: .center,
            spacing: 10,
            pinnedViews: [],
            content: {
                ForEach (data, id:\.self) { item in
                    Text(item)
                }
            })
    }
}

struct ColumnAlignment_Previews: PreviewProvider {
    static var previews: some View {
        ColumnAlignment()
    }
}
