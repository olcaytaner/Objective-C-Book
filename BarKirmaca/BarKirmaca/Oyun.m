//
//  Oyun.m
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/29/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Oyun.h"
#import "Seviye.h"

@implementation Oyun

- (id)initWithAll:(NSString*)dosyaAd genislik:(int)genislik{
    self = [super init];
    if (self){
        NSString *dosyaAdi, *dosyaIcerik, *satirBilgi;
        NSScanner* ayirici;
        int i, satir, sutun;
        dosyaAdi = [[NSBundle mainBundle] pathForResource:dosyaAd
                                                   ofType:@"txt"];
        dosyaIcerik = [NSString stringWithContentsOfFile:dosyaAdi
                                                encoding:NSUTF8StringEncoding
                                                   error:NULL];
        ayirici = [NSScanner scannerWithString:dosyaIcerik];
        [ayirici scanInt:&_seviyeSayisi];
        _seviyeler = [[NSMutableArray alloc] initWithCapacity:_seviyeSayisi];
        for (i = 0; i < _seviyeSayisi; i++){
            [ayirici scanInt:&satir];
            [ayirici scanInt:&sutun];
            Seviye* seviye = [[Seviye alloc] initWithAll:satir sutun:sutun genislik:genislik seviyeNo:i];
            for (int j = 0; j < satir; j++){
                [ayirici scanUpToString:@"\n" intoString:&satirBilgi];
                [seviye satirAyarla:j satirBilgi:satirBilgi];
            }
            _seviyeler[i] = seviye;
        }
    }
    return self;
}

-(Seviye*)seviye:(int)pozisyon{
    return _seviyeler[pozisyon];
}

@end
