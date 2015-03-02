import Foundation

class Song {
    private let lineStart = "This is "
    private let lineEnd = "."
    private var phrases = [
        "the house that Jack built",
        "the malt that lay in",
        "the rat that ate"
    ]
    
    init(listChangers: Array<ListChanger>) {
        for listChanger in listChangers {
            self.phrases = listChanger.result(self.phrases)
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

protocol ListChanger {
    func result(list: Array<String>) -> Array<String>
}

class Repeater : ListChanger {
    func result(list: Array<String>) -> Array<String> {
        return list.map({ (item) -> String in
            return item + " " + item
        })
    }
}

class Reverser : ListChanger {
    func result(list: Array<String>) -> Array<String> {
        return list.reverse()
    }
}

let song = Song(listChangers: [])
song.line(1)
song.line(2)
song.line(3)
song.recite()

let repeatingSong = Song(listChangers: [Repeater()])
repeatingSong.line(1)
repeatingSong.line(2)
repeatingSong.line(3)
repeatingSong.recite()

let reversingSong = Song(listChangers: [Reverser()])
reversingSong.line(1)
reversingSong.line(2)
reversingSong.line(3)
reversingSong.recite()

let repeatingReversingSong = Song(listChangers: [Repeater(), Reverser()])
repeatingReversingSong.line(1)
repeatingReversingSong.line(2)
repeatingReversingSong.line(3)
repeatingReversingSong.recite()
