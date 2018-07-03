//
//  KaynakKelime.h
//  Sozluk
//
//  Created by Olcay Taner YILDIZ on 11/8/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kelime.h"
#import "Ceviri.h"

@interface KaynakKelime : Kelime
@property NSMutableArray* ceviriler;
- (id)initWithAll:(NSString*)ad;
- (void)ceviriEkle:(Ceviri*)ceviri;
- (int)ceviriSayisi;
- (Ceviri*)ceviri:(int)pozisyon;
@end
