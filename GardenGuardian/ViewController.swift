//
//  ViewController.swift
//  GardenGuardian
//
//  Created by RAWLS, JENNIFER AMANDA [AG/1000] on 5/16/18.
//  Copyright © 2018 RAWLS, JENNIFER AMANDA [AG/1000]. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let persistenceLayer = Persistence()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let flower = Flower(name: "Coral Bells 'Palace Purple'", height: 20, width: 12, spacing: 12, hardiness: -30, water: 1)
//        let cdFlower = persistenceLayer.save(flower: flower)
//        print("flower: \(flower)")
//        print("cdFlower: \(cdFlower)")
        
        guard let fetchedFlower = persistenceLayer.flower(with: "Coral Bells 'Palace Purple'") else {
            print("unable to retrieve flower")
            return
        }
        print(fetchedFlower)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

