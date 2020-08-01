//
//  AudioPlayerViewModel.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import Foundation
import Combine

class AudioPlayerViewModel: ObservableObject {
    var audio: Audio?
    
    @Published var playing: Bool = false
    
    init(audio: Audio?) {
        self.audio = audio
    }
}
