//
//  Anlam.m
//  Sozluk
//
//  Created by Olcay Taner YILDIZ on 11/8/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Anlam.h"

@implementation Anlam

- (id)initWithAll:(NSString*)sinif anlam:(NSString*)anlam{
    self = [super init];
    if (self){
        _sinif = sinif;
        _anlam = anlam;
    }
    return self;
}

- (id)initWithAll:(NSString*)anlam{
    self = [super init];
    if (self){
        _sinif = NULL;
        _anlam = anlam;
    }
    return self;
}

@end
