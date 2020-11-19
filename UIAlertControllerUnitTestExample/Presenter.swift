//
//  Presenter.swift
//  UIAlertControllerUnitTestExample
//
//  Created by Sergey Kargopolov on 2020-11-18.
//

import Foundation

class Presenter: PresenterProtocol {
    
    private weak var delegate: ViewControllerProtocol?
    
    required init(delegate: ViewControllerProtocol) {
        self.delegate = delegate
    }
    
    func showAlert() {
        self.delegate?.showAlert()
    }
    
}
