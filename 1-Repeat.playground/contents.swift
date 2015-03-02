import Foundation

class Song {
    private let lineStart = "This is "
    private var phrases = [
        "the house that Jack built",
        "the malt that lay in",
        "the rat that ate"
    ]
    private let lineEnd = ".\n"
    
    init(repeat: Bool) {
        if repeat {
            self.repeatPhrases()
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
}

let song = Song(repeat: false)
song.line(1)
song.line(2)
song.line(3)
song.recite()

let repeatingSong = Song(repeat: true)
repeatingSong.line(1)
repeatingSong.line(2)
repeatingSong.line(3)
repeatingSong.recite()