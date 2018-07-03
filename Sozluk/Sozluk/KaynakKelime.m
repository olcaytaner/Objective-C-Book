//
//  KaynakKelime.m
//  Sozluk
//
//  Created by Olcay Taner YILDIZ on 11/8/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "KaynakKelime.h"

@implementation KaynakKelime

- (id)initWithAll:(NSString*)ad{
    self = [super initWithAll:ad];
    if (self){
        _ceviriler = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)ceviriEkle:(Ceviri*)ceviri{
    [_ceviriler addObject:ceviri];
}

- (int)ceviriSayisi{
    return _ceviriler.count;
}

- (Ceviri*)ceviri:(int)pozisyon{
    return _ceviriler[pozisyon];
}

@end
