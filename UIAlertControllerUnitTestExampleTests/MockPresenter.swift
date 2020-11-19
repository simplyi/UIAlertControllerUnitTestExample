//
//  ViewControllerMock.swift
//  UIAlertControllerUnitTestExampleTests
//
//  Created by Sergey Kargopolov on 2020-11-18.
//

import Foundation
@testable import UIAlertControllerUnitTestExample

class MockPresenter: PresenterProtocol {
    
    private weak var delegate: ViewControllerProtocol?
    
    required init(delegate: ViewControllerProtocol) {
        self.delegate = delegate
    }
    
    var hasAlertBeenPresented: Bool = false
    var alertPresentedCount:Int = 0
    
    func showAlert() {
        hasAlertBeenPresented = true
        alertPresentedCount += 1
        self.delegate?.showAlert()
    }
    
    
}
