//
//  Cubuk.m
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/30/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Cubuk.h"

@implementation Cubuk

- (id)initWithAll:(int)ekranGenislik ekranYukseklik:(int)ekranYukseklik{
    self = [super init];
    if (self){
        _yer.size.width = 0.15 * ekranGenislik;
        _yer.size.height = 0.05 * ekranGenislik;
        _yer.origin.x = ekranGenislik / 2 - _yer.size.width / 2;
        _yer.origin.y = ekranYukseklik - 3.5 * _yer.size.height;
    }
    return self;    
}

-(void)buyult{
    _yer.size.width *= 1.25;
}

-(void)kucult{
    _yer.size.width *= 0.8;
}

-(void)yeniPozisyon:(int)x{
    _yer.origin.x = x;
}

@end
