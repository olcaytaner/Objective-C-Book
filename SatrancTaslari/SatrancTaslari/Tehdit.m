//
//  Tehdit.m
//  SatrancTaslari
//
//  Created by Olcay on 10/27/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Tehdit.h"

@implementation Tehdit

- (id)initWithAll:(int)x y:(int)y tehditSayisi:(int)tehditSayisi{
    self = [super initWithAll:x y:y];
    if (self){
        _tehditSayisi = tehditSayisi;
    }
    return self;
}

@end
