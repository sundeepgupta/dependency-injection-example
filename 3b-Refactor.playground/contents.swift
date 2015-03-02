import Foundation

class Song {
    private let lineStart = "This is "
    private var phrases = [
        "the house that Jack built",
        "the malt that lay in",
        "the rat that ate"
    ]
    private let lineEnd = ".\n"
    
    init(repeater: Repeater?, reverser: Reverser?) {
        if let aRepeater = repeater {
            self.phrases = aRepeater.result(self.phrases)
        }
        
        if let aReverser = reverser {
            self.phrases = aReverser.result(self.phrases)
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
}

class Repeater {
    func result(list: Array<String>) -> Array<String> {
        return list.map({ (item) -> String in
            return item + " " + item
        })
    }
}

class Reverser {
    func result(list: Array<String>) -> Array<String> {
        return list.reverse()
    }
}

let song = Song(repeater: nil, reverser: nil)
song.line(1)
song.line(2)
song.line(3)
song.recite()

let repeatingSong = Song(repeater: Repeater(), reverser: nil)
repeatingSong.line(1)
repeatingSong.line(2)
repeatingSong.line(3)
repeatingSong.recite()

let reversingSong = Song(repeater: nil, reverser: Reverser())
reversingSong.line(1)
reversingSong.line(2)
reversingSong.line(3)
reversingSong.recite()

let repeatingReversingSong = Song(repeater: Repeater(), reverser: Reverser())
repeatingReversingSong.line(1)
repeatingReversingSong.line(2)
repeatingReversingSong.line(3)
repeatingReversingSong.recite()
