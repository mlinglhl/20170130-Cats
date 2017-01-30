//
//  ViewController.m
//  20170130 Cats
//
//  Created by Minhung Ling on 2017-01-30.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "ViewController.h"
#import "PhotoObject.h"
#import "CatCell.h"

@interface ViewController ()
@property NSMutableArray *photoObjectArray;
@property (weak, nonatomic) IBOutlet UICollectionView *catCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoObjectArray = [NSMutableArray new];
    NSURL *url = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=4ecacf0cd6441400e02e57ec12f0bb68&tags=cat"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog (@"error:%@", error.localizedDescription);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *cats = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog (@"jsonerror:%@", jsonError.localizedDescription);
            return;
        }
        NSDictionary *photoDictionary = [cats objectForKey:@"photos"];
        for (NSDictionary *catPhoto in photoDictionary) {
            PhotoObject *photo = [PhotoObject new];
            [photo setUpPhotoWithDictionary:catPhoto];
            [self.photoObjectArray addObject:photo];
        }
        [[NSOperationQueue mainQueue] addOperationWithBlock: ^{
            [self.catCollectionView reloadData];
        }];
    }];
    [dataTask resume];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photoObjectArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CatCell *cell = [self.catCollectionView dequeueReusableCellWithReuseIdentifier:@"CatCell" forIndexPath:indexPath];
    cell.photoObject = self.photoObjectArray[indexPath.item];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
