import Foundation

struct MovieEntity: Identifiable {
    var posterUrl: String
    var name: String
    var id = UUID()
}
