//
//  ViewController.m
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 14/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "CollectionViewController.h"
#import "Cell.h"
#import "Item.h"

@interface CollectionViewController () <UICollectionViewDelegateFlowLayout>
@property (nonatomic) NSArray *items;
@end

@implementation CollectionViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	self.items = @[
		[[Item alloc] initWithHeader:nil body:@"body 1" date:@"date 1"],
		[[Item alloc] initWithHeader:@"header 2" body:@"body 2" date:nil],
		[[Item alloc] initWithHeader:@"header 3" body:@"body 3" date:@"date 3"],
		[[Item alloc] initWithHeader:@"header 4" body:nil date:@"date 4"],
		[[Item alloc] initWithHeader:nil body:@"body 5" date:nil],
		[[Item alloc] initWithHeader:nil body:@"body 6" date:nil],
		[[Item alloc] initWithHeader:@"header 7" body:@"body 7" date:@"date 7"],
		[[Item alloc] initWithHeader:@"header 8" body:@"body 8" date:@"date 8"],
		[[Item alloc] initWithHeader:@"header 9" body:@"body 9" date:@"date 9"],
		[[Item alloc] initWithHeader:@"header 10" body:@"body 10" date:@"date 10"],
		[[Item alloc] initWithHeader:@"header 11" body:@"body 11" date:@"date 11"]
	];

	UINib *nib = [UINib nibWithNibName:NSStringFromClass([Cell class]) bundle:nil];
	[self.collectionView registerNib:nib forCellWithReuseIdentifier:NSStringFromClass([Cell class])];
}

- (void)setupCell:(Cell *)cell forIndexPath:(NSIndexPath *)indexPath {
	Item *item = [self.items objectAtIndex:indexPath.item];
	cell.header = item.header;
	cell.body = item.body;
	cell.date = item.date;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
				  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

	Cell *cell = [Cell sizingCell];
	[self setupCell:cell forIndexPath:indexPath];
	CGSize size = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
	size.width = collectionView.bounds.size.width;
	return size;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
				  cellForItemAtIndexPath:(NSIndexPath *)indexPath {

	Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([Cell class])
														   forIndexPath:indexPath];
	[self setupCell:cell forIndexPath:indexPath];
	return cell;

}

@end
