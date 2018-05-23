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
    
    @nonobjc static func fetch(withId id: String, in context: NSManagedObjectContext) -> CDYard? {
        let fetchRequest: NSFetchRequest<CDYard> = CDYard.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == [cd] %@", id)
        guard let results = try? context.fetch(fetchRequest) else { return nil }
        return results.first
    }
}

extension CDYard {
    
    func convert() -> Yard? {
        let beds = self.beds.compactMap { $0.convert() }
        return Yard(location: self.location, beds: beds)
    }
    
    func populate(with object: Yard) {
        self.location = object.location
    }
    
}
