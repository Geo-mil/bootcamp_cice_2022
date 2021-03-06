//
//  AppsCell.swift
//  CiceMusic
//
//  Created by cice on 11/02/2022.
//

import UIKit
import Kingfisher

protocol AppsCellProtocol {
    func  setupCell(data: GenericResult)
}

class AppsCell: UICollectionViewCell, ReuseIdentifierProtocol {

    //MARK: - IBOutlet
    @IBOutlet weak var appsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension AppsCell: AppsCellProtocol {
    func  setupCell(data: GenericResult){
        guard let urlUnw = URL(string: data.artworkUrl100 ?? "placeholder") else { return }
        self.appsImageView.kf.setImage(with: urlUnw)
    }
}
