//
//  BookRowView.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import SwiftUI
import KingfisherSwiftUI

struct BookRowView: View {
    
    var book: Book
    
    var body: some View {
        HStack {
            KFImage(book.coverURL)
                .resizable()
                .frame(width: 80, height: 80)
                .whenRedacted(apply: { $0.hidden() })
            
            VStack(alignment: .leading, spacing: 4) {
                Text(book.title)
                    .font(.body)
                
                if let creator = book.creator {
                    Text("By \(creator)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct BookRowView_Previews: PreviewProvider {
    static var previews: some View {
        BookRowView(book: static_book)
            .previewLayout(PreviewLayout.fixed(width: 380, height: 100))
    }
}
