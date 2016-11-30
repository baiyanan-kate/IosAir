//
//  Comment+CoreDataProperties.swift
//  Air
//
//  Created by 吉良吉影 on 2016/11/30.
//  Copyright © 2016年 zero. All rights reserved.
//

import Foundation
import CoreData


extension Comment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comment> {
        return NSFetchRequest<Comment>(entityName: "Comment");
    }

    @NSManaged public var houseName: String?
    @NSManaged public var userName: String?
    @NSManaged public var userImage: Data?
    @NSManaged public var content: String?

}
