//
//  ViewControllerMock.swift
//  UIAlertControllerUnitTestExampleTests
//
//  Created by Sergey Kargopolov on 2020-11-18.
//

import Foundation
@testable import UIAlertControllerUnitTestExample

class MockPresenter: PresenterProtocol {
    var hasAlertBeenPresented: Bool = false
    var alertPresentedCount:Int = 0
    
    func showAlert() {
        hasAlertBeenPresented = true
        alertPresentedCount += 1
    }
    
    
}
