//
//  CDBed+CoreDataProperties.swift
//  GardenGuardian
//
//  Created by RAWLS, JENNIFER AMANDA [AG/1000] on 5/16/18.
//  Copyright © 2018 RAWLS, JENNIFER AMANDA [AG/1000]. All rights reserved.
//
//

import Foundation
import CoreData


extension CDBed {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDBed> {
        return NSFetchRequest<CDBed>(entityName: "CDBed")
    }

    @NSManaged public var id: UUID
    @NSManaged public var depth: Int16
    @NSManaged public var length: Int16
    @NSManaged public var yard: CDYard
    @NSManaged public var flowers: Set<CDFlower>?

}

// MARK: Generated accessors for flowers
extension CDBed {

    @objc(addFlowersObject:)
    @NSManaged public func addToFlowers(_ value: CDFlower)

    @objc(removeFlowersObject:)
    @NSManaged public func removeFromFlowers(_ value: CDFlower)

    @objc(addFlowers:)
    @NSManaged public func addToFlowers(_ values: Set<CDFlower>)

    @objc(removeFlowers:)
    @NSManaged public func removeFromFlowers(_ values: Set<CDFlower>)

}
