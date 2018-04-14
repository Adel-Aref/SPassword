//
//  SiteCell.swift
//  SPassord
//
//  Created by Have a Mission on 4/9/18.
//  Copyright © 2018 Have a Mission. All rights reserved.
//

import UIKit
class SiteCell: UITableViewCell {
    @IBOutlet weak var laSitePassword: UILabel!
    @IBOutlet weak var laSiteUsername: UILabel!
    @IBOutlet weak var laSiteName: UILabel!
    /// func configure cell in tableView
    func configureCell(site :Site)
    {
        self.laSiteName.text = site.siteName
        self.laSiteUsername.text = site.siteUser
        self.laSitePassword.text = site.sitePassword
    }
// End of the class
}
