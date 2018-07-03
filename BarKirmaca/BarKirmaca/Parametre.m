//
//  Parametre.m
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/29/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Parametre.h"
#import "Top.h"
#import "DusenTugla.h"

@implementation Parametre

-(void)yeniSeviye:(Seviye*)seviye{
    _seviye = seviye;
    _cubuk = [[Cubuk alloc] initWithAll:_ekranGenislik ekranYukseklik:_ekranYukseklik];
    _toplar = [[NSMutableArray alloc] initWithCapacity:1];
    _toplar[0] = [[Top alloc] initWithAll:_cubuk.yer.origin.x cubukY:_cubuk.yer.origin.y ekranGenislik:_ekranGenislik];
    _dusenTuglalar = [[NSMutableArray alloc] init];
}

- (id)initWithAll:(int)genislik yukseklik:(int)yukseklik seviye:(Seviye *)seviye{
    self = [super init];
    if (self){
        _ekranGenislik = genislik;
        _ekranYukseklik = yukseklik;
        _yasamSayisi = 3;
        _puan = 0;
        [self yeniSeviye:seviye];
    }
    return self;    
}

-(int)topSayisi{
    return _toplar.count;
}

-(Top*)top:(int)pozisyon{
    return _toplar[pozisyon];
}

-(int)dusenTuglaSayisi{
    return _dusenTuglalar.count;
}

-(DusenTugla*)dusenTugla:(int)pozisyon{
    return _dusenTuglalar[pozisyon];
}

-(bool)topSinirlarlaTemasKontrol:(Top*)top{
    Top* yeniTop;
    if ([top sinirlarlaTemas:_ekranGenislik ekranYukseklik:_ekranYukseklik]){
        [_toplar removeObject:top];
        if (_toplar.count == 0){
            _yasamSayisi--;
            if (_yasamSayisi > 0){
                yeniTop = [[Top alloc] initWithAll:_cubuk.yer.origin.x cubukY:_cubuk.yer.origin.y ekranGenislik:_ekranGenislik];
                [_toplar addObject:yeniTop];
            } else {
                return false;
            }
        }
    }
    return true;
}

-(bool)topTuglaylaTemasKontrol:(Top*)top{
    Tugla* tugla;
    DusenTugla* dusenTugla;
    for (int i = 0; i < _seviye.satir; i++){
        for (int j = 0; j < _seviye.sutun; j++){
            tugla = [_seviye tugla:i sutun:j];
            if (![tugla kirildi] && [top tuglaylaTemas:tugla]){
                [tugla vuruldu];
                if ([tugla kirildi]){
                    if (tugla.tip != ZOR)
                        _puan += 10;
                    else
                        _puan += 20;
                    if (tugla.tip != NORMAL && tugla.tip != ZOR){
                        dusenTugla = [[DusenTugla alloc] initWithAll:tugla.tip yer:tugla.yer yukseklik:_ekranYukseklik];
                        [_dusenTuglalar addObject:dusenTugla];                        
                    }
                    if ([_seviye bittiMi])
                        return true;
                }
            }
        }
    }
    return false;
}

-(bool)topCubuklaTemasKontrol:(Top*)top{
    return [top cubuklaTemas:_cubuk];
}

-(bool)elleCubukTemas:(int)x y:(int)y{
    if (x > _cubuk.yer.origin.x && x < _cubuk.yer.origin.x + _cubuk.yer.size.width
        && y > _cubuk.yer.origin.y && y < _cubuk.yer.origin.y + _cubuk.yer.size.height){
        return true;
    } else {
        return false;
    }
}

-(void)cubukYeniX:(int)x{
    if (x > 0 && x < _ekranGenislik - _cubuk.yer.size.width){
        [_cubuk yeniPozisyon:x];        
    }
}

-(bool)dusenTuglaCubuklaTemasKontrol{
    Top* yeniTop;
    for (DusenTugla* dusenTugla in _dusenTuglalar){
        if ([dusenTugla cubuklaTemas:_cubuk]){
            switch (dusenTugla.tip){
                case HIZLI:
                    for (Top* top in _toplar){
                        [top hizlandir];
                    }
                    break;
                case YAVAS:
                    for (Top* top in _toplar){
                        [top yavaslat];
                    }
                    break;
                case BUYUK:
                    [_cubuk buyult];
                    break;
                case KUCUK:
                    [_cubuk kucult];
                    break;
                case YASAM:
                    _yasamSayisi++;
                    break;
                case OLUM:
                    _yasamSayisi--;
                    if (_yasamSayisi == 0)
                        return false;
                    break;
                case COKTOP:
                    yeniTop = [[Top alloc] initWithAll:_cubuk.yer.origin.x cubukY:_cubuk.yer.origin.y ekranGenislik:_ekranGenislik];
                    [_toplar addObject:yeniTop];
                    break;
                default:
                    break;
            }
            [_dusenTuglalar removeObject:dusenTugla];
            break;
        }
    }
    return true;
}

@end
