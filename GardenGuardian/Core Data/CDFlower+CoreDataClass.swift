//
//  CDFlower+CoreDataClass.swift
//  GardenGuardian
//
//  Created by RAWLS, JENNIFER AMANDA [AG/1000] on 5/16/18.
//  Copyright © 2018 RAWLS, JENNIFER AMANDA [AG/1000]. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CDFlower)
public class CDFlower: NSManagedObject {

}

extension CDFlower {
    
    @nonobjc static func new(in context: NSManagedObjectContext) -> CDFlower {
        let entityDescription = NSEntityDescription.entity(forEntityName: "CDFlower", in: context)!
        return CDFlower(entity: entityDescription, insertInto: context)
    }
    
    @nonobjc static func fetch(withId id: String, in context: NSManagedObjectContext) -> CDFlower? {
        let fetchRequest: NSFetchRequest<CDFlower> = CDFlower.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == [cd] %@", id)
        guard let results = try? context.fetch(fetchRequest) else { return nil }
        return results.first
    }
}

extension CDFlower {
    
    func convert() -> Flower? {
        let beds = self.beds.compactMap { $0.convert() }
        return Flower(
            height: Int(self.height),
            width: Int(self.width),
            spacing: Int(self.spacing),
            hardiness: Int(self.hardiness),
            water: Int(self.water),
            beds: beds)
    }
    
    func populate(with object: Flower) {
        self.height = Int16(object.height)
        self.width = Int16(object.width)
        self.spacing = Int16(object.spacing)
        self.hardiness = Int16(object.hardiness)
        self.water = Int16(object.water)
        
        //assign beds at creation point, not here.
        
        
    }
    
}
