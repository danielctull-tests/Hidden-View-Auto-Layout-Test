//
//  Cell.h
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 14/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

@import UIKit;

@interface Cell : UICollectionViewCell

+ (instancetype)sizingCell;

@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *body;

@end
