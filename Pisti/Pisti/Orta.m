//
//  Orta.m
//  Pisti
//
//  Created by Olcay on 10/14/14.
//  Copyright (c) 2014 Olcay. All rights reserved.
//

#import "Orta.h"
#import "Kart.h"
#import "Kazanc.h"

@implementation Orta

- (id)initWithAll{
    self = [super init];
    if (self){
        _kartlar = [[NSMutableArray alloc] init];
    }
    return self;
}

-(Kart*)ustKart{
    if ([_kartlar count] == 0)
        return NULL;
    return _kartlar[[_kartlar count] - 1];
}

-(void)kartEkle:(Kart*) kart{
    [_kartlar addObject:kart];
}

-(int)kartSayisi{
    return [_kartlar count];
}

-(bool)kazancVarMi{
    Kart* ustKart;
    Kart* altKart;
    if ([_kartlar count] >= 2){
        ustKart = _kartlar[[_kartlar count] - 1];
        altKart = _kartlar[[_kartlar count] - 2];
        if ([ustKart deger] == [altKart deger] || [ustKart deger] == 11){
            return true;
        } else {
            return false;
        }
    }
    return false;
}

-(void)kazancaGonder:(Kazanc*)kazanc{
    if ([_kartlar count] == 2){
        [kazanc pistiEkle:[self ustKart]];
    } else {
        for (Kart* kart in _kartlar){
            [kazanc normalEkle:kart];
        }
    }
    [_kartlar removeAllObjects];
}

@end
