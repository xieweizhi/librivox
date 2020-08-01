//
//  HomeView.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: BookListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach (viewModel.books ?? static_books) { book in
                    NavigationLink(destination: BookDetails(book)) {
                        BookRowView(book: book)
                            .redacted(reason: viewModel.books == nil ? .placeholder : [])
                    }
                }
            }
            .navigationTitle("Home")
        }
        .onAppear(perform: viewModel.fetch)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: BookListViewModel(books: static_books))
    }
}
