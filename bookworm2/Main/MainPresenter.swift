//
//  MainPresenter.swift
//  BookWorm2
//
//  Created by Almudena Lopez Rodriguez on 5/11/25.
//

import Foundation


final class MainPresenter: MainPresenting {
    weak var view: MainView?
    let interactor: MainInteracting
    let router: MainRouting

    init(view: MainView, interactor: MainInteracting, router: MainRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func search(text: String) {
        interactor.search(text: text) { [weak self] items in
            self?.view?.showResults(items)
        }
    }

    func didSelect(_ vm: BookVM) {
        router.goToDetail(vm)
    }
}
