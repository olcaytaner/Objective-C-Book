//
//  SozlukKelime.m
//  Sozluk
//
//  Created by Olcay Taner YILDIZ on 11/8/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "SozlukKelime.h"

@implementation SozlukKelime : Kelime

- (id)initWithAll:(NSString*)ad{
    self = [super initWithAll:ad];
    if (self){
        _anlamlar = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)anlamEkle:(Anlam*)anlam{
    [_anlamlar addObject:anlam];
}

-(int)anlamSayisi{
    return _anlamlar.count;
}

-(Anlam*)anlam:(int)pozisyon{
    return _anlamlar[pozisyon];
}

@end
