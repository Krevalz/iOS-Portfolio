//: Playground - noun: a place where people can play

import Foundation

enum Eye: String {
    case normal = ":"
    case winkey = ";"
    case tear = ":'"
    case glasses = "B"
    case angry = ">:"
}

enum Nose: String {
    case none = ""
    case straight = "-"
    case pointy = "^"
}

enum Mouth: String {
    case smile = ")"
    case straight = "|"
    case tongue = "P"
    case grin = "D"
    case unsure = "/"
    case frown = "("
    case open = "O"
    case pacman = "v"
    case curly = "3"
    case edgy = "]"
}

func printFace(eye: Eye, nose: Nose, mouth: Mouth) {
    print("\(eye.rawValue)\(nose.rawValue)\(mouth.rawValue)")
}

printFace(eye: .angry, nose: .pointy, mouth: .grin)
printFace(eye: .winkey, nose: .straight, mouth: .edgy)
printFace(eye: .tear, nose: .none, mouth: .frown)
