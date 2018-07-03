//
//  Seviye.m
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/29/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Seviye.h"
#import "Tugla.h"

@implementation Seviye
int tuglaGenislik;
int tuglaYukseklik;

- (id)initWithAll:(int)satir sutun:(int)sutun genislik:(int)genislik seviyeNo:(int)seviyeNo{
    self = [super init];
    if (self){
        _satir = satir;
        _sutun = sutun;
        _seviyeNo = seviyeNo;
        _satirlar = [[NSMutableArray alloc] initWithCapacity:satir];
        for (int i = 0; i < satir; i++){
            _satirlar[i] = [[NSMutableArray alloc] initWithCapacity:sutun];
        }
        tuglaGenislik = genislik / sutun;
        tuglaYukseklik = 0.7 * tuglaGenislik;
    }
    return self;
}

-(bool)bittiMi{
    Tugla* tugla;
    for (int i = 0; i < _satir; i++){
        for (int j = 0; j < _sutun; j++){
            tugla = _satirlar[i][j];
            if (!tugla.kirildi){
                return false;
            }
        }
    }
    return true;
}

-(void)satirAyarla:(int)satirNo satirBilgi:(NSString*)satirBilgi{
    for (int i = 0; i < [satirBilgi length]; i++){
        CGRect yer;
        yer.origin.x = i * tuglaGenislik;
        yer.origin.y = satirNo * tuglaYukseklik;
        yer.size.width = tuglaGenislik;
        yer.size.height = tuglaYukseklik;
        switch ([satirBilgi characterAtIndex:i]){
            case '1':
                _satirlar[satirNo][i] = [[Tugla alloc] initWithAll:NORMAL yer:yer];
                break;
            case '2':
                _satirlar[satirNo][i] = [[Tugla alloc] initWithAll:ZOR yer:yer];
                break;
            case '3':
                _satirlar[satirNo][i] = [[Tugla alloc] initWithAll:HIZLI yer:yer];
                break;
            case '4':
                _satirlar[satirNo][i] = [[Tugla alloc] initWithAll:YAVAS yer:yer];
                break;
            case '5':
                _satirlar[satirNo][i] = [[Tugla alloc] initWithAll:BUYUK yer:yer];
                break;
            case '6':
                _satirlar[satirNo][i] = [[Tugla alloc] initWithAll:KUCUK yer:yer];
                break;
            case '7':
                _satirlar[satirNo][i] = [[Tugla alloc] initWithAll:YASAM yer:yer];
                break;
            case '8':
                _satirlar[satirNo][i] = [[Tugla alloc] initWithAll:OLUM yer:yer];
                break;
            case '9':
                _satirlar[satirNo][i] = [[Tugla alloc] initWithAll:COKTOP yer:yer];
                break;
        }
    }
}

-(Tugla*)tugla:(int)satir sutun:(int)sutun{
    return _satirlar[satir][sutun];
}

@end
