//
//  PhotoObject.m
//  20170130 Cats
//
//  Created by Minhung Ling on 2017-01-30.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "PhotoObject.h"

@implementation PhotoObject

-(void) setUpPhotoWithDictionary:(NSDictionary*)dictionary {
    self.objectID = dictionary[@"id"];
    self.owner = dictionary[@"owner"];
    self.secret = dictionary[@"secret"];
    self.server = dictionary[@"server"];
    self.farm = dictionary[@"farm"];
    self.title = dictionary[@"title"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://farm%d.staticflickr.com/%@/%@_%@.jpg", self.farm.intValue, self.server, self.objectID, self.secret]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    self.catImage = [UIImage imageWithData:data];
}

@end
