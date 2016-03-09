//
//  Status+CoreDataProperties.swift
//  TaskList
//
//  Created by Mobile6 on 3/8/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Status {

    @NSManaged var tipo: String?
    @NSManaged var tasks: NSSet?

}
