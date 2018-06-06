import UIKit
import CoreData
import Foundation


class Persistence {
    // MARK: - Context
    lazy var managedContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
    
        return managedContext
    }()
    
    func saveContext(){
        do {
            try managedContext.save()
        } catch let error {
            print("""
                Error saving: \(error).
                \n Inserted objects: \(managedContext.insertedObjects).
                \n Deleted objects: \(managedContext.deletedObjects).
            """)
        }
    }

    // MARK: - Flower
    func flower(with name: String) -> Flower? {
        return CDFlower.fetch(with: name, in: managedContext)?.convert()
    }
    
    func save(flower: Flower) -> CDFlower {
        let cdFlower = CDFlower.fetch(with: flower.name, in: managedContext) ?? CDFlower.new(in: managedContext)
        cdFlower.populate(with: flower)
        saveContext()
        return cdFlower
    }
    
    // MARK: - Bed
    func bed(with desc: String) -> Bed? {
        return CDBed.fetch(with: desc, in: managedContext)?.convert()
    }
    
    func save(bed: Bed) -> CDBed {
        let cdBed = CDBed.fetch(with: bed.desc, in: managedContext) ?? CDBed.new(in: managedContext)
        cdBed.populate(with: bed)
            

        saveContext()
        return cdBed
    }
    
    // MARK: - Yard
    func yard(with desc: String) -> Yard? {
        return CDYard.fetch(with: desc, in: managedContext)?.convert()
    }
    

    func save(yard: Yard) -> CDYard? {
        let cdYard = CDYard.fetch(with: yard.desc, in: managedContext) ?? CDYard.new(in: managedContext)
        
        cdYard.populate(with: yard)
        saveContext()
        return cdYard 
    }
    
    func save(garden: Garden) -> (CDYard?, CDBed?, Set<CDFlower>?) {
        let cdYard = save(yard: garden.yard)
        let cdBed = save(bed: garden.bed)
        cdYard?.addToBeds(cdBed)
        let cdFlowers = Set(garden.flowers.map { flower -> CDFlower in
            let cdFlower = save(flower: flower)
            return cdFlower
        })
        cdBed.addToFlowers(cdFlowers)
     
        return(cdYard, cdBed, cdFlowers)
    }
}
