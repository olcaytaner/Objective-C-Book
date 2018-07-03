//
//  Deste.m
//  Pisti
//
//  Created by Olcay on 10/14/14.
//  Copyright (c) 2014 Olcay. All rights reserved.
//

#import "Deste.h"
#import "Kart.h"
#import "El.h"
#import "Orta.h"

@implementation Deste

-(void)kartlariDagit{
    NSString* tip;
    Kart* kart;
    _kartlar = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i++){
        switch (i){
            case 0:
                tip = @"karo";
                break;
            case 1:
                tip = @"kupa";
                break;
            case 2:
                tip = @"sinek";
                break;
            case 3:
                tip = @"maca";
                break;
        }
        for (int j = 1; j <= 13; j++){
            kart = [[Kart alloc] initWithAll:tip kartDeger:j];
            [_kartlar addObject:kart];
        }
    }    
}

- (void)kartlariKaristir{
    for (NSInteger i = 0; i < 52; i++) {
        NSInteger remainingCount = 52 - i;
        NSInteger exchangeIndex = i + arc4random_uniform(remainingCount);
        [_kartlar exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

- (El*)elDagit{
    El* el;
    int count = [_kartlar count];
    el = [[El alloc] initWithAll:_kartlar[count - 1] kart2:_kartlar[count - 2] kart3:_kartlar[count - 3] kart4:_kartlar[count - 4]];
    for (int i = 0; i < 4; i++){
        [_kartlar removeLastObject];
    }
    return el;
}

-(void)ortaDagit:(Orta*)orta{
    for (int i = 0; i < 4; i++){
        [orta kartEkle:_kartlar[[_kartlar count] - 1]];
        [_kartlar removeLastObject];
    }
}

- (id)initWithAll{
    self = [super init];
    if (self){
        [self kartlariDagit];
        [self kartlariKaristir];
    }
    return self;
}

@end
