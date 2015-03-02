import Foundation

class Song {
    private let lineStart = "This is "
    private let lineEnd = "."
    private var phrases = [
        "the house that Jack built",
        "the malt that lay in",
        "the rat that ate"
    ]
    
    init(repeat: Bool, reverse: Bool) {
        if repeat {
            self.repeatPhrases()
        }
        
        if reverse {
            self.reversePhrases()
        }
    }
    
    func line(number: Int) -> String {
        let linePhrases = self.phrases[0...number-1].reverse()
        let line = " ".join(linePhrases)
        return self.lineStart + line + self.lineEnd
    }
    
    func recite() -> String {
        var lines = [String]()
        for i in 1...self.phrases.count {
            lines.append(self.line(i))
        }
        return "\n".join(lines)
    }
    
    private func repeatPhrases() {
        self.phrases = self.phrases.map({ (phrase: String) -> String in
            return phrase + " " + phrase
        })
    }
    
    private func reversePhrases() {
        self.phrases = self.phrases.reverse()
    }
}

let song = Song(repeat: false, reverse: false)
song.line(1)
song.line(2)
song.line(3)
song.recite()

let repeatingSong = Song(repeat: true, reverse: false)
repeatingSong.line(1)
repeatingSong.line(2)
repeatingSong.line(3)
repeatingSong.recite()

let reversingSong = Song(repeat: false, reverse: true)
reversingSong.line(1)
reversingSong.line(2)
reversingSong.line(3)
reversingSong.recite()

let repeatingReversingSong = Song(repeat: true, reverse: true)
repeatingReversingSong.line(1)
repeatingReversingSong.line(2)
repeatingReversingSong.line(3)
repeatingReversingSong.recite()
