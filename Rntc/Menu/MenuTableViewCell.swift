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
        nameMenuLbl.text = item.title
        if item.rntcImage != nil {
            imageMenu.image = item.rntcImage
        } else {
            imageMenu.image = UIImage(named: "РНТЦ _лого1")
        }
    } 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
