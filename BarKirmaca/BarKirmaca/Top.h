//
//  Top.h
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/30/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tugla.h"
#import "Cubuk.h"

@interface Top : NSObject

@property CGPoint merkez;
@property CGPoint hiz;
@property int yariCap;
- (id)initWithAll:(int)genislik cubukY:(int)cubukY ekranGenislik:(int) ekranGenislik;
-(void)hareketEttir;
-(bool)sinirlarlaTemas:(int)ekranGenislik ekranYukseklik:(int)ekranYukseklik;
-(bool)tuglaylaTemas:(Tugla*)tugla;
-(bool)cubuklaTemas:(Cubuk*)cubuk;
-(void)hizlandir;
-(void)yavaslat;

@end
