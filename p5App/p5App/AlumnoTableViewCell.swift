//
//  AlumnoTableViewCell.swift
//  p5App
//
//  Created by Abel Fernandez on 20/05/2017.
//  Copyright © 2017 Daferpi. All rights reserved.
//

import UIKit

class AlumnoTableViewCell: UITableViewCell {
    
    
    @IBOutlet var photoImg: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var descLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
