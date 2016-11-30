//
//  AppDelegate.swift
//  Air
//
//  Created by zero on 2016/11/26.
//  Copyright © 2016年 zero. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UINavigationBar.appearance().barTintColor = UIColor(red: 17/255.0, green: 117/255.0, blue: 119/255.0, alpha: 1.0)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Air")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func fetchContextForHouse()->[House]?
    {
        var fetchList :[House]? = nil
        do{
            fetchList = try persistentContainer.viewContext.fetch(House.fetchRequest()) as? [House]
        }catch{
            print("Failed to fetch House")
        }
        
        return fetchList
    }
    
    func addToContextForHouse(bed:String?,city:String?,equipment:String?,guest:String?,houseName:String?,image:UIImage?,introduction:String?,location:String?,owner:String?,price:String?,room:String?,toilet:String?,type:String?)->House{
        let house = House(context: persistentContainer.viewContext)
        house.bed = bed
        house.city = city
        house.equipment = equipment
        house.guest  = guest
        house.houseName = houseName
        if let photo = image{
        house.image = UIImagePNGRepresentation(photo)
        }
        house.introduction = introduction
        house.location = location
        house.owner = owner
        house.price = price
        house.room = room
        house.toilet = toilet
        house.type = type
        
        print("Saving to House")
        
        saveContext()
        return house
    }
    
    

    
    func fetchContextForComment()->[Comment]?
    {
        var fetchList :[Comment]? = nil
        do{
            fetchList = try persistentContainer.viewContext.fetch(Comment.fetchRequest()) as? [Comment]
        }catch{
            print("Failed to fetch Comment")
        }
        
        return fetchList
    }
    
    func addToContextForComment(houseName:String?,userName:String?,userImage:UIImage?,content:String?)->Comment
    {
        let comment = Comment(context:persistentContainer.viewContext)
        comment.houseName = houseName
        comment.userName = userName
        comment.content = content
        if let photo = userImage{
            comment.userImage = UIImagePNGRepresentation(photo)
        }
        
        
        print("saving to Comment")
        saveContext()
        return comment
    }
    
    func fetchContextForTravel()->[Travel]?
    {
        var fetchList :[Travel]? = nil
        do{
            fetchList = try persistentContainer.viewContext.fetch(Travel.fetchRequest()) as? [Travel]
        }catch{
            print("Failed to fetch Travel")
        }
        
        return fetchList
    }
    
    
    func addToContextForTravel(time:String?,houseName:String?)->Travel{
        let travel = Travel(context: persistentContainer.viewContext)
        travel.time = time
        travel.houseName = houseName
        
        print("saving to Travel")
        
        saveContext()
        
        return travel
    }
    
    func addToContextForCollect(houseName:String?)->CollectHouse{
        let collectHouse = CollectHouse(context: persistentContainer.viewContext)
        collectHouse.houseName =  houseName
        
        print("Saving to CollectHouse")
        
        saveContext()
        return collectHouse
    }
    
    func fetchContextForCollectHouse()->[CollectHouse]?{
        var fetchList :[CollectHouse]? = nil
        do{
            fetchList = try persistentContainer.viewContext.fetch(CollectHouse.fetchRequest()) as? [CollectHouse]
        }catch{
            print("Failed to fetch CollectHouse")
        }
        
        return fetchList
    }
    
    func deleteFromContextForCollectHouse(collectHouse:CollectHouse){
        persistentContainer.viewContext.delete(collectHouse)
        print("deleting from collectHouse")
        saveContext()
    }
    
    
    func fetchContextForUser()->[User]?{
        var fetchList :[User]? = nil
        do{
            fetchList = try persistentContainer.viewContext.fetch(User.fetchRequest()) as? [User]
        }catch{
            print("Failed to fetch User")
        }
        
        return fetchList
    }
    
    func updateToContextForUser(user:User,userName:String?,phone:String?,birth:String?,city:String?,email:String?,identity:String?,image:UIImage?,gender:String?){
        user.userName = userName
        user.phone = phone
        user.birth = birth
        user.city = city
        user.email = email
        user.identify = identity
        if let photo = image{
        user.image = UIImagePNGRepresentation(photo)
        }
        user.gender = gender
        print("updating the user")
        saveContext()
    }
    
    
    func addToContextForUser(userName:String?,phone:String?,birth:String?,city:String?,email:String?,identity:String?,image:UIImage?,gender:String?)->User{
        let user = User(context: persistentContainer.viewContext)
        user.userName = userName
        user.phone = phone
        user.birth = birth
        user.city = city
        user.email = email
        user.identify = identity
        if let photo = image{
            user.image = UIImagePNGRepresentation(photo)
        }
        user.gender = gender

        print("saving to User")
        
        saveContext()
        
        return user
    }
    
    
    

}

