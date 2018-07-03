//
//  Kelime.m
//  Sozluk
//
//  Created by Olcay Taner YILDIZ on 11/8/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Kelime.h"

@implementation Kelime

- (id)initWithAll:(NSString*)ad{
    self = [super init];
    if (self){
        _ad = ad;
    }
    return self;
}

@end
