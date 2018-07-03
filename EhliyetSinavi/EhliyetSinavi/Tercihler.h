//
//  Tercihler.h
//  EhliyetSinavi
//
//  Created by Olcay on 10/1/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

@interface Tercihler : NSObject

@property (readonly) BOOL trafikVarMi;
@property (readonly) BOOL motorVarMi;
@property (readonly) BOOL ilkYardimVarMi;
@property (readonly) int trafikSoruSayisi;
@property (readonly) int motorSoruSayisi;
@property (readonly) int ilkYardimSoruSayisi;
- (id)initWithAll:(BOOL)atrafikVarMi motorVarMi:(BOOL)amotorVarMi ilkYardimVarMi:(BOOL)ailkYardimVarMi trafikSoruSayisi:(int)atrafikSoruSayisi motorSoruSayisi:(int)amotorSoruSayisi ilkYardimSoruSayisi:(int)ailkYardimSoruSayisi;

@end
