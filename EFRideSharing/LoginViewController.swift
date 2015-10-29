//
//  LoginViewController.swift
//  
//
//  Created by Ilia Tikhomirov on 20/09/15.
//
//

import UIKit
import Firebase
import FirebaseUI
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    
    let ref = Firebase(url: "https://efride.firebaseio.com")
    let facebookLogin = FBSDKLoginManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func loginWithFacebookDidTouch(sender: UIButton) {
        
    print("login button did touch")
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self, handler: {
            (facebookResult, facebookError) -> Void in
            if facebookError != nil {
                print("Facebook login failed. Error \(facebookError)")
            } else if facebookResult.isCancelled {
                print("Facebook login was cancelled.")
            } else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                self.ref.authWithOAuthProvider("facebook", token: accessToken,
                    withCompletionBlock: { error, authData in
                        if error != nil {
                            print("Login failed. \(error)")
                        } else {
                            print("Logged in! \(authData.providerData)")
                            // perform segue with identifier
                            self.performSegueWithIdentifier("loginSuccess", sender: self)
                        }
                })
            }
        })

        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
