//
//  GenericWebViewPresenter.swift
//  CiceMusic
//
//  Created by cice on 16/02/2022.
//

import Foundation

protocol GenericWebPresenterInputProtocol {
    
}

final class GenericWebPresenter {
    var viewController: GenericWebOutputPresenterProtocol?
}

extension GenericWebPresenter: GenericWebPresenterInputProtocol{
    
}
