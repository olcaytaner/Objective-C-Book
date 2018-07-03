//
//  SozlukKelime.h
//  Sozluk
//
//  Created by Olcay Taner YILDIZ on 11/8/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kelime.h"
#import "Anlam.h"

@interface SozlukKelime : Kelime
@property NSString* sinif;
@property NSString* koken;
@property NSMutableArray* anlamlar;
- (id)initWithAll:(NSString*)ad;
- (void)anlamEkle:(Anlam*)anlam;
- (int)anlamSayisi;
- (Anlam*)anlam:(int)pozisyon;
@end
