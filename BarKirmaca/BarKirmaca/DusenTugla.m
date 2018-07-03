//
//  DusenTugla.m
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/30/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "DusenTugla.h"

@implementation DusenTugla

- (id)initWithAll:(TuglaTip)tip yer:(CGRect)yer yukseklik:(int)yukseklik{
    self = [super init];
    if (self){
        _tip = tip;
        _yer = yer;
        _hiz.x = 0;
        _hiz.y = yukseklik / 1000.0;
    }
    return self;    
}

-(void)hareketEttir{
    _yer.origin.x += _hiz.x;
    _yer.origin.y += _hiz.y;
}

-(bool)cubuklaTemas:(Cubuk*)cubuk{
    if (_yer.origin.x + _yer.size.width > cubuk.yer.origin.x && _yer.origin.x < cubuk.yer.origin.x + cubuk.yer.size.width
        && _yer.origin.y + _yer.size.height > cubuk.yer.origin.y && _yer.origin.y < cubuk.yer.origin.y + cubuk.yer.size.height){
        return true;
    } else {
        return false;
    }
}

@end
