//
//  SatrancTaslari.m
//  SatrancTaslari
//
//  Created by Olcay Taner YILDIZ on 10/23/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "SatrancTaslari.h"
#import "Bulmaca.h"

@interface SatrancTaslari ()

@end

@implementation SatrancTaslari

const int BOSYER = -1;
Cozum* cozum;
NSTimer* zamanlayici = NULL;
int gecenSaniye;

- (void) dosyaOku{
    NSString *dosyaAdi, *dosyaIcerik;
    NSScanner* ayirici;
    int i, j, x, y, kareSayisi, tehditSayisi;
    dosyaAdi = [[NSBundle mainBundle] pathForResource:@"bulmacalar"
                                               ofType:@"txt"];
    dosyaIcerik = [NSString stringWithContentsOfFile:dosyaAdi
                                            encoding:NSUTF8StringEncoding
                                               error:NULL];
    ayirici = [NSScanner scannerWithString:dosyaIcerik];
    [ayirici scanInt:&_soruSayisi];
    _bulmacalar = [[NSMutableArray arrayWithCapacity:_soruSayisi] init];
    for (i = 0; i < _soruSayisi; i++){
        Bulmaca* bulmaca = [[Bulmaca alloc] initWithAll];
        for (j = 0; j < 8; j++){
            [ayirici scanInt:&x];
            [ayirici scanInt:&y];
            Kare* kare = [[Kare alloc] initWithAll:x-1 y:y-1];
            [bulmaca yerlestirilecekYerEkle:kare];
        }
        [ayirici scanInt:&kareSayisi];
        for (j = 0; j < kareSayisi; j++){
            [ayirici scanInt:&x];
            [ayirici scanInt:&y];
            [ayirici scanInt:&tehditSayisi];
            Tehdit* tehdit = [[Tehdit alloc] initWithAll:x-1 y:y-1 tehditSayisi:tehditSayisi];
            [bulmaca tehditEkle:tehdit];
        }
        _bulmacalar[i] = bulmaca;
    }
}

- (void) yeniOyun{
    int i;
    _bitti = false;
    _bulmaca = _bulmacalar[arc4random_uniform([_bulmacalar count])];
    _ekran.tablo = [[NSMutableArray arrayWithCapacity:8] init];
    _ekran.tahtayaKonduMu = [[NSMutableArray arrayWithCapacity:8] init];
    for (i = 0; i < 8; i++){
        _ekran.tablo[i] = [NSNumber numberWithInt:BOSYER];
        _ekran.tahtayaKonduMu[i] = [NSNumber numberWithInt:0];
    }
    _ekran.hareketEdiyor = false;
    _ekran.bulmaca = _bulmaca;
    gecenSaniye = 0;
    if (zamanlayici != NULL){
        [zamanlayici invalidate];
        zamanlayici = NULL;
    }
    zamanlayici = [NSTimer scheduledTimerWithTimeInterval:1 target: self selector:@selector(onTimer) userInfo: nil repeats: YES];
    [_ekran setNeedsDisplay];
}

- (void) cozumKontrol{
    NSString *mesaj;
    cozum = [[Cozum alloc] initWithAll];
    for (int i = 0; i < 8; i++)
        [cozum tasNoIleEkle:[_ekran.tablo[i] intValue]];
    if (![_bulmaca sartlariSaglar:cozum]){
        mesaj = [NSString stringWithFormat:@"Çözümünüz yanlış!"];
    } else {
        mesaj = [NSString stringWithFormat:@"Çözümünüz doğru!"];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bulmaca Bitti!" message:mesaj
                                                   delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
}

- (IBAction)hareketEttir:(UIPanGestureRecognizer *)hareketAlgilayici {
    int x, y, posx, posy, pozisyon;
    CGPoint p = [hareketAlgilayici locationInView:hareketAlgilayici.view];
    x = p.x;
    y = p.y - 50;
    if (hareketAlgilayici.state == UIGestureRecognizerStateBegan){
        if (y < 9 * _ekran.hucreGenislik){
            posx = x / _ekran.hucreGenislik - 1;
            posy = y / _ekran.hucreGenislik - 1;
            pozisyon = [_bulmaca yerlestirilecekYerNo:posy y:posx];
            if (pozisyon != -1 && [_ekran.tablo[pozisyon] intValue] != -1){
                _ekran.hangiTas = pozisyon + 8;
                _ekran.hareketEdiyor = true;
                [_ekran setNeedsDisplay];
            }
        } else {
            posx = x / _ekran.hucreGenislik - 1;
            if (posx >= 0 && posx < 8 && [_ekran.tahtayaKonduMu[posx] intValue] == 0){
                _ekran.hangiTas = posx;
                _ekran.hareketEdiyor = true;
                [_ekran setNeedsDisplay];
            }
        }
    } else {
        if (hareketAlgilayici.state == UIGestureRecognizerStateEnded){
            _ekran.hareketEdiyor = false;
            if (y < 9 * _ekran.hucreGenislik){
                posx = x / _ekran.hucreGenislik - 1;
                posy = y / _ekran.hucreGenislik - 1;
                pozisyon = [_bulmaca yerlestirilecekYerNo:posy y:posx];
                if (pozisyon != -1 && [_ekran.tablo[pozisyon] intValue] == BOSYER && _ekran.hangiTas >= 0 && _ekran.hangiTas < 8 && [_ekran.tahtayaKonduMu[_ekran.hangiTas] intValue] == 0){
                    _ekran.tahtayaKonduMu[_ekran.hangiTas] = [NSNumber numberWithInt:1];
                    _ekran.tablo[pozisyon] = [NSNumber numberWithInt:_ekran.hangiTas];
                }
            } else {
                posx = x / _ekran.hucreGenislik - 1;
                if (posx >= 0 && posx < 8 && _ekran.hangiTas >= 8 && [_ekran.tahtayaKonduMu[[_ekran.tablo[_ekran.hangiTas - 8] intValue]] intValue] == 1){
                    _ekran.tahtayaKonduMu[[_ekran.tablo[_ekran.hangiTas - 8] intValue]] = [NSNumber numberWithInt:0];
                    _ekran.tablo[_ekran.hangiTas - 8] = [NSNumber numberWithInt:BOSYER];
                }
            }
            [_ekran setNeedsDisplay];
        } else {
            if (hareketAlgilayici.state == UIGestureRecognizerStateChanged){
                _ekran.hareketX = x - _ekran.hucreGenislik / 2;
                _ekran.hareketY = y - _ekran.hucreGenislik / 2;
                [_ekran setNeedsDisplay];
            }
        }
    }
}

- (void) cozumArama{
    NSMutableArray* adaylar;
    if (![_bulmaca sartlariSimdilikSaglar:cozum]){
        return;
    } else {
        if ([cozum tasSayisi] == 8){
            if ([_bulmaca sartlariSaglar:cozum]){
                _bitti = true;
            }
        }
        else{
            adaylar = [cozum adaylariOlustur];
            for (Tas* tas in adaylar){
                [cozum tasEkle:tas];
                [self cozumArama];
                if (_bitti){
                    return;
                }
                [cozum tasCikar];
            }
        }
    }
}

- (void) coz{
    int i;
    _bitti = false;
    cozum = [[Cozum alloc] initWithAll];
    [self cozumArama];
    for (i = 0; i < 8; i++){
        _ekran.tablo[i] = [NSNumber numberWithInt:[cozum tasNo:i]];
        _ekran.tahtayaKonduMu[i] = [NSNumber numberWithInt:1];
    }
}

- (void)viewDidLoad{
    [super viewDidLoad];
    _ekran.tahtaGenislik = [[UIScreen mainScreen] bounds].size.width;
    _ekran.hucreGenislik = _ekran.tahtaGenislik / 10;
    [self dosyaOku];
    [self yeniOyun];
}

-(void)onTimer{
    gecenSaniye++;
    if (gecenSaniye % 60 < 10){
        if (gecenSaniye < 600){
            _zamanGosterge.text = [NSString stringWithFormat:@"0%d:0%d", gecenSaniye / 60, gecenSaniye % 60];
        } else {
            _zamanGosterge.text = [NSString stringWithFormat:@"%d:0%d", gecenSaniye / 60, gecenSaniye % 60];            
        }
    } else {
        if (gecenSaniye < 600){
            _zamanGosterge.text = [NSString stringWithFormat:@"0%d:%2d", gecenSaniye / 60, gecenSaniye % 60];
        } else {
            _zamanGosterge.text = [NSString stringWithFormat:@"%d:%2d", gecenSaniye / 60, gecenSaniye % 60];
        }
    }
}

- (IBAction)cozTikla:(id)sender {
    [self coz];
    [_ekran setNeedsDisplay];
    [zamanlayici invalidate];
    zamanlayici = NULL;
}

- (IBAction)kontrolEtTikla:(id)sender {
    [self cozumKontrol];
    [zamanlayici invalidate];
    zamanlayici = NULL;
}

- (IBAction)yeniOyunTikla:(id)sender {
    [self yeniOyun];
}

@end
