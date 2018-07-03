//
//  Kazanc.h
//  Pisti
//
//  Created by Olcay on 10/14/14.
//  Copyright (c) 2014 Olcay. All rights reserved.
//

#import "Kart.h"

@interface Kazanc : NSObject

@property NSMutableArray* normalKartlar;
@property NSMutableArray* pistiKartlar;
- (id)initWithAll;
- (void)normalEkle:(Kart*) kart;
- (void)pistiEkle:(Kart*) kart;
- (int)kartSayisi;
- (int)puan;

@end
