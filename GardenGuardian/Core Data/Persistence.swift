import UIKit
import CoreData
import Foundation


class Persistence {
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
    
    func flower(with name: String) -> Flower? {
        return CDFlower.fetch(with: name, in: managedContext)?.convert()
    }
    
    func save(flower: Flower, in bed: Bed) -> CDFlower {
        let cdFlower = CDFlower.fetch(with: flower.name, in: managedContext) ?? CDFlower.new(in: managedContext)
        cdFlower.populate(with: flower)
        saveContext()
        return cdFlower
    }
    
    func bed(with desc: String) -> Bed? {
        return CDBed.fetch(with: desc, in: managedContext)?.convert()
    }
    
    func save(bed: Bed) -> CDBed {
        let cdBed = CDBed.fetch(with: bed.desc, in: managedContext) ?? CDBed.new(in: managedContext)
        cdBed.populate(with: bed)
            

        saveContext()
        return cdBed
    }
    
    func yard(with desc: String) -> Yard? {
        return CDYard.fetch(with: desc, in: managedContext)?.convert()
    }
    

    func save(yard: Yard) -> CDYard? {
        let cdYard = CDYard.fetch(with: yard.desc, in: managedContext) ?? CDYard.new(in: managedContext)
        
        cdYard.populate(with: yard)
        saveContext()
        return cdYard 
    }
}

//            newBed.flowers = Set(bed.flowers.map { flower in
//                let cdFlower = save(flower: flower, in: bed)
//
//                return cdFlower
//            })
