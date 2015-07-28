//
//  ViewController.swift
//  Scratch
//
//  Created by apple on 15/4/22.
//  Copyright (c) 2015年 iCumpus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    var loggedInUser: User? { didSet { updateUI() } }
    var secure: Bool = false { didSet { updateUI() } }
    
    private func updateUI(){
        passwordField.secureTextEntry = secure
        passwordLabel.text = secure ? "Secured Password" : "Password"
    }

    @IBAction func login(sender: AnyObject) {
        loggedInUser = User.login(loginField.text ?? "", password: passwordField.text ?? "")
    }
    
    @IBAction func toggleScurity(sender: AnyObject) {
        secure = !secure
    }
}

