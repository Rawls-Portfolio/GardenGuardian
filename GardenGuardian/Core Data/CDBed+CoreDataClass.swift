//
//  CDBed+CoreDataClass.swift
//  GardenGuardian
//
//  Created by RAWLS, JENNIFER AMANDA [AG/1000] on 5/16/18.
//  Copyright © 2018 RAWLS, JENNIFER AMANDA [AG/1000]. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CDBed)
public class CDBed: NSManagedObject {

}

extension CDBed {
    
    @nonobjc static func new(in context: NSManagedObjectContext) -> CDBed {
        let entityDescription = NSEntityDescription.entity(forEntityName: "CDBed", in: context)!
        return CDBed(entity: entityDescription, insertInto: context)
    }
    
    @nonobjc static func fetch(with desc: String, in context: NSManagedObjectContext) -> CDBed? {
        let fetchRequest: NSFetchRequest<CDBed> = CDBed.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "desc == [cd] %@", desc)
        guard let results = try? context.fetch(fetchRequest) else { return nil }
        return results.first
    }
    
}

extension CDBed {
    
    func convert() -> Bed? {
//        let flowers = self.flowers?.compactMap { $0.convert() }

        return Bed(
            desc: self.desc,
            depth: Int(self.depth),
            length: Int(self.length)
//            flowers: flowers ?? []
        )
    }
    
    func populate(with object: Bed) {
        self.desc = object.desc
        self.depth = Int16(object.depth)
        self.length = Int16(object.length)
        
        // assign flowers in Persistence
    }
    
}
