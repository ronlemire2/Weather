//
//  DetailRow.swift
//  Weather
//
//  Created by Ron Lemire on 3/28/22.
//

import SwiftUI

struct DetailRow: View {
    var name: String
    var value: String
    
    var body: some View {
        HStack {
            Text("\(name)")
            Spacer()
            Text("\(value)")
        }
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(name: "main", value: "Mist")
    }
}
