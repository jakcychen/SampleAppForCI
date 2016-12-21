//
//  SAFSignInViewController.swift
//  SampleAppForCI
//
//  Created by JackyChen on 2016/12/19.
//  Copyright © 2016年 JackyChen. All rights reserved.
//

import UIKit

class SAFSignInViewController: UIViewController {
    
    let userDefault = UserDefaults.standard
    
    @IBAction func toogleSignIn(_ sender: Any)
    {
        userDefault.set(true, forKey: "isSignIn")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
