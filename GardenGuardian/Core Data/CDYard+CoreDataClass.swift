//
//  CDYard+CoreDataClass.swift
//  GardenGuardian
//
//  Created by RAWLS, JENNIFER AMANDA [AG/1000] on 5/16/18.
//  Copyright © 2018 RAWLS, JENNIFER AMANDA [AG/1000]. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CDYard)
public class CDYard: NSManagedObject {

}

extension CDYard {
    
    @nonobjc static func new(in context: NSManagedObjectContext) -> CDYard {
        let entityDescription = NSEntityDescription.entity(forEntityName: "CDYard", in: context)!
        return CDYard(entity: entityDescription, insertInto: context)
    }
    
    @nonobjc static func fetch(with desc: String, in context: NSManagedObjectContext) -> CDYard? {
        let fetchRequest: NSFetchRequest<CDYard> = CDYard.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "desc == [cd] %@", desc)
        guard let results = try? context.fetch(fetchRequest) else { return nil }
        return results.first
    }
}

extension CDYard {
    
    func convert() -> Yard? {
        return Yard(
            desc: self.desc,
            location: self.location
        )
    }
    
    func populate(with object: Yard) {
        self.desc = object.desc
        self.location = object.location
        
        //assign beds in Persistence
    }
}
