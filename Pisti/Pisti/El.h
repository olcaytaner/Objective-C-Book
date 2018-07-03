//
//  El.h
//  Pisti
//
//  Created by Olcay on 10/14/14.
//  Copyright (c) 2014 Olcay. All rights reserved.
//

#import "Kart.h"

@interface El : NSObject

@property NSArray* kartlar;
@property NSMutableArray* oynandiMi;
- (Kart*) oyna:(int) pozisyon;
- (Kart*) kartGetir:(int) pozisyon;
- (bool) oynandiMi:(int) pozisyon;
- (id)initWithAll:(Kart*)aKart1 kart2:(Kart*)aKart2 kart3:(Kart*)aKart3 kart4:(Kart*) aKart4;

@end
