//
//  MainRouter.swift
//  BookWorm2
//
//  Created by Almudena Lopez Rodriguez on 5/11/25.
//

import Foundation
import UIKit

final class MainRouter: MainRouting {
    weak var viewController: UIViewController?

    static func build() -> UIViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let nav = sb.instantiateInitialViewController() as! UINavigationController
        let vc  = nav.viewControllers.first as! ViewController
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        router.viewController = vc
        return UINavigationController(rootViewController: vc)

    }

    func goToDetail(_ vm: BookVM) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let detail = sb.instantiateViewController(withIdentifier: "BookDetailVC") as! BookDetailViewController
        detail.vm = vm
        viewController?.navigationController?.pushViewController(detail, animated: true)
    }
}
