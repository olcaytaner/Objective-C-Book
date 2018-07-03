//
//  Tercihler.m
//  EhliyetSinavi
//
//  Created by Olcay on 10/1/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Tercihler.h"

@interface Tercihler ()

@end

@implementation Tercihler

- (id)initWithAll:(BOOL)atrafikVarMi motorVarMi:(BOOL)amotorVarMi ilkYardimVarMi:(BOOL)ailkYardimVarMi trafikSoruSayisi:(int)atrafikSoruSayisi motorSoruSayisi:(int)amotorSoruSayisi ilkYardimSoruSayisi:(int)ailkYardimSoruSayisi{
    self = [super init];
    if (self){
        _trafikVarMi = atrafikVarMi;
        _motorVarMi = amotorVarMi;
        _ilkYardimVarMi = ailkYardimVarMi;
        _trafikSoruSayisi = atrafikSoruSayisi;
        _motorSoruSayisi = amotorSoruSayisi;
        _ilkYardimSoruSayisi = ailkYardimSoruSayisi;
    }
    return self;
}

@end