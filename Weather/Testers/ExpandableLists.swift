//
//  ExpandableLists.swift
//  Weather
//
//  Created by Ron Lemire on 3/31/22.
//

import SwiftUI

/*
https://www.youtube.com/watch?v=cR_5lbb0yss (recursive lists)
https://github.com/recoding-io/swiftui-videos/tree/main/Expandable%20Views
https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-expanding-lists
https://www.youtube.com/watch?v=G0qor4QumfA
https://www.appcoda.com/learnswiftui/swiftui-expandable-list.html
https://www.appcoda.com/swiftui-expandable-list-view/
*/

struct ExpandableLists: View {
    let items: [Bookmark] = [.example1, .example2, .example3]

    var body: some View {
        List(items, children: \.items) { row in
            Image(systemName: row.icon)
            Text(row.name)
        }
    }
}

struct ExpandableLists_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableLists()
    }
}


struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?

    // some example websites
    static let apple = Bookmark(name: "Apple", icon: "1.circle")
    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
    static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
    static let twitter = Bookmark(name: "Twitter", icon: "mic")

    // some example groups
    static let example1 = Bookmark(name: "Favorites", icon: "star", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
}


