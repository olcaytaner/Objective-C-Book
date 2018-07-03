//
//  HesapMakinesi.m
//
//  Created by Olcay Taner YILDIZ on 9/21/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "HesapMakinesi.h"

@interface HesapMakinesi ()
@end

@implementation HesapMakinesi
char oncekiIslem;
int oncekiSayi;
int sayi;
int hafiza;

- (void)viewDidLoad{
    [super viewDidLoad];
    oncekiIslem = '=';
    oncekiSayi = 0;
    sayi = 0;
    hafiza = 0;
    [_Sonuc setEnabled:false];
}

- (void)ekrandaGoster:(int) sayi{
    _Sonuc.text = [NSString stringWithFormat:@"%d", sayi];
}

- (void)sayiEkle:(int) rakam{
    sayi = sayi * 10 + rakam;
    [self ekrandaGoster:sayi];
}

- (void)islemYap:(char) islem{
    switch (oncekiIslem) {
        case '+':oncekiSayi = oncekiSayi + sayi;
                break;
        case '-':oncekiSayi = oncekiSayi - sayi;
                break;
        case 'x':oncekiSayi = oncekiSayi * sayi;
                break;
        case '/':if (sayi != 0)
                    oncekiSayi = oncekiSayi / sayi;
                break;
        case '=':oncekiSayi = sayi;
                break;
    }
    oncekiIslem = islem;
    sayi = 0;
    [self ekrandaGoster:oncekiSayi];
}

- (IBAction)Dugme1Tikla:(id)sender {
    [self sayiEkle:1];
}

- (IBAction)Dugme2Tikla:(id)sender {
    [self sayiEkle:2];
}

- (IBAction)Dugme3Tikla:(id)sender {
    [self sayiEkle:3];
}

- (IBAction)Dugme4Tikla:(id)sender {
    [self sayiEkle:4];
}

- (IBAction)Dugme5Tikla:(id)sender {
    [self sayiEkle:5];
}

- (IBAction)Dugme6Tikla:(id)sender {
    [self sayiEkle:6];
}

- (IBAction)Dugme7Tikla:(id)sender {
    [self sayiEkle:7];
}

- (IBAction)Dugme8Tikla:(id)sender {
    [self sayiEkle:8];
}

- (IBAction)Dugme9Tikla:(id)sender {
    [self sayiEkle:9];
}

- (IBAction)Dugme0Tikla:(id)sender {
    [self sayiEkle:0];
}

- (IBAction)DugmeArtiTikla:(id)sender {
    [self islemYap:'+'];
}

- (IBAction)DugmeEksiTikla:(id)sender {
    [self islemYap:'-'];
}

- (IBAction)DugmeCarpiTikla:(id)sender {
    [self islemYap:'x'];
}

- (IBAction)DugmeBoluTikla:(id)sender {
    [self islemYap:'/'];
}

- (IBAction)DugmeEsitTikla:(id)sender {
    [self islemYap:'='];
    sayi = oncekiSayi;
    oncekiSayi = 0;
}

- (IBAction)DugmeSilTikla:(id)sender {
    sayi = 0;
    [self ekrandaGoster:sayi];
}

- (IBAction)DugmeHafizayaEkleTikla:(id)sender {
    hafiza += sayi;
    sayi = 0;
}

- (IBAction)DugmeHafizadanCikarTikla:(id)sender {
    hafiza -= sayi;
    sayi = 0;
}

- (IBAction)DugmeHafizayiGosterTikla:(id)sender {
    sayi = hafiza;
    [self ekrandaGoster:sayi];
}

- (IBAction)DugmeHafizayiSilTikla:(id)sender {
    hafiza = 0;
}
@end
