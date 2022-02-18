//
//  AlertDefaultViewController.swift
//  CiceMusic
//
//  Created by cice on 15/02/2022.
//

import UIKit

protocol AlertDefaultViewControllerDelegate: AnyObject{
    func primaryButtonPressed()
    func secondButtonPressed()
}

class AlertDefaultViewController: UIViewController {

    // MARK: - Variables Globales
    var alertManager: CustomAlertManager?
    var type: DefaultAlertType?
    weak var delegate: AlertDefaultViewControllerDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleAlertLBL: UILabel!
    @IBOutlet weak var messageAlertLBL: UILabel!
    @IBOutlet weak var primaryBTN: UIButton!
    @IBOutlet weak var secondaryBTN: UIButton!
    @IBOutlet weak var closeBTN: UIButton!
    @IBOutlet weak var alertContentView: UIView!
    
    @IBOutlet weak var constHeightButtonCancel: NSLayoutConstraint!
    @IBOutlet weak var constHeightButtonAccept: NSLayoutConstraint!
    // MARK: - IBActions
    
    @IBAction func closeACTION(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func primaryButtonACTION(_ sender: Any) {
        self.dismiss(animated: true){
            self.delegate?.primaryButtonPressed()
        }
    }
    
    @IBAction func secondaryButtonACTION(_ sender: Any) {
        self.dismiss(animated: true){
            self.delegate?.secondButtonPressed()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        // Do any additional setup after loading the view.
    }

    private func configuracionUI(){
        self.primaryBTN.layer.cornerRadius = 25
        self.secondaryBTN.layer.cornerRadius = 25
        self.alertContentView.layer.cornerRadius = 10
        switch alertManager?.type {
        case .successLogin:
            self.titleAlertLBL.text = alertManager?.successLoginTitle
            self.messageAlertLBL.text = alertManager?.successLoginMessage
            self.primaryBTN.setTitle(alertManager?.primaryButton, for: .normal)
            self.secondaryBTN.isHidden = true
            self.closeBTN.isHidden = true
            self.constHeightButtonCancel.constant = 0
        case .failureLogin:
            self.titleAlertLBL.text = alertManager?.failureLoginTitle
            self.messageAlertLBL.text = alertManager?.failureLoginMessage
            self.primaryBTN.isHidden = true
            self.constHeightButtonAccept.constant = 0
            self.secondaryBTN.setTitle(alertManager?.secondButton, for: .normal)
        case .cannotSendMail:
            self.titleAlertLBL.text = alertManager?.failureMailTitle
            self.messageAlertLBL.text = alertManager?.failureMailMessage
            self.primaryBTN.isHidden = true
            self.constHeightButtonAccept.constant = 0
            self.secondaryBTN.setTitle(alertManager?.secondButton, for: .normal)
        case .generalConfirmation:
            self.titleAlertLBL.text = alertManager?.successLoginTitle
            self.messageAlertLBL.text = alertManager?.successLoginMessage
            self.primaryBTN.setTitle(alertManager?.primaryButton, for: .normal)
            self.secondaryBTN.isHidden = true
            self.closeBTN.isHidden = true
            self.constHeightButtonCancel.constant = 0
        default:
            self.titleAlertLBL.text = "Algo pasa"
            self.messageAlertLBL.text = "y no sabemos qué"
            self.primaryBTN.setTitle(alertManager?.primaryButton, for: .normal)
            self.secondaryBTN.setTitle(alertManager?.secondButton, for: .normal)
        }
    }

}
