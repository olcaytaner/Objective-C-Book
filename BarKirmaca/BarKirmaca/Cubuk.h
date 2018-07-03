//
//  Cubuk.h
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/30/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cubuk : NSObject

@property CGRect yer;
- (id)initWithAll:(int)ekranGenislik  ekranYukseklik:(int)ekranYukseklik;
-(void)buyult;
-(void)kucult;
-(void)yeniPozisyon:(int)x;

@end
