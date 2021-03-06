/*

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit
import Kingfisher

//Output del Presenter
protocol AppleGenericDetailPresenterOutputProtocol {
    func reloadInformationInView()
    
}

class AppleGenericDetailViewController: BaseView<AppleGenericDetailPresenterInputProtocol> {

    //MARK: - IBOutlet
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var catalogImageView: UIImageView!
    @IBOutlet weak var artistNameLBL: UILabel!
    @IBOutlet weak var releaseDateLBL: UILabel!
    @IBOutlet weak var goToAppleStoreBTN: UIButton!
    @IBOutlet weak var appsCollectionView: UICollectionView!
    
    //MARK: - IBActions
    @IBAction func goToAppleStoreACTION(_ sender: Any) {
        self.presenter?.showAppleStore()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchDataFromWebService()
        self.configuracionUI()
        self.configuracionCollectionView()
    }
    
    private func configuracionUI(){
        self.backgroundImageView.kf.setImage(with: URL(string: self.presenter?.dataModel?.artworkUrl100?.replacingOccurrences(of: "100x100", with: "600x600") ?? "placeholder"))
        self.catalogImageView.kf.setImage(with: URL(string: self.presenter?.dataModel?.artworkUrl100?.replacingOccurrences(of: "100x100", with: "600x600") ?? "placeholder"))
        self.artistNameLBL.text = self.presenter?.dataModel?.artworkUrl100
        self.releaseDateLBL.text = self.presenter?.dataModel?.releaseDate
        
        self.catalogImageView.layer.cornerRadius = self.catalogImageView.frame.width / 2
        self.catalogImageView.layer.borderColor = UIColor.red.cgColor
        self.catalogImageView.layer.borderWidth = 1.5
        
        self.goToAppleStoreBTN.layer.cornerRadius = 10
        self.goToAppleStoreBTN.layer.borderColor = UIColor.black.cgColor
        self.goToAppleStoreBTN.layer.borderWidth = 1.5
    }
    
    private func configuracionCollectionView(){
        self.appsCollectionView.delegate = self
        self.appsCollectionView.dataSource = self
        self.appsCollectionView.register(UINib(nibName: AppsCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier:
                                            AppsCell.defaultReuseIdentifier)
    }

}

//Output del Presenter
extension AppleGenericDetailViewController: AppleGenericDetailPresenterOutputProtocol {

    func reloadInformationInView() {
        self.appsCollectionView.reloadData()
    }
}

extension AppleGenericDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter?.numberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let appCell =  self.appsCollectionView.dequeueReusableCell(withReuseIdentifier: AppsCell.defaultReuseIdentifier, for: indexPath) as! AppsCell
        if let model = self.presenter?.informationForIndexPath(indexPath: indexPath.row){
            appCell.setupCell(data: model)
        }
        return appCell
    }
    
}
