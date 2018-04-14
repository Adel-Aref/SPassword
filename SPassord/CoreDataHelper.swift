//
//  CoreDataHelper.swift
//  SPassord
//
//  Created by Have a Mission on 4/3/18.
//  Copyright © 2018 Have a Mission. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHandler: NSObject
{
    // in this method to return the viewContext that is object from NSMAngeOblectContext to deal with data save , retrieve and so on
    fileprivate class   func getAppDelegateObj() -> NSManagedObjectContext{
        let appDelegateObject = UIApplication.shared.delegate as! AppDelegate // obj from Appdelegate to access persistentContainer method
        return appDelegateObject.persistentContainer.viewContext
    }
    class  func saveData(paremeters:[String:String],entityName:String) -> Bool
    {        // method to save data

        let context = getAppDelegateObj()
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        let mangedObj = NSManagedObject(entity:entity! , insertInto: context)
        if entityName == "User"{
mangedObj.setValue(paremeters["Username"], forKey:"username")
            mangedObj.setValue(paremeters["Password"]! , forKey:"password")}
        ///// this insert for site table
        if entityName == "Site" {
         mangedObj.setValue(Int(paremeters["SiteName"]!) , forKey:"siteName")
    mangedObj.setValue(Int(paremeters["SiteUsername"]!) , forKey:"siteUser")
            mangedObj.setValue(Int(paremeters["SitePassword"]!) , forKey:"sitePassword")}
        ///
        do {
            try context.save()
            return true
        }
        catch
        {
            print("Error")
            return false
        }
        // method to get data
    }
    class func getData() -> [User]?
    {
        let context = getAppDelegateObj()
        var arrayOfUsers :[User]?
        do{
            arrayOfUsers =  try context.fetch(User.fetchRequest())
            return arrayOfUsers
        }
        catch
        {
            return arrayOfUsers
        }
    }
///
    class func fetch() -> [Site]?
    {
        let context = getAppDelegateObj()
        var arrayOfSites :[Site]?
        let fetchRequest = NSFetchRequest<Site>(entityName: "Site")
        do {
            arrayOfSites = try context.fetch(fetchRequest)
            return arrayOfSites
            print("secessfully fetched data .")
        }
        catch{
            debugPrint("couldn't fetch data \(error.localizedDescription)")
            return arrayOfSites
        }
    }
    ///////
    class func secondWayToSave(siteName:String,SiteUser:String,SitePassword:String)
    {
        let mangedContext = getAppDelegateObj()
        let site = Site(context: mangedContext)
        site.siteName = siteName
        site.siteUser = SiteUser
        site.sitePassword = SitePassword
        
        do{
            try mangedContext.save()
            print("sucessfully sava data")
        }
        catch{
            debugPrint("debuge error \(error.localizedDescription)")
        }
    }////////////
    // end of the class
}

