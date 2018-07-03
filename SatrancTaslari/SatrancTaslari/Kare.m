//
//  Kare.m
//  SatrancTaslari
//
//  Created by Olcay on 10/27/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Kare.h"

@implementation Kare

- (id)initWithAll:(int)x y:(int)y{
    self = [super init];
    if (self){
        _x = x;
        _y = y;
    }
    return self;
}

@end
