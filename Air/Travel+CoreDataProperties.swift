//
//  Travel+CoreDataProperties.swift
//  Air
//
//  Created by 吉良吉影 on 2016/11/30.
//  Copyright © 2016年 zero. All rights reserved.
//

import Foundation
import CoreData


extension Travel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Travel> {
        return NSFetchRequest<Travel>(entityName: "Travel");
    }

    @NSManaged public var time: String?
    @NSManaged public var houseName: String?
    
    static let ApplicationSupportDirectory = FileManager().urls(for: .applicationSupportDirectory,
                                                                in: .userDomainMask).first!
    static let StoreURL = ApplicationSupportDirectory.appendingPathComponent("Air.sqlite")

}
