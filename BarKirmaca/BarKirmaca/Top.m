//
//  Top.m
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/30/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Top.h"

@implementation Top

- (id)initWithAll:(int)cubukX cubukY:(int)cubukY ekranGenislik:(int) ekranGenislik{
    self = [super init];
    if (self){
        _hiz.x = -ekranGenislik / 600.0;
        _hiz.y = -ekranGenislik / 600.0;
        _yariCap = ekranGenislik / 50;
        _merkez.x = cubukX + _yariCap;
        _merkez.y = cubukY - _yariCap;
    }
    return self;
}

-(void)hareketEttir{
    _merkez.x += _hiz.x;
    _merkez.y += _hiz.y;
}

-(bool)sinirlarlaTemas:(int)ekranGenislik ekranYukseklik:(int)ekranYukseklik{
    if (_merkez.x < 0 || _merkez.x > ekranGenislik){
        _hiz.x *= -1;
    }
    if (_merkez.y < 0){
        _hiz.y *= -1;
    }
    if (_merkez.y > ekranYukseklik){
        return true;
    } else {
        return false;
    }
}

-(bool)tuglaylaTemas:(Tugla*)tugla{
    if (_merkez.x + _yariCap > tugla.yer.origin.x && _merkez.x - _yariCap < tugla.yer.origin.x + tugla.yer.size.width
        && _merkez.y + _yariCap > tugla.yer.origin.y && _merkez.y - _yariCap < tugla.yer.origin.y + tugla.yer.size.height){
        _hiz.y *= -1;
        return true;
    } else {
        return false;
    }
}

-(bool)cubuklaTemas:(Cubuk*)cubuk{
    if (_merkez.x + _yariCap > cubuk.yer.origin.x && _merkez.x - _yariCap < cubuk.yer.origin.x + cubuk.yer.size.width
        && _merkez.y + _yariCap > cubuk.yer.origin.y && _merkez.y - _yariCap < cubuk.yer.origin.y + cubuk.yer.size.height){
        _hiz.y *= -1;
        return true;
    } else {
        return false;
    }
}

-(void)hizlandir{
    _hiz.x *= 1.25;
    _hiz.y *= 1.25;
}

-(void)yavaslat{
    _hiz.x *= 0.8;
    _hiz.y *= 0.8;
}

@end
