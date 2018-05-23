import Foundation

struct Flower {
    let height: Int
    let width: Int
    let spacing: Int
    let hardiness: Int
    let water: Int
    let beds: [Bed]
}

struct Bed {
    let depth: Int
    let length: Int
    let yard: Yard
    let flowers: [Flower]
}

struct Yard {
    let location: String
    let beds: [Bed]
}
