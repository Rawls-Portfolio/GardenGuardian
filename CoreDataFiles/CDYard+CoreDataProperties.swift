//
//  CDYard+CoreDataProperties.swift
//  GardenGuardian
//
//  Created by RAWLS, JENNIFER AMANDA [AG/1000] on 5/16/18.
//  Copyright © 2018 RAWLS, JENNIFER AMANDA [AG/1000]. All rights reserved.
//
//

import Foundation
import CoreData


extension CDYard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDYard> {
        return NSFetchRequest<CDYard>(entityName: "CDYard")
    }

    @NSManaged public var location: String
    @NSManaged public var beds: Set<CDBed>

}

// MARK: Generated accessors for beds
extension CDYard {

    @objc(addBedsObject:)
    @NSManaged public func addToBeds(_ value: CDBed)

    @objc(removeBedsObject:)
    @NSManaged public func removeFromBeds(_ value: CDBed)

    @objc(addBeds:)
    @NSManaged public func addToBeds(_ values: Set<CDBed>)

    @objc(removeBeds:)
    @NSManaged public func removeFromBeds(_ values: Set<CDBed>)

}
