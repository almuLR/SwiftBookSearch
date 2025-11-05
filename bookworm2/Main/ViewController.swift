//
//  ViewController.swift
//  BookWorm2
//
//  Created by Almudena Lopez Rodriguez on 3/11/25.
//

import UIKit

class ViewController: UIViewController, MainView {
    private let searchBar = UISearchBar()
    private var items: [BookVM] = []
    var presenter: MainPresenting!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Buscar libros"
        searchBar.placeholder = "Título o autor"
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "MycustomTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
    }
    
    func showResults(_ items: [BookVM]) {
        self.items = items
        tableView.reloadData()
    }
}
    
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange text: String) {
        presenter.search(text: text)
    }
}
    
extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
        
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as! MycustomTableViewCell
        let vm = items[indexPath.row]
            
        cell.myfirstlabel.text = vm.title
        cell.mysecondlabel.text = vm.authors
        cell.myimage.image = UIImage(systemName: "book")
            
        if let url = vm.thumbnailURL {
            Task {
                if let (data, _) = try? await URLSession.shared.data(from: url),
                    let image = UIImage(data: data) {
                    await MainActor.run { cell.myimage.image = image }
                }
            }
        }
        return cell
            
    }
}
    
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vm = items[indexPath.row]
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BookDetailVC") as! BookDetailViewController
        vc.vm = vm
        navigationController?.pushViewController(vc, animated: true)
    }
}
    

