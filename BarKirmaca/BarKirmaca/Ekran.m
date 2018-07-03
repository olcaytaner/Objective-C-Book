//
//  Ekran.m
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/29/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Ekran.h"
#import "Top.h"
#import "DusenTugla.h"

@implementation Ekran

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(UIColor*) tuglaRenk:(TuglaTip)tip{
    switch (tip){
        case NORMAL:
            return [UIColor blackColor];
        case ZOR:
            return [UIColor brownColor];
        case HIZLI:
            return [UIColor blueColor];
        case YAVAS:
            return [UIColor cyanColor];
        case BUYUK:
            return [UIColor orangeColor];
        case KUCUK:
            return [UIColor greenColor];
        case YASAM:
            return [UIColor magentaColor];
        case OLUM:
            return [UIColor redColor];
        case COKTOP:
            return [UIColor yellowColor];
    }    
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context;
    Seviye* seviye;
    Tugla* cizilenTugla;
    Cubuk* cubuk;
    Top* top;
    DusenTugla* dusenTugla;
    UIColor* renk;
    int fontBuyukluk;
    CGSize yaziBuyukluk;
    context = UIGraphicsGetCurrentContext();
    seviye = _parametre.seviye;
    for (int i = 0; i < seviye.satir; i++){
        for (int j = 0; j < seviye.sutun; j++){
            cizilenTugla = [seviye tugla:i sutun:j];
            if (![cizilenTugla kirildi]){
                renk = [self tuglaRenk:cizilenTugla.tip];
                CGContextSetFillColorWithColor(context, renk.CGColor);
                CGContextFillRect(context, cizilenTugla.yer);
                CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
                CGContextAddRect(context, cizilenTugla.yer);
                CGContextStrokePath(context);                
            }
        }
    }
    cubuk = _parametre.cubuk;
    CGContextSetFillColorWithColor(context, [UIColor darkGrayColor].CGColor);
    CGContextFillRect(context, cubuk.yer);
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextAddRect(context, cubuk.yer);
    CGContextStrokePath(context);
    for (int i = 0; i < [_parametre topSayisi]; i++){
        top = [_parametre top:i];
        CGRect alan = CGRectMake(top.merkez.x - top.yariCap, top.merkez.y - top.yariCap, 2 * top.yariCap, 2 * top.yariCap);
        CGContextSetFillColorWithColor(context, [UIColor purpleColor].CGColor);
        CGContextFillEllipseInRect(context, alan);
    }
    for (int i = 0; i < [_parametre dusenTuglaSayisi]; i++){
        dusenTugla = [_parametre dusenTugla:i];
        renk = [self tuglaRenk:dusenTugla.tip];
        CGContextSetFillColorWithColor(context, renk.CGColor);
        CGContextFillEllipseInRect(context, dusenTugla.yer);
    }
    for (int i = 0; i < _parametre.yasamSayisi; i++){
        CGRect alan = CGRectMake(5 + i * 2 * top.yariCap, _parametre.cubuk.yer.origin.y + 1.4 * _parametre.cubuk.yer.size.height, 1.6 * top.yariCap, 1.6 * top.yariCap);
        CGContextSetFillColorWithColor(context, [UIColor purpleColor].CGColor);
        CGContextFillEllipseInRect(context, alan);        
    }
    NSString* puan = [NSString stringWithFormat:@"%d", _parametre.puan];
    fontBuyukluk = _parametre.ekranGenislik * 12 / 300;
    yaziBuyukluk = [puan sizeWithFont:[UIFont systemFontOfSize:fontBuyukluk]];
    CGContextSelectFont(context, [[UIFont systemFontOfSize:fontBuyukluk].fontName UTF8String], fontBuyukluk, kCGEncodingMacRoman);
    CGContextSetTextMatrix(context, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
    CGContextShowTextAtPoint(context, _parametre.ekranGenislik - yaziBuyukluk.width, _parametre.ekranYukseklik - 10 - yaziBuyukluk.height, [puan UTF8String], [puan length]);
    NSString* seviyeYazi = [NSString stringWithFormat:@"Seviye %d", _parametre.seviye.seviyeNo + 1];
    fontBuyukluk = _parametre.ekranGenislik * 12 / 150;
    yaziBuyukluk = [seviyeYazi sizeWithFont:[UIFont systemFontOfSize:fontBuyukluk]];
    CGContextSelectFont(context, [[UIFont systemFontOfSize:fontBuyukluk].fontName UTF8String], fontBuyukluk, kCGEncodingMacRoman);
    CGContextShowTextAtPoint(context, _parametre.ekranGenislik / 2 - yaziBuyukluk.width / 2, _parametre.ekranYukseklik / 2 - yaziBuyukluk.height / 2, [seviyeYazi UTF8String], [seviyeYazi length]);
}

@end
