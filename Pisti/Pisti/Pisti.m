//
//  ViewController.m
//  Pisti
//
//  Created by Olcay on 10/14/14.
//  Copyright (c) 2014 Olcay. All rights reserved.
//

#include <QuartzCore/QuartzCore.h>
#import "Pisti.h"
#import "Deste.h"
#import "Orta.h"
#import "Kazanc.h"

@interface Pisti ()

@end

@implementation Pisti

-(void)ortayiGoster{
    for (UIImageView* view in _kapaliKartlar){
        if ([view tag] > [_orta kartSayisi] + 7){
            [view setHidden:true];
        } else {
            [view setHidden:false];
        }
    }
    [self.view bringSubviewToFront:_ortaKart];
}

-(void)animasyon:(UIImageView*)kart animasyonAd:(NSString*)ad{
    CABasicAnimation *animasyon = [CABasicAnimation animationWithKeyPath:@"position"];
    animasyon.additive = YES;
    animasyon.fromValue = [NSValue valueWithCGPoint:CGPointZero];    
    animasyon.toValue = [NSValue valueWithCGPoint:CGPointMake(_ortaKart.frame.origin.x - kart.frame.origin.x, _ortaKart.frame.origin.y - kart.frame.origin.y)];
    animasyon.autoreverses = NO;
    animasyon.duration = 1;
    animasyon.repeatCount = 1;
    animasyon.delegate = self;
    [kart.layer addAnimation:animasyon forKey:ad];
}

- (void)animationDidStop:(CABasicAnimation *)animasyon finished:(BOOL)flag{
    [_animasyonKart setHidden:true];
    if (_animasyonKart.tag < 4){
        [self oyna:_insan kazanc:_insanKazanc kart:_animasyonKart.tag];
        [self bilgisayarDusun];
    } else {
        [_animasyonKart setImage:[UIImage imageNamed:@"bos.png"]];
        [self oyna:_bilgisayar kazanc:_bilgisayarKazanc kart:_animasyonKart.tag - 4];
        [self oyunuDevamEttir];
    }
}

-(void)oyna:(El*)el kazanc:(Kazanc*)aKazanc kart:(int)aKart{
    Kart* kart = [el oyna:aKart];
    [_orta kartEkle:kart];
    if ([_orta kazancVarMi]){
        [_orta kazancaGonder:aKazanc];
        [self ortayiGoster];
        [_ortaKart setImage:NULL];
    } else {
        [self ortayiGoster];
        [_ortaKart setImage:[UIImage imageNamed: [[[_orta ustKart] description] stringByAppendingString:@".png"]]];
    }
}

-(void)oyunBitti{
    int bilgisayarPuan = [_bilgisayarKazanc puan];
    int insanPuan = [_insanKazanc puan];
    if ([_bilgisayarKazanc kartSayisi] > [_insanKazanc kartSayisi]){
        bilgisayarPuan += 3;
    } else {
        insanPuan += 3;
    }
    NSString *mesaj = [NSString stringWithFormat:@"Bilgisayar:%d İnsan:%d", bilgisayarPuan, insanPuan];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oyun Bitti!" message:mesaj
                                                   delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
}

-(void)oyunuDevamEttir{
    _hamle++;
    if (_hamle == 4){
        _hamle = 0;
        _tur++;
        if (_tur < 6){
            [self turaBasla];
            [self ortayiGoster];
        } else {
            [self oyunBitti];
        }
    }
}

-(int)ayniKagitVarMi{
    for (int i = 0; i < 4; i++){
        if (![_bilgisayar oynandiMi:i] && [[_bilgisayar kartGetir:i] deger] == [[_orta ustKart] deger]){
            return i;
        }
    }
    return -1;
}

-(int)valeVarMi{
    for (int i = 0; i < 4; i++){
        if (![_bilgisayar oynandiMi:i] && [[_bilgisayar kartGetir:i] deger] == 11){
            return i;
        }
    }    
    return -1;
}

-(int)rastgeleOyna{
    int kart = arc4random_uniform(4);
    while ([_bilgisayar oynandiMi:kart]){
        kart = arc4random_uniform(4);
    }
    return kart;
}

-(void)bilgisayarDusun{
    int secilenKart = -1;
    if ([_orta ustKart] != NULL){
        secilenKart = [self ayniKagitVarMi];
        if (secilenKart == -1){
            secilenKart = [self valeVarMi];
        }
    }
    if (secilenKart == -1){
        secilenKart = [self rastgeleOyna];
    }
    for (UIImageView* view in _bilgisayarKartlar){
        if ([view tag] == secilenKart + 4){
            _animasyonKart = view;
            [_animasyonKart setImage:[UIImage imageNamed: [[[_bilgisayar kartGetir:[_animasyonKart tag] - 4] description] stringByAppendingString:@".png"]]];
            [self animasyon:view animasyonAd:@"bilgisayar"];
            break;
        }
    }
}

-(void)turaBasla{
    _insan = [_deste elDagit];
    _bilgisayar = [_deste elDagit];
    for (int i = 0; i < 4; i++){
        [_kartlar[i] setImage:[UIImage imageNamed: [[[_insan kartGetir:[_kartlar[i] tag]] description] stringByAppendingString:@".png"]]];
        [_kartlar[i] setHidden:false];
    }
    if ([_orta ustKart] != NULL){
        [_ortaKart setImage:[UIImage imageNamed: [[[_orta ustKart] description] stringByAppendingString:@".png"]]];
    } else {
        [_ortaKart setImage:NULL];
    }
    for (int i = 0; i < 4; i++){
        [_bilgisayarKartlar[i] setHidden:false];
    }
    _hamle = 0;
}

- (void)oyunaBasla{
    _tur = 0;
    _deste = [[Deste alloc] initWithAll];
    _orta = [[Orta alloc] initWithAll];
    _insanKazanc = [[Kazanc alloc] initWithAll];
    _bilgisayarKazanc = [[Kazanc alloc] initWithAll];
    [_deste ortaDagit:_orta];
    [self turaBasla];
    [self ortayiGoster];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self oyunaBasla];
}

-(bool)bolgeninIcinde:(UIImageView*)kart secilenNokta:(CGPoint)aNokta{
    if (aNokta.x > kart.frame.origin.x && aNokta.x < kart.frame.origin.x + kart.frame.size.width &&
        aNokta.y > kart.frame.origin.y && aNokta.y < kart.frame.origin.y + kart.frame.size.height){
        return true;
    } else {
        return false;
    }
}

-(UIImageView*)hangiKart:(CGPoint)nokta{
    for (UIImageView* view in _kartlar){
        if ([self bolgeninIcinde:view secilenNokta:nokta]){
            return view;
        }
    }
    return NULL;
}

- (IBAction)kartTikla:(id)sender {
    UIImageView* secilenKart;
    CGPoint nokta = [sender locationInView:self.view];
    secilenKart = [self hangiKart:nokta];
    if (secilenKart == NULL || [_insan oynandiMi:secilenKart.tag])
        return;
    _animasyonKart = secilenKart;
    [self animasyon:secilenKart animasyonAd:@"insan"];
}

@end
