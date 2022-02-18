//
//  CustomAlertManager.swift
//  CiceMusic
//
//  Created by cice on 15/02/2022.
//

import Foundation

enum DefaultAlertType: Int{
    case none
    case successLogin
    case failureLogin
    case cannotSendMail
    case generalConfirmation
}

struct CustomAlertManager{
    var type: DefaultAlertType?
    
    // Success Login
    var successLoginTitle = LocalizedKeys.Login.titleAlertLoginSuccess
    var successLoginMessage = LocalizedKeys.Login.messageAlertLoginSuccess
    
    
    // Failure Login
    var failureLoginTitle =  LocalizedKeys.Login.titleAlertLoginFailure
    var failureLoginMessage =  LocalizedKeys.Login.messageAlertLoginfailure
    
    // Success Mail
    var sucessMailTitle = LocalizedKeys.Mail.titleAlertMailSuccess
    var successMailMessage = LocalizedKeys.Mail.messageAlertMailSuccess
    
    // Failure Mail
    var failureMailTitle = LocalizedKeys.Mail.titleAlertMailFailure
    var failureMailMessage = LocalizedKeys.Mail.messageAlertMailFailure
    
    // Confirmation
    var ConfirmationTitle = LocalizedKeys.Confirmation.titleAlertConfirmation
    var ConfirmationMessage = LocalizedKeys.Confirmation.messageAlertConfirmation
    
    // General Title Buttons
    var secondButton = LocalizedKeys.General.generalAccept
    var primaryButton = LocalizedKeys.General.generalCancel
    
    init(type: DefaultAlertType){
        self.type = type
    }
    
}
