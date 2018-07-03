//
//  Kazanc.m
//  Pisti
//
//  Created by Olcay on 10/14/14.
//  Copyright (c) 2014 Olcay. All rights reserved.
//

#import "Kazanc.h"
#import "Kart.h"

@implementation Kazanc

- (id)initWithAll{
    self = [super init];
    if (self){
        _normalKartlar = [[NSMutableArray alloc] init];
        _pistiKartlar = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)normalEkle:(Kart*) kart{
    [_normalKartlar addObject:kart];
}

- (void)pistiEkle:(Kart*) kart{
    [_pistiKartlar addObject:kart];
}

- (int)kartSayisi{
    return [_normalKartlar count] + 2 * [_pistiKartlar count];
}

-(int)puan{
    int puan = 0;
    for (Kart* kart in _pistiKartlar){
        if ([kart deger] == 11){
            puan += 20;
        } else {
            puan += 10;
        }
    }
    for (Kart* kart in _normalKartlar){
        if ([kart deger] == 1 || [kart deger] == 11){
            puan++;
        } else {
            if ([kart deger] == 2 && [[kart tip] isEqualToString:@"sinek"]){
                puan += 2;
            } else {
                if ([kart deger] == 10 && [[kart tip] isEqualToString:@"karo"]){
                    puan += 3;
                }
            }
        }
    }
    return puan;
}

@end
