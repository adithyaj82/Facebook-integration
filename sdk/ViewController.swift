//
//  ViewController.swift
//  sdk
//
//  Created by apple on 4/25/18.
//  Copyright © 2018 BRN. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class ViewController: UIViewController,FBSDKLoginButtonDelegate {

    @IBOutlet var lblStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let BtnFblogin = FBSDKLoginButton()
        BtnFblogin.readPermissions = ["public_profile","email"]
        BtnFblogin.delegate = self
        BtnFblogin.center = self.view.center
        self.view.addSubview(BtnFblogin)
        if FBSDKAccessToken.current() != nil
        {
            self.lblStatus.text = "logged in"

        }else{
            self.lblStatus.text = "not logged in"

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            self.lblStatus.text = error.localizedDescription

            
        }else if result.isCancelled{
            self.lblStatus.text = "user cancelled login"

            
        }else{
            self.lblStatus.text = "user  logged in"

        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        self.lblStatus.text = "user logged out"
    }
}

