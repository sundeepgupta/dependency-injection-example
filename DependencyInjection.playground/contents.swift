// 0. Recite a line and the entire song. No dependencies yet.

import Foundation

struct Song {
    private let lineStart = "This is "
    private let phrases = [
        "the house that Jack built",
        "the malt that lay in",
        "the rat that ate"
    ]
    private let lineEnd = ".\n"
    
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
}

let song = Song()
song.line(1)
song.line(2)
song.line(3)
song.recite()