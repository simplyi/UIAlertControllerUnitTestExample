//
//  ViewController.swift
//  UIAlertControllerUnitTestExample
//
//  Created by Sergey Kargopolov on 2020-11-18.
//

import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var showAlertButton: UIButton!
    var presenter: PresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = Presenter(delegate: self)
    }

    @IBAction func showAlertButtonTapped(_ sender: Any) {
        presenter.showAlert()
    }
    
}

extension ViewController: ViewControllerProtocol {
   func showAlert() {
        // Create a new alert
        let dialogMessage = UIAlertController(title: "Attention", message: "I am an alert message", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)

        // Present alert to user
        self.present(dialogMessage, animated: true, completion: nil)
    }
}

