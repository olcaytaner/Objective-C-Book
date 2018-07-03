//
//  Ekran.m
//  SatrancTaslari
//
//  Created by Olcay Taner YILDIZ on 10/25/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Ekran.h"

@implementation Ekran

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (UIImage*)tasResim:(int)tas{
    switch (tas){
        case 0:
            return [UIImage imageNamed:@"sah.png"];
        case 1:
            return [UIImage imageNamed:@"vezir.png"];
        case 2:
        case 3:
            return [UIImage imageNamed:@"kale.png"];
        case 4:
        case 5:
            return [UIImage imageNamed:@"fil.png"];
        case 6:
        case 7:
            return [UIImage imageNamed:@"at.png"];
        default:
            return [UIImage imageNamed:@"sah.png"];
    }    
}

- (void)drawRect:(CGRect)rect{
    int i, x, y, W, H, w, h, l, posx, posy;
    const int UST = 50;
    CGContextRef context;
    context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    for (i = 0; i < 9; i++){
        CGContextMoveToPoint(context, (i + 1) * _hucreGenislik, _hucreGenislik + UST);
        CGContextAddLineToPoint(context, (i + 1) * _hucreGenislik, 9 * _hucreGenislik + UST);
        CGContextStrokePath(context);
        CGContextMoveToPoint(context, _hucreGenislik, (i + 1) * _hucreGenislik + UST);
        CGContextAddLineToPoint(context, 9 * _hucreGenislik, (i + 1) * _hucreGenislik + UST);
        CGContextStrokePath(context);
    }
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(context, 3.0);
    for (i = 0; i < [_bulmaca yerlestirilecekYerSayisi]; i++){
        Kare* kare = [_bulmaca yerlestirilecekYer:i];
        x = [kare x];
        y = [kare y];
        if ([_tablo[i] intValue] == -1){
            CGRect rectangle = CGRectMake((y + 1) * _hucreGenislik, UST + (x + 1) * _hucreGenislik, _hucreGenislik, _hucreGenislik);
            CGContextAddRect(context, rectangle);            
            CGContextStrokePath(context);
        } else {
            if (_hareketEdiyor && _hangiTas >= 8 && _hangiTas - 8 == i){
                UIImage *tas = [self tasResim:[_tablo[i] intValue]];
                CGRect alan = CGRectMake(_hareketX, UST + _hareketY, _hucreGenislik - 2, _hucreGenislik - 2);
                [tas drawInRect:alan];
            } else {
                UIImage *tas = [self tasResim:[_tablo[i] intValue]];
                CGRect alan = CGRectMake((y + 1) * _hucreGenislik + 1, UST + (x + 1) * _hucreGenislik + 1, _hucreGenislik - 1,_hucreGenislik - 1);
                [tas drawInRect:alan];
            }
        }
    }
    for (i = 0; i < [_bulmaca tehditSayisi]; i++){
        Tehdit* tehdit = [_bulmaca tehdit:i];
        x = [tehdit x];
        y = [tehdit y];
        posx = (y + 1) * _hucreGenislik - 2;
        posy = (x + 1) * _hucreGenislik;
        UIImage *sayi = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png", [tehdit tehditSayisi]]];
        w = sayi.size.width;
        h = sayi.size.height;
        l = _hucreGenislik / 2;
        if (h > w){
            W = w * l / h;
            CGRect alan = CGRectMake(posx + (_hucreGenislik - l) / 2 + l / 2 - W / 2, UST + posy + (_hucreGenislik - l) / 2, _hucreGenislik / 2, _hucreGenislik / 2);
            [sayi drawInRect:alan];
        } else {
            H = h * l / w;
            CGRect alan = CGRectMake(posx + (_hucreGenislik - l) / 2, UST + posy + (_hucreGenislik - l) / 2 + l / 2 - H / 2, _hucreGenislik / 2, _hucreGenislik / 2);
            [sayi drawInRect:alan];
        }
    }
    for (i = 0; i < 8; i++){
        if ([_tahtayaKonduMu[i] intValue] == 0){
            if (_hareketEdiyor && _hangiTas < 8 && _hangiTas == i){
                UIImage *tas = [self tasResim:i];
                CGRect alan = CGRectMake(_hareketX, UST + _hareketY, _hucreGenislik - 2, _hucreGenislik - 2);
                [tas drawInRect:alan];
            } else {
                UIImage *tas = [self tasResim:i];
                CGRect alan = CGRectMake((i + 1) * _hucreGenislik + 1, UST + 9 * _hucreGenislik + 1, _hucreGenislik - 1, _hucreGenislik - 1);
                [tas drawInRect:alan];
            }
        }
    }
}

@end
