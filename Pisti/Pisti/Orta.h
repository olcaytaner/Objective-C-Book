//
//  Grup.h
//  Pisti
//
//  Created by Olcay on 10/14/14.
//  Copyright (c) 2014 Olcay. All rights reserved.
//

#import "Orta.h"
#import "Kart.h"
#import "Kazanc.h"

@interface Orta : NSObject

@property NSMutableArray* kartlar;
- (id)initWithAll;
-(Kart*)ustKart;
-(void)kartEkle:(Kart*) kart;
-(int)kartSayisi;
-(bool)kazancVarMi;
-(void)kazancaGonder:(Kazanc*)kazanc;

@end
