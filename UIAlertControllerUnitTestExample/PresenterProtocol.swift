//
//  Alertable.swift
//  UIAlertControllerUnitTestExample
//
//  Created by Sergey Kargopolov on 2020-11-18.
//

protocol PresenterProtocol: AnyObject{
    init(delegate: ViewControllerProtocol)
    func showAlert()
}
