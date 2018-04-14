//
//  ViewController.swift
//  SPassord
//
//  Created by Have a Mission on 4/3/18.
//  Copyright © 2018 Have a Mission. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var BtnCreateAccount: UIButton!
    @IBOutlet weak var BtnLogIn: UIStackView!
    @IBOutlet weak var txtUserNAme: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
    @IBOutlet weak var BtnSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BtnLogIn.layer.cornerRadius = 10
        BtnCreateAccount.layer.cornerRadius = 6
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func BtnSaveRegist(_ sender: Any) {
        if  let usersArray = CoreDataHandler.getData(){
            for item in usersArray{
                if txtUserNAme.text == item.username && txtPassword.text == item.password && !(txtUserNAme.text?.isEmpty)!  && !(txtPassword.text?.isEmpty)!  {
                    let secondVC = storyboard?.instantiateViewController(withIdentifier: "ShowSitesListVC") as! ShowSitesListVC
                    navigationController?.pushViewController(secondVC, animated: true)
                }
            }
        }
    }
    @IBAction func BtnCreateAccount(_ sender: Any) {
            txtUserName.isHidden = false
            txtUserPassword.isHidden = false
            BtnSave.isHidden = false
        
    }
    @IBAction func saveUserAccount(_ sender: Any) {
        if !(txtUserName.text?.isEmpty)!  && ((txtUserName.text?.characters.count)! >= 8) && !(txtUserPassword.text?.isEmpty)! && ((txtUserPassword.text?.characters.count)! >= 8)
        {
            let paremters = [
            "Username":txtUserName.text ?? "" ,
            "Password":txtUserPassword.text ?? ""
        ]
        print( CoreDataHandler.saveData(paremeters: paremters,entityName: "User"))
        // to goto the second vc
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "AddSiteVC") as! AddSiteVC
        navigationController?.pushViewController(secondVC, animated: true)
        }
        else {
            let  alert = UIAlertController(title:"SPassword",message:"username and password should be 8 chars or more ", preferredStyle:UIAlertControllerStyle.alert)
            present(alert , animated: true ,completion:nil)
        }
    }
    // end of the controlleview
}
    
