import Foundation

struct Flower {
    let id: UUID
    let height: Int
    let width: Int
    let spacing: Int
    let hardiness: Int
    let water: Int
}

struct Bed {
    let id: UUID
    let depth: Int
    let length: Int
    let yard: Yard
    let flowers: [Flower]
}

struct Yard {
    let id: UUID
    let location: String
    let beds: [Bed]
}
