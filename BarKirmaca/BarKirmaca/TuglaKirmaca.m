//
//  TuglaKirmaca.m
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/29/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "TuglaKirmaca.h"
#import "Parametre.h"
#import "Top.h"
#import "DusenTugla.h"

@interface TuglaKirmaca ()

@end

NSTimer* zamanlayici = NULL;
bool hareketBasladi = false;

@implementation TuglaKirmaca

int ekranGenislik;
int ekranYukseklik;
int fark;

- (void)yeniSeviye{
    _seviyeNo++;
    [_ekran.parametre yeniSeviye:[_oyun seviye:_seviyeNo]];
    zamanlayici = [NSTimer scheduledTimerWithTimeInterval:0.01 target: self selector:@selector(onTimer) userInfo: nil repeats: YES];
}

- (void)viewDidLoad{
    Parametre* oyunParametre;
    [super viewDidLoad];
    ekranGenislik = [[UIScreen mainScreen] bounds].size.width;
    ekranYukseklik = [[UIScreen mainScreen] bounds].size.height;
    _seviyeNo = 0;
    _oyun = [[Oyun alloc] initWithAll:@"seviyeler" genislik:ekranGenislik];
    oyunParametre = [[Parametre alloc] initWithAll:ekranGenislik yukseklik:ekranYukseklik seviye:[_oyun seviye:0]];
    _ekran.parametre = oyunParametre;
    zamanlayici = [NSTimer scheduledTimerWithTimeInterval:0.01 target: self selector:@selector(onTimer) userInfo: nil repeats: YES];
}

-(void)onTimer{
    Top* top;
    DusenTugla* dusenTugla;
    for (int i = 0; i < [_ekran.parametre topSayisi]; i++){
        top = [_ekran.parametre top:i];
        [top hareketEttir];
        [_ekran.parametre topCubuklaTemasKontrol:top];
        if ([_ekran.parametre topTuglaylaTemasKontrol:top]){
            [zamanlayici invalidate];
            [self yeniSeviye];
            return;
        }
        if (![_ekran.parametre topSinirlarlaTemasKontrol:top]){
            [zamanlayici invalidate];
        }
    }
    for (int i = 0; i < [_ekran.parametre dusenTuglaSayisi]; i++){
        dusenTugla = [_ekran.parametre dusenTugla:i];
        [dusenTugla hareketEttir];
        if (![_ekran.parametre dusenTuglaCubuklaTemasKontrol])
            [zamanlayici invalidate];
    }
    [_ekran setNeedsDisplay];
}

- (IBAction)hareketEttir:(UIPanGestureRecognizer *)hareketAlgilayici {
    CGPoint p = [hareketAlgilayici locationInView:hareketAlgilayici.view];
    if (hareketAlgilayici.state == UIGestureRecognizerStateBegan){
        if ([_ekran.parametre elleCubukTemas:p.x y:p.y]){
            fark = p.x - [_ekran.parametre cubuk].yer.origin.x;
            hareketBasladi = true;
        } else {
            hareketBasladi = false;
        }
    } else {
        if (hareketAlgilayici.state == UIGestureRecognizerStateEnded){
            if (hareketBasladi){
                [_ekran.parametre cubukYeniX:p.x - fark];
                [_ekran setNeedsDisplay];
            }
            hareketBasladi = false;
        } else {
            if (hareketAlgilayici.state == UIGestureRecognizerStateChanged){
                if (hareketBasladi){
                    [_ekran.parametre cubukYeniX:p.x - fark];
                    [_ekran setNeedsDisplay];
                }
            }
        }
    }
}

@end
