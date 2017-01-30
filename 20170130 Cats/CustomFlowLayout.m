//
//  CustomFlowLayout.m
//  20170130 Cats
//
//  Created by Minhung Ling on 2017-01-30.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "CustomFlowLayout.h"

@implementation CustomFlowLayout

- (void)prepareLayout {
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(20, 20);
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray <UICollectionViewLayoutAttributes *> *superAttrs = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrs = [[NSMutableArray alloc] init];
    for (UICollectionViewLayoutAttributes *superAttr in superAttrs) {
        UICollectionViewLayoutAttributes *attr = [superAttr copy];
        float test = [self.collectionView numberOfItemsInSection:attr.indexPath.section];
        float alpha = 1.0 - (attr.indexPath.item)/test;
        attr.alpha = alpha;
        CGFloat newX = 10*attr.indexPath.item*(cos(1.2*attr.indexPath.item))+self.collectionView.frame.size.width/2;
        CGFloat newY = 10*attr.indexPath.item*(sin(1.2*attr.indexPath.item))+self.collectionView.frame.size.height/2;
        //sin(attr.indexPath.item*0.25+1)*200+(self.collectionView.frame.size.height+30)/2;
        attr.center = CGPointMake(newX, newY);
        //        attr.size = CGSizeMake(attr.size.width, (1/attr.center.y)*100000);
        [newAttrs addObject:attr];
    }
    return newAttrs;
}

@end
