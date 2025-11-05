//
//  BookDetailViewController.swift
//  BookWorm2
//
//  Created by Almudena Lopez Rodriguez on 5/11/25.
//

import UIKit

class BookDetailViewController: UIViewController {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var vm: BookVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = vm.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        authorLabel.text = vm.authors
        genreLabel.text = vm.genres.isEmpty ? "Sin genero" : vm.genres
        descriptionLabel.text = vm.description ?? "Sin descripcion"
        coverImageView.image = UIImage(systemName: "book")
        
        if let url = vm.thumbnailURL {
                    Task {
                        if let (data, _) = try? await URLSession.shared.data(from: url),
                           let img = UIImage(data: data) {
                            await MainActor.run { self.coverImageView.image = img }
                        }
                    }
                }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
