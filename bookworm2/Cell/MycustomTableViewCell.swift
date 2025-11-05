//
//  MycustomTableViewCell.swift
//  BookWorm2
//
//  Created by Almudena Lopez Rodriguez on 3/11/25.
//

import UIKit

class MycustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myfirstlabel: UILabel!
    @IBOutlet weak var mysecondlabel: UILabel!
    @IBOutlet weak var myimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myfirstlabel.font = UIFont.boldSystemFont(ofSize: 20)
        myfirstlabel.textColor = .black
        myfirstlabel.numberOfLines = 0
        mysecondlabel.numberOfLines = 0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        print(myfirstlabel.text ?? "")
    }
    
}
