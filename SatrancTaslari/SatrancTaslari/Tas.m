//
//  Tas.m
//  SatrancTaslari
//
//  Created by Olcay on 10/27/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Tas.h"

@implementation Tas

- (id) initWithAll:(NSString*)ad{
    self = [super init];
    if (self){
        _ad = ad;
    }
    return self;
}

@end
