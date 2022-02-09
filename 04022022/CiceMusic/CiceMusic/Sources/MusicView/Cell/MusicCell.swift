//
//  MusicCell.swift
//  CiceMusic
//
//  Created by cice on 08/02/2022.
//

import UIKit

protocol MusicCellInputProtocol{
    func setupCell(data:ResultMusic)
}

class MusicCell: UITableViewCell, ReuseIdentifierProtocol {
    
    //IBObjects
    @IBOutlet weak var artistWorkImageView: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var releaseDateLBL: UILabel!
    @IBOutlet weak var kindLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MusicCell: MusicCellInputProtocol{
    func setupCell(data:ResultMusic){
        
    }
}
