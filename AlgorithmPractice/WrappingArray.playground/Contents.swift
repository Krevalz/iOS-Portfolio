//: Playground - noun: a place where people can play

import Foundation

class playlistManager {
    let songs = ["Despacito", "Shape of You", "Slow Hands", "HUMBLE", "Look What You Made Me Do", "Strip That Down"]
    var previousPlayedTracks = [String]()
    var queue = [String]()
    
    func select(song: String) {
        if songs.contains(song) {
            let index = songs.index(of: song)!
            queue = Array(songs.suffix(from: index) + songs.prefix(upTo: index))
        }
    }
    
    func next() {
        previousPlayedTracks.append(queue[0])
        queue = Array(queue[1..<queue.count])
    }
}

let iPod = playlistManager()

//Select first song
iPod.select(song: "Shape of You")
iPod.next()
iPod.next()

print("Peviously Played: \(iPod.previousPlayedTracks)")
print("Current Queue: \(iPod.queue) \n")

// Selecting new song resets the queue
iPod.select(song: "Strip That Down")

print("Peviously Played: \(iPod.previousPlayedTracks)")
print("Current Queue: \(iPod.queue) \n")

// Play all songs
iPod.next()
iPod.next()
iPod.next()
iPod.next()
iPod.next()
iPod.next()
print("Peviously Played: \(iPod.previousPlayedTracks)")
print("Current Queue: \(iPod.queue)")


