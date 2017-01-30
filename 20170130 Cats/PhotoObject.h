//
//  PhotoObject.h
//  20170130 Cats
//
//  Created by Minhung Ling on 2017-01-30.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoObject : NSObject

@property NSString *objectID;
@property NSString *owner;
@property NSString *secret;
@property NSString *server;
@property NSNumber *farm;
@property NSString *title;
@property UIImage *catImage;

-(void) setUpPhotoWithDictionary:(NSDictionary*)dictionary;

@end
