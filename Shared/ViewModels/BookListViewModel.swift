//
//  BookListViewModel.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import Foundation
import Combine

class BookListViewModel: ObservableObject {
    @Published var books: [Book]?
    
    init(books: [Book]? = nil) {
        self.books = books    
    }
    
    private var cancellableStore: [AnyCancellable] = []
    
    func fetch() {
        let cancellable = Book.fetchMostDownloads()
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                print(completion)
            } receiveValue: { [weak self] (books) in
                self?.books = books.docs
            }
        cancellableStore.append(cancellable)
    }
}
