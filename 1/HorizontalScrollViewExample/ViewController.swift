//
//  ViewController.swift
//  HorizontalScrollViewExample
//
//  Created by Yuji Ogihara on 2019/05/06.
//  Copyright © 2019年 Yuji Ogihara. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
 
    // Huge Value for infinite loop
    let PageCount = 2000

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenSize = UIScreen.main.bounds
        
        let collectionViewFlowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        collectionViewFlowLayout.itemSize =
            CGSize(width:screenSize.width / 1.5,
                   height:screenSize.height / 1.5)
        
        collectionViewFlowLayout.minimumInteritemSpacing = 0.0
        collectionViewFlowLayout.minimumLineSpacing = 10.0
        
        let screenshotsSectionInset = screenSize.width / 6.0
        collectionViewFlowLayout.sectionInset =
            UIEdgeInsets(top: 0.0, left: screenshotsSectionInset,
                         bottom: 0.0, right: screenshotsSectionInset)

        collectionView.selectItem(at: [0,2], animated: false, scrollPosition: .centeredHorizontally)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        
        print(indexPath)
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScreenshotCell", for: indexPath as IndexPath)
        
        let hue = CGFloat(indexPath.item) / 20 // CGFloat(POMAppCount)
        cell.backgroundColor = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
        
        return cell
    }
}

