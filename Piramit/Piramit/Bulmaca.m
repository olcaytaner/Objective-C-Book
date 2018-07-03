//
//  Bulmaca.m
//  Piramit
//
//  Created by Olcay Taner YILDIZ on 11/18/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Bulmaca.h"

@implementation Bulmaca

- (id) initWithAll:(NSString*) bulmacaBilgisi{
    int k;
    self = [super init];
    if (self){
        _buyukluk = sqrt(2 * bulmacaBilgisi.length);
        _oynama = [[NSMutableArray alloc] initWithCapacity:_buyukluk];
        _sayilar = [[NSMutableArray alloc] initWithCapacity:_buyukluk];
        k = 0;
        for (int i = 0; i < _buyukluk; i++){
            _oynama[i] = [NSNumber numberWithInteger:-1];
            _sayilar[i] = [[NSMutableArray alloc] initWithCapacity:i + 1];
            for (int j = 0; j <= i; j++){
                _sayilar[i][j] = [NSNumber numberWithUnsignedChar:[bulmacaBilgisi characterAtIndex:k] - 48];
                k++;
            }
        }
    }
    return self;
}

- (int) sayi:(int)satir sutun:(int)sutun{
    return [_sayilar[satir][sutun] integerValue];
}

- (int) oynananDeger:(int)satir{
    return [_oynama[satir] integerValue];
}

- (void) oyna:(int)satir deger:(int)deger{
    _oynama[satir] = [NSNumber numberWithInteger:deger];
}

@end
