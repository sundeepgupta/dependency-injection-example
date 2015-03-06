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

class Song {
    private let lineStart = "This is "
    private let lineEnd = "."
    private var phrases = [
        "the house that Jack built",
        "the malt that lay in",
        "the rat that ate"
    ]
    
    init(songType: String) {
        switch songType {
        case "repeat":
            self.phrases = Repeater().result(self.phrases)
        case "reverse":
            self.phrases = Reverser().result(self.phrases)
        case "normal":
            println("Do nothing for normal song type")
        default:
            println("Error: Invalid song type.")
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

let song = Song(songType: "normal")
song.line(1)
song.line(2)
song.line(3)
song.recite()

let repeatingSong = Song(songType: "repeat")
repeatingSong.line(1)
repeatingSong.line(2)
repeatingSong.line(3)
repeatingSong.recite()

let reversingSong = Song(songType: "reverse")
reversingSong.line(1)
reversingSong.line(2)
reversingSong.line(3)
reversingSong.recite()
