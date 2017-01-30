//
//  CatCell.m
//  20170130 Cats
//
//  Created by Minhung Ling on 2017-01-30.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "CatCell.h"
#import "PhotoObject.h"

@interface CatCell ()

@property (weak, nonatomic) IBOutlet UILabel *catTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *catImageView;


@end

@implementation CatCell
- (void)setPhotoObject:(PhotoObject *)photoObject {
    _photoObject = photoObject;
    self.catTitleLabel.text = photoObject.title;
    self.catImageView.image = photoObject.catImage;
}
@end
