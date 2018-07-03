//
//  Cozum.m
//  SatrancTaslari
//
//  Created by Olcay on 10/27/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Cozum.h"
#import "Tas.h"

@implementation Cozum
NSArray* tumTaslar;

- (id)initWithAll{
    self = [super init];
    if (self){
        tumTaslar = [[NSArray alloc] initWithObjects:[[Tas alloc] initWithAll:@"sah"], [[Tas alloc] initWithAll:@"vezir"],
                              [[Tas alloc] initWithAll:@"kale1"], [[Tas alloc] initWithAll:@"kale2"], [[Tas alloc] initWithAll:@"fil1"], [[Tas alloc] initWithAll:@"fil2"], [[Tas alloc] initWithAll:@"at1"], [[Tas alloc] initWithAll:@"at2"], nil];
        _taslar = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSString*)tasAd:(int)pozisyon{
    if (pozisyon >= 0 && pozisyon < [_taslar count])
        return [_taslar[pozisyon] ad];
    else
        return [NSString stringWithFormat:@"bos"];
}

-(int)tasNo:(int)pozisyon{
    for (int i = 0; i < [tumTaslar count]; i++){
        if ([[_taslar[pozisyon] ad] isEqualToString:[tumTaslar[i] ad]]){
            return i;
        }
    }
    return -1;
}

-(int)tasSayisi{
    return [_taslar count];
}

-(void)tasEkle:(Tas*)tas{
    [_taslar addObject:tas];
}

-(void)tasNoIleEkle:(int)tas{
    if (tas >= 0 && tas < 8){
        [_taslar addObject:tumTaslar[tas]];
    }
}

-(void)tasCikar{
    [_taslar removeLastObject];
}

-(NSMutableArray*)adaylariOlustur{
    bool bulundu;
    NSMutableArray* aday = [[NSMutableArray alloc] init];
    for (Tas* olasiTas in tumTaslar){
        bulundu = false;
        for (Tas* tas in _taslar){
            if ([[tas ad] isEqualToString:[olasiTas ad]]){
                bulundu = true;
                break;
            }
        }
        if (!bulundu){
            [aday addObject:olasiTas];
        }
    }
    return aday;
}

@end
