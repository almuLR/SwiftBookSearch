//
//  Maincontracts.swift
//  BookWorm2
//
//  Created by Almudena Lopez Rodriguez on 5/11/25.
//

import Foundation

protocol MainView: AnyObject {
    func showResults(_ items: [BookVM])
}

protocol MainPresenting {
    func search(text: String)
    func didSelect(_ vm: BookVM)
}

protocol MainInteracting {
    func search(text: String, completion: @escaping ([BookVM]) -> Void)
}

protocol MainRouting {
    func goToDetail(_ vm: BookVM)
}
