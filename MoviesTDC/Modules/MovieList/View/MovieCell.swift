import SwiftUI
struct MovieCell: View {
    var movie: MovieEntity

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            AsyncImage(
                url: URL(string: movie.posterUrl)!,
                placeholder: PlaceHolder(),
                configuration: {
                    $0.resizable().renderingMode(.original)
                })
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 170)
                .clipped()
                .cornerRadius(10)
                .shadow(radius: 10)
            Text(movie.name)
            .foregroundColor(.primary)
            .font(.headline)
        }.accessibility(identifier: "HStackMovieCell")
    }

    private struct PlaceHolder: View {
        var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange)
                .frame(height: 170)
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: MovieEntity(posterUrl: "", name: "teste"))
    }
}
