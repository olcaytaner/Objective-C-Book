//
//  Bulmaca.h
//  Piramit
//
//  Created by Olcay Taner YILDIZ on 11/18/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bulmaca : NSObject
@property NSMutableArray* sayilar;
@property NSMutableArray* oynama;
@property int buyukluk;
- (id) initWithAll:(NSString*) bulmacaBilgisi;
- (int) sayi:(int)satir sutun:(int)sutun;
- (int) oynananDeger:(int)satir;
- (void) oyna:(int)satir deger:(int)deger;
@end
