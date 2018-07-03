//
//  El.m
//  Pisti
//
//  Created by Olcay on 10/14/14.
//  Copyright (c) 2014 Olcay. All rights reserved.
//

#import "El.h"
#import "Kart.h"

@implementation El

- (id)initWithAll:(Kart*)aKart1 kart2:(Kart*)aKart2 kart3:(Kart*)aKart3 kart4:(Kart*) aKart4{
    self = [super init];
    if (self){
        _kartlar = [NSArray arrayWithObjects:aKart1, aKart2, aKart3, aKart4, nil];
        _oynandiMi = [NSMutableArray arrayWithObjects: @0, @0, @0, @0, nil];
    }
    return self;
}

- (Kart*) oyna:(int) pozisyon{
    _oynandiMi[pozisyon] = @1;
    return _kartlar[pozisyon];
}

- (Kart*) kartGetir:(int) pozisyon{
    return _kartlar[pozisyon];
}

- (bool) oynandiMi:(int) pozisyon{
    if ([_oynandiMi[pozisyon] isEqual: @1])
        return true;
    else
        return false;
}

@end
