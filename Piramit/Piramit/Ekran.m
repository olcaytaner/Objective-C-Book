//
//  Ekran.m
//  Piramit
//
//  Created by Olcay Taner YILDIZ on 11/18/14.
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

- (void)drawRect:(CGRect)rect{
    int i, j;
    float x1, y1;
    CGContextRef context;
    context = UIGraphicsGetCurrentContext();
    for (i = 0; i < _bulmaca.buyukluk; i++){
        for (j = 0; j <= i; j++){
            if ([_bulmaca oynananDeger:i] != j){
                CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
                CGContextSetLineWidth(context, 1.0);
            } else {
                CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
                CGContextSetLineWidth(context, 3.0);
            }
            x1 = (j + (_bulmaca.buyukluk - i + 1) / 2.0) * _hucreGenislik;
            y1 = (i + 1) * _hucreGenislik;
            CGRect alan = CGRectMake(x1, y1, _hucreGenislik, _hucreGenislik);
            CGContextAddRect(context, alan);
            CGContextStrokePath(context);
            NSString* sayi = [NSString stringWithFormat:@"%d", [_bulmaca sayi:i sutun:j]];
            int fontBuyukluk = _hucreGenislik / 1.5;
            CGContextSelectFont(context, [[UIFont systemFontOfSize:fontBuyukluk].fontName UTF8String], fontBuyukluk, kCGEncodingMacRoman);
            CGSize yaziBuyukluk = [sayi sizeWithFont:[UIFont systemFontOfSize:fontBuyukluk]];
            CGContextSetTextMatrix(context, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
            CGContextShowTextAtPoint(context, alan.origin.x + (_hucreGenislik - yaziBuyukluk.width) / 2, alan.origin.y + 1.5 * _hucreGenislik - yaziBuyukluk.height, [sayi UTF8String], 1);
        }
    }
}

@end
