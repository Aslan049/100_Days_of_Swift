//
//  DetailViewController.swift
//  Milestone1_3
//
//  Created by Aslan Korkmaz on 24.03.2025.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedFlag: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedFlag = selectedFlag {
            imageView.image = UIImage(named: selectedFlag)
        }
       
        title = selectedFlag?.uppercased().split(separator: "@").map(String.init).first
        navigationItem.largeTitleDisplayMode = .never
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
    }
    
    @objc func shareButtonTapped() {
        guard let image = imageView.image else { return }
        
        guard let selectedFlagName = selectedFlag else { return }
        
        let activityViewController = UIActivityViewController(activityItems: [image, selectedFlagName], applicationActivities: nil)
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityViewController, animated: true)
    }

    
    

}
