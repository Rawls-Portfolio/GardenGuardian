import Foundation

struct Garden {
    let yard: Yard
    let bed: Bed
    let flowers: [Flower]
}

struct Flower {
    let name: String
    let height: Int
    let width: Int
    let spacing: Int
    let hardiness: Int
    let water: Int
}

struct Bed {
    let desc: String
    let depth: Int
    let length: Int
}

struct Yard {
    let desc: String
    let location: String
}
