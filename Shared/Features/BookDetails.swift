//
//  BookDetails.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import SwiftUI
import Combine
import KingfisherSwiftUI

struct BookDetails: View {
    
    var book: Book
    
    init(_ book: Book, audios: [Audio]? = nil) {
        self.book = book
        self.viewModel = BookDetailsViewModel(book: book, audios: audios)
    }
    
    @ObservedObject var viewModel: BookDetailsViewModel
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    KFImage(viewModel.book.coverURL)
                        .resizable()
                        .frame(width: 140, height: 140)
        
                    VStack(alignment: .leading, spacing: 4) {
                        if let creator = viewModel.book.creator {
                            Text("Autor: \(creator)")
                                .font(.headline)
                        }
                        if let runtime = viewModel.book.runtime {
                            Text("Duration: \(runtime)")
                                .font(.body)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    .padding(.top)
                }
                
                AudioPlayer(audio: viewModel.currentAudio)
                    .frame(height: 60)

                ForEach (viewModel.audios ?? Audio.static_audios, id: \.self) { audio in
                    if let title = audio.title {
                        Text(title).font(.body)
                            .redacted(reason: viewModel.audios == nil ? .placeholder : [])
                            .onTapGesture(count: 1) {
                                self.viewModel.selectAudio(audio)
                            }
                    }
                }
                
                if let audios = viewModel.audios, audios.isEmpty {
                    Text("No audios found.")
                }
            }
        }
        .navigationTitle(viewModel.book.title)
        .onAppear(perform: viewModel.fetch)
    }
}

struct BookDetails_Previews: PreviewProvider {
    static var previews: some View {
        BookDetails(static_book, audios: Audio.static_audios)
    }
}
