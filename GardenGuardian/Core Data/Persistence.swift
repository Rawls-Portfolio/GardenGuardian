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
    
    func flower(with id: UUID) -> Flower? {
        return CDFlower.fetch(withId: id, in: managedContext)?.convert()
    }
    
    
    func save(yard: Yard) -> CDYard {
        guard let cdYard = CDYard.fetch(withId: yard.id, in: managedContext) else {
            let newYard = CDYard.new(in: managedContext)
            newYard.populate(with: yard)
            
//            newYard.beds = Set(yard.beds.map { bed in
//                let cdBed = save(bed: bed)
//
//                cdBed.yard = save(yard: bed.yard)
//
//                return cdBed
//            })
            
            do {
                try managedContext.save()
            } catch let error {
                print("Error saving yard: \(error)")
            }
            
            return newYard
        }
        
        return cdYard
    }
    
    func save(bed: Bed) -> CDBed {
        guard let cdBed = CDBed.fetch(withId: bed.id, in: managedContext) else {
            let newBed = CDBed.new(in: managedContext)
            newBed.populate(with: bed)
            
            newBed.flowers = Set(bed.flowers.map { flower in
                let cdFlower = save(flower: flower, in: bed)
            
                return cdFlower
            })
            do {
                try managedContext.save()
            } catch let error {
                print("Error saving bed: \(error)")
            }
        
            return newBed
        }
        
        return cdBed
    }
    
    func save(flower: Flower, in bed: Bed) -> CDFlower {
        let cdFlower = CDFlower.fetch(withId: flower.id, in: managedContext) ?? CDFlower.new(in: managedContext)
        cdFlower.populate(with: flower)
        
//        if !cdFlower.beds.contains(bed) {
//            let newBed = Set(save(bed: bed))
//            cdFlower.beds = cdFlower.beds.union(newBed)
//        }
  
        do {
            try managedContext.save()
        } catch let error {
            print("Error saving flower: \(error)")
        }
        
        return cdFlower
    }
}

