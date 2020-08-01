//
//  AudioPlayer.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import SwiftUI
import Combine

struct AudioPlayer: View {
    
    @ObservedObject var viewModel: AudioPlayerViewModel
    
    init(audio: Audio?) {
        self.viewModel = AudioPlayerViewModel(audio: audio)
    }
    
    var body: some View {
        VStack {            
            HStack {
                Spacer()
                
                Button(action: {
                    print("gobackward 15")
                }, label: {
                    Image(systemName: "gobackward.15")
                })
                
                Spacer(minLength: 30)
                                
                Button(action: {
                    
                }, label: {
                    if viewModel.playing {
                        Image(systemName: "pause")
                    } else {
                        Image(systemName: "play")
                    }
                })
                
                Spacer(minLength: 30)

                Button(action: {
                    print("goforward 15")
                }, label: {
                    Image(systemName: "goforward.15")
                })
                
                Spacer()
            }
        }
    }
}

struct AudioPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayer(audio: Audio.static_audios[0])
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
