//
//  VucutKitleEndeksi.m
//  VucutKitleEndeksi
//
//  Created by Olcay Taner YILDIZ on 11/17/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "VucutKitleEndeksi.h"

@interface VucutKitleEndeksi ()

@end

@implementation VucutKitleEndeksi

double boy;
double kilo;
double vucutKitleEndeks;

- (void)viewDidLoad{
    [super viewDidLoad];
    boy = 0.0;
    kilo = 0.0;
    vucutKitleEndeks = 0.0;
    [_VucutKitleEndeks setEnabled:false];
}

- (void) sonucGoster{
    vucutKitleEndeks = kilo / (boy * boy);
    if (vucutKitleEndeks < 20){
        [_Durum setText:@"Zayıf"];
    } else {
        if (vucutKitleEndeks < 25){
            [_Durum setText:@"Normal"];
        } else {
            if (vucutKitleEndeks < 30){
                [_Durum setText:@"Hafif Şişman"];
            } else {
                if (vucutKitleEndeks < 35){
                    [_Durum setText:@"Şişman"];                    
                } else {
                    if (vucutKitleEndeks < 45){
                        [_Durum setText:@"Önemli Derecede Şişman"];
                    } else {
                        if (vucutKitleEndeks < 50){
                            [_Durum setText:@"Aşırı Şişman"];                            
                        } else {
                            [_Durum setText:@"Ölümcül Şişman"];                            
                        }
                    }
                }
            }
        }
    }
    [_VucutKitleEndeks setText:[NSString stringWithFormat:@"%.2f", vucutKitleEndeks]];
}

- (IBAction)BoyDegerIzleyici:(id)sender {
    if (_Boy.text.length > 0){
        boy = _Boy.text.doubleValue;
        [self sonucGoster];
    }
}

- (IBAction)KiloDegerIzleyici:(id)sender {
    if (_Kilo.text.length > 0){
        kilo = _Kilo.text.doubleValue;
        [self sonucGoster];
    }
}

@end
