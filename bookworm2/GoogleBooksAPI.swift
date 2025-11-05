//
//  GoogleBooksAPI.swift
//  BookWorm2
//
//  Created by Almudena Lopez Rodriguez on 4/11/25.
//

import Foundation


final class GoogleBooksAPI {
    func search(q: String, max: Int = 20) async throws -> [BookVM] {
        var c = URLComponents(string: "https://www.googleapis.com/books/v1/volumes")!
        c.queryItems = [
            .init(name: "q", value: q),
            .init(name: "printType", value: "books"),
            .init(name: "maxResults", value: String(max))
        ]
        
        let (data, resp) = try await URLSession.shared.data(from: c.url!)
        guard (resp as? HTTPURLResponse)?.statusCode == 200 else {
            return []
        }
        
        let d = try JSONDecoder().decode(GBResponse.self, from: data)
        return d.items.map {
            let raw = $0.volumeInfo.imageLinks?.thumbnail ?? ""
            
            let https = raw.replacingOccurrences(of: "http://", with: "https://")

            return BookVM(
                id: $0.id,
                title: $0.volumeInfo.title ?? "Sin título",
                authors: ($0.volumeInfo.authors ?? []).joined(separator: ", "),
                genres: ($0.volumeInfo.categories ?? []).joined(separator: ", "),
                description: $0.volumeInfo.description ?? "Sin descripcion",
                thumbnailURL: URL(string: https)
            )
        }
    }
}
