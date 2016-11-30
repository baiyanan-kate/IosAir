//
//  CollectHouse+CoreDataProperties.swift
//  Air
//
//  Created by 吉良吉影 on 2016/11/30.
//  Copyright © 2016年 zero. All rights reserved.
//

import Foundation
import CoreData


extension CollectHouse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CollectHouse> {
        return NSFetchRequest<CollectHouse>(entityName: "CollectHouse");
    }

    @NSManaged public var houseName: String?

}
