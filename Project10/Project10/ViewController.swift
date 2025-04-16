//
//  ViewController.swift
//  Project10
//
//  Created by Aslan Korkmaz on 16.04.2025.
//

import UIKit

class ViewController: UICollectionViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCellCollectionViewCell else {
            fatalError("Unable to dequeue PersonCell.")
            
        }
        return cell
    }

}

