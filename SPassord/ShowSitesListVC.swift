//
//  ShowSitesListVC.swift
//  SPassord
//
//  Created by Have a Mission on 4/3/18.
//  Copyright © 2018 Have a Mission. All rights reserved.
//

import UIKit

class ShowSitesListVC: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var sites : [Site] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        sites = CoreDataHandler.fetch() ?? []
        print("the count is")
        print(sites.count)
        print(sites[20].siteName)
        
        
        //////
    }    /// view will apear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    //////
    @IBAction func addSiteData(_ sender: Any) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "AddSiteVC") as! AddSiteVC
        navigationController?.pushViewController(secondVC, animated: true)
    }
    // the tableView part
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sites.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "siteCell") as?SiteCell else {
            return UITableViewCell()}
        let sitee = sites[indexPath.row]
        cell.configureCell(site: sitee)
        return cell
    }
    //End
}
