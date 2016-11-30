//
//  House+CoreDataProperties.swift
//  Air
//
//  Created by 吉良吉影 on 2016/11/30.
//  Copyright © 2016年 zero. All rights reserved.
//

import Foundation
import CoreData


extension House {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<House> {
        return NSFetchRequest<House>(entityName: "House");
    }

    @NSManaged public var houseName: String?
    @NSManaged public var image: Data?
    @NSManaged public var owner: String?
    @NSManaged public var type: String?
    @NSManaged public var price: String?
    @NSManaged public var equipment: String?
    @NSManaged public var guest: String?
    @NSManaged public var room: String?
    @NSManaged public var bed: String?
    @NSManaged public var toilet: String?
    @NSManaged public var introduction: String?
    @NSManaged public var location: String?
    @NSManaged public var city: String?

}
