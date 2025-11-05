//
//  BookModels.swift
//  BookWorm2
//
//  Created by Almudena Lopez Rodriguez on 4/11/25.
//

import Foundation

struct GBResponse: Decodable { let items: [GBVolume] }
struct GBVolume: Decodable { let id: String; let volumeInfo: GBVolumeInfo}

struct GBVolumeInfo: Decodable {
    let title: String?
    let authors: [String]?
    let categories: [String]?
    let description: String?
    let imageLinks: GBImageLinks?
}

struct GBImageLinks: Decodable { let thumbnail: String?}

struct BookVM {
    let id: String
    let title: String
    let authors: String
    let genres: String
    let description: String?
    let thumbnailURL: URL?
}
