//
//  CollectionViewFlowLayout.swift
//  HorizontalScrollViewExample
//
//  Created by Yuji Ogihara on 2019/05/06.
//  Copyright © 2019年 Yuji Ogihara. All rights reserved.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                      withScrollingVelocity velocity: CGPoint) -> CGPoint
    {
        var offsetAdjustment = MAXFLOAT;
        let horizontalOffset = proposedContentOffset.x + (self.collectionView!.bounds.size.width - self.itemSize.width) / 2.0
        let targetRect = CGRect(
            x:proposedContentOffset.x,
            y:0,
            width:self.collectionView!.bounds.size.width,
            height:self.collectionView!.bounds.size.height)
        
        let array = super.layoutAttributesForElements(in: targetRect)
        
        for layoutAttributes in array! {
            let itemOffset = layoutAttributes.frame.origin.x;
            if (fabsf(Float(itemOffset - horizontalOffset)) < fabsf(offsetAdjustment)) {
                offsetAdjustment = Float(itemOffset - horizontalOffset)
            }
        }
        
        let offsetX = Float(proposedContentOffset.x) + offsetAdjustment
        return CGPoint(
            x:CGFloat(offsetX),
            y:proposedContentOffset.y)
    }
}
