import Foundation

struct City {
    let Samara: Info//Samara
    let Tolyatti: Info //Tolyatti
    let Novokuibyshevsk: Info // Novokuibyshevsk
    let Chapaevsk: Info
    let Zhigulevsk: Info
    let Kinel: Info//Kinel
    let Syzran: Info//Syzran
    init() {
        Samara = Info(name: "Samara", year: 1586, area: 541.94, population: 1163440)
        Tolyatti = Info(name: "Tolyatti", year: 1737, area: 284.33, population: 707408)
        Novokuibyshevsk = Info(name: "Novokuibyshevsk", year: 1951, area: 263.25, population: 104279)
        Chapaevsk = Info(name: "Chapaevsk", year: 1909, area: 200.50, population: 72778)
        Zhigulevsk = Info(name: "Zhigulevsk", year: 1949, area: 94.15, population: 57687)
        Kinel = Info(name: "Kinel", year: 1837, area: 108.76, population: 172070)
        Syzran = Info(name: "Syzran", year: 1683, area: 136.18, population: 172070)
    }
}

struct Info {
    var name: String
    var year: Int
    var area: Double
    var population: Int
}
/*
struct Samara {
    let name = "Samara"
    let year = 1586
    let area = 541.94
    let population = 1163440
}

struct Tolyatti {
    let name = "Tolyatti"
    let year = 1737
    let area = 284.33
    let population = 707408
}

struct Novokuibyshevsk {
    let name = "Novokuibyshevsk"
    let year = 1951
    let area = 263.25
    let population = 104279
}

struct Chapaevsk {
    let name = "Chapaevsk"
    let year = 1909
    let area = 200.5
    let population = 72778
}

struct Zhigulevsk {
    let name = "Zhigulevsk"
    let year = 1949
    let area = 94.15
    let population = 57687
}

struct Kinel {
    let name = "Kinel"
    let year = 1837
    let area = 108.76
    let population = 58239
}

struct Syzran {
    let name = "Syzran"
    let year = 1683
    let area = 136.18
    let population = 172070
}*/
