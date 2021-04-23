//
//  MenuTableViewCell.swift
//  Rntc
//
//  Created by Domiik on 04.03.2021.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageMenu: UIImageView!
    @IBOutlet weak var nameMenuLbl: UILabel!
    
    func configureCell(_ item: ItemScanning) {
        guard nameMenuLbl.text != nil else {
            nameMenuLbl.text = "Загрузка"
            return
        }
        nameMenuLbl.text = item.title
        guard item.rntcImage != nil else {
            imageMenu.image = UIImage(named: "РНТЦ _лого")
            return
        }
        imageMenu.image = item.rntcImage
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
