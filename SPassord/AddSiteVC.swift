//
//  AddSiteVC.swift
//  SPassord
//
//  Created by Have a Mission on 4/3/18.
//  Copyright © 2018 Have a Mission. All rights reserved.
//

import UIKit

class AddSiteVC: UIViewController {

    @IBOutlet weak var txtSiteName: UITextField!
    @IBOutlet weak var txtSiteUserName: UITextField!
    @IBOutlet weak var txtSitePassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addSiteData(_ sender: Any) {
     let paremters = [
            "SiteName":txtSiteName.text ?? "" ,
            "SiteUsername":txtSiteUserName.text ?? "",
            "SitePassword": txtSitePassword.text ?? ""
        ]
        
        print( CoreDataHandler.saveData(paremeters: paremters,entityName: "Site"))
//        // to goto the second vc
      // print( CoreDataHandler.secondWayToSave(siteName: txtSiteName.text ?? "", SiteUser: txtSiteUserName.text ?? "", SitePassword: txtSitePassword.text ?? ""))
        let thirdVC = storyboard?.instantiateViewController(withIdentifier: "ShowSitesListVC") as! ShowSitesListVC
        navigationController?.pushViewController(thirdVC, animated: true)
    }
///End
}
