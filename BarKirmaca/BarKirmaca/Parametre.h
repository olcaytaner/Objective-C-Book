//
//  Parametre.h
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/29/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Seviye.h"
#import "Cubuk.h"
#import "Top.h"
#import "Dusentugla.h"

@interface Parametre : NSObject
@property int yasamSayisi;
@property Cubuk* cubuk;
@property NSMutableArray* dusenTuglalar;
@property NSMutableArray* toplar;
@property Seviye* seviye;
@property int puan;
@property int ekranGenislik;
@property int ekranYukseklik;

- (id)initWithAll:(int)genislik yukseklik:(int)yukseklik seviye:(Seviye*)seviye;
-(Top*)top:(int)pozisyon;
-(DusenTugla*)dusenTugla:(int)pozisyon;
-(int)topSayisi;
-(int)dusenTuglaSayisi;
-(bool)topSinirlarlaTemasKontrol:(Top*)top;
-(bool)topTuglaylaTemasKontrol:(Top*)top;
-(bool)topCubuklaTemasKontrol:(Top*)top;
-(bool)dusenTuglaCubuklaTemasKontrol;
-(bool)elleCubukTemas:(int)x y:(int)y;
-(void)cubukYeniX:(int)x;
-(void)yeniSeviye:(Seviye*)seviye;

@end
