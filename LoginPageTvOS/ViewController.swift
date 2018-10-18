//
//  ViewController.swift
//  LoginPageTvOS
//
//  Created by Vibhuti on 17/10/18.
//  Copyright © 2018 Vibhuti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!

    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginBtnClick(_ sender: Any) {
        
        let result = validate(username: userName.text!)
        switch result {
        case .failure(let error):
            self.showAlert(status: error.localizedDescription, title: "This is Failure Alert!")
            //error
            return
        case .success(_):
            self.showAlert(status:"Success", title: "This is Alert!")
            break
            
        }
        
    }

    
    func showAlert(status: String, title:String) { // 1
        
        let alertView = UIAlertController(title: title, message: status, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertView.addAction(okAction)
        
        self.present(alertView, animated: true, completion: {
            let alertButton = okAction.value(forKey: "__representer")
            let view = alertButton as? UIView
            view?.isAccessibilityElement = true
            view?.accessibilityLabel = "label_accesibilty"
        })
        
      //  print(alertView.accessibilityLabel!)

    }
    
    enum ValidationFormError: LocalizedError {
        case invalidnameLength
        
        
        var errorDescription: String? {
            var errorString:String? = nil
            switch self {
            case .invalidnameLength:
                errorString = "Your name should have atleast 2 and atmost 10 characters"
                
            }
            
            return errorString
        }
    }
    
    
    public enum Result<T> {
        case success(T)
        case failure(Error)
        
        func resolve() throws -> T {
            switch self {
            case .success(let T):
                return T
            case .failure(let error):
                throw error
            }
        }
    }
    
    
    func validate(username: String) -> Result<Bool> {
        
        guard !username.isEmpty else{
            return Result.failure(ValidationFormError.invalidnameLength)
        }
        
        guard username.count >= 2 && username.count <= 10 else {
            return Result.failure(ValidationFormError.invalidnameLength)
        }
    
        
        return .success(true)
    }
    

}
