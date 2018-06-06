//
//  CDFlower+CoreDataProperties.swift
//  GardenGuardian
//
//  Created by RAWLS, JENNIFER AMANDA [AG/1000] on 5/16/18.
//  Copyright © 2018 RAWLS, JENNIFER AMANDA [AG/1000]. All rights reserved.
//
//

import Foundation
import CoreData


extension CDFlower {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFlower> {
        return NSFetchRequest<CDFlower>(entityName: "CDFlower")
    }

    @NSManaged public var name: String
    @NSManaged public var height: Int16
    @NSManaged public var width: Int16
    @NSManaged public var spacing: Int16
    @NSManaged public var hardiness: Int16
    @NSManaged public var water: Int16
    @NSManaged public var beds: Set<CDBed>

}

extension CDFlower {
    
    @objc(addBedsObject:)
    @NSManaged public func addToBeds(_ value: CDBed)
    
    @objc(removeBedsObject:)
    @NSManaged public func removeFromBeds(_ value: CDBed)
    
    @objc(addBeds:)
    @NSManaged public func addToBeds(_ values: Set<CDBed>)
    
    @objc(removeBeds:)
    @NSManaged public func removeFromBeds(_ values: Set<CDBed>)
    
}
