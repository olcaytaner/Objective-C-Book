//
//  Bar.m
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/29/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Tugla.h"

@implementation Tugla

- (id)initWithAll:(TuglaTip)tip yer:(CGRect)yer{
    self = [super init];
    if (self){
        _tip = tip;
        _kirildi = false;
        _yer = yer;
        _vurmaSayisi = 0;
    }
    return self;
}

- (void)vuruldu{
    _vurmaSayisi++;
    if (_tip == ZOR){
        if (_vurmaSayisi == 2){
            _kirildi = true;
        }
    } else {
        _kirildi = true;
    }
}

@end
