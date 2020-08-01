//
//  BookDetailsViewModel.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import Foundation
import Combine
import AVFoundation

class BookDetailsViewModel: NSObject, ObservableObject {
    let book: Book
    @Published var audios: [Audio]?
    @Published var currentAudio: Audio?
    
    private let player = AVPlayer()
    
    init(book: Book, audios: [Audio]? = nil) {
        self.audios = audios
        self.book = book
    }
    
    private var cancellableStore: [AnyCancellable] = []
    
    func selectAudio(_ audio: Audio) {
        currentAudio = audio
        
        if let url = formAudioFileUrl(audio: audio, book: book) {
            let playItem = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: playItem)
            playItem.addObserver(self, forKeyPath: #keyPath(AVPlayerItem.status), options: [.old, .new], context: nil)
        }
    }
    
    func formAudioFileUrl(audio: Audio, book: Book) -> URL? {
        return URL(string: "https://archive.org/download/\(book.identifier)/\(audio.name)")
    }
    
    func fetch() {
        let cancellable = Audio.fetchBookAudios(book.identifier)
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
            } receiveValue: { [weak self] (result) in
                self?.audios = result.result.filter({ $0.track != nil })
            }
        cancellableStore.append(cancellable)
    }
    
    func togglePlay() {
    }
    
    func gobackward() {
        
    }
    
    func goforward() {
        
    }
}
