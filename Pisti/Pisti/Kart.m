//
//  Kart.m
//  Pisti
//
//  Created by Olcay on 10/14/14.
//  Copyright (c) 2014 Olcay. All rights reserved.
//

#import "Kart.h"

@implementation Kart

- (id)initWithAll:(NSString *)aKartTipi kartDeger:(int)aKartDeger{
    self = [super init];
    if (self){
        _tip = aKartTipi;
        _deger = aKartDeger;
    }
    return self;
}

-(NSString*) description{
    switch (_deger){
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
                return [_tip stringByAppendingString:[NSString stringWithFormat:@"_%d", _deger]];
            case 1:
                return [_tip stringByAppendingString:@"_as"];
            case 11:
                return [_tip stringByAppendingString:@"_vale"];
            case 12:
                return [_tip stringByAppendingString:@"_kiz"];
            case 13:
            return [_tip stringByAppendingString:@"_papaz"];
    }
    return NULL;
}

@end
