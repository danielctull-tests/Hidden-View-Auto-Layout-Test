//
//  Item.h
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 14/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

- (instancetype)initWithHeader:(NSString *)header body:(NSString *)body date:(NSString *)date;

@property (nonatomic, readonly) NSString *header;
@property (nonatomic, readonly) NSString *body;
@property (nonatomic, readonly) NSString *date;

@end
