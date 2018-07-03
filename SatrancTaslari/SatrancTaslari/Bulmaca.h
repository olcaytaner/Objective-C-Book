//
//  Bulmaca.h
//  SatrancTaslari
//
//  Created by Olcay on 10/27/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Kare.h"
#import "Tehdit.h"
#import "Cozum.h"

@interface Bulmaca : NSObject
@property NSMutableArray* yerlestirilecekYerler;
@property NSMutableArray* tehditler;

- (id)initWithAll;
- (void)yerlestirilecekYerEkle:(Kare*) yer;
- (void)tehditEkle:(Tehdit*) tehdit;
- (int)yerlestirilecekYerNo:(int)x y:(int)y;
- (int)yerlestirilecekYerSayisi;
- (Kare*)yerlestirilecekYer:(int) pozisyon;
- (int)tehditSayisi;
- (Tehdit*)tehdit:(int) pozisyon;
- (bool) sartlariSaglar:(Cozum*) cozum;
- (bool) sartlariSimdilikSaglar:(Cozum*) cozum;

@end
