//
//  MainInteractor.swift
//  BookWorm2
//
//  Created by Almudena Lopez Rodriguez on 5/11/25.
//

import Foundation


final class MainInteractor: MainInteracting {
    private let api = GoogleBooksAPI()

    func search(text: String, completion: @escaping ([BookVM]) -> Void) {
        Task {
            let result = (try? await api.search(q: text)) ?? []
            await MainActor.run { completion(result) }
        }
    }
}
