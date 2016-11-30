//
//  User+CoreDataProperties.swift
//  Air
//
//  Created by 吉良吉影 on 2016/11/30.
//  Copyright © 2016年 zero. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User");
    }

    @NSManaged public var userName: String?
    @NSManaged public var phone: String?
    @NSManaged public var birth: String?
    @NSManaged public var city: String?
    @NSManaged public var email: String?
    @NSManaged public var identify: String?
    @NSManaged public var image: Data?
    @NSManaged public var gender: String?
    
    static let ApplicationSupportDirectory = FileManager().urls(for: .applicationSupportDirectory,
                                                                in: .userDomainMask).first!
    static let StoreURL = ApplicationSupportDirectory.appendingPathComponent("Air.sqlite")

}
