//
//  Konular.m
//  EhliyetSinavi
//
//  Created by Olcay Taner YILDIZ on 9/28/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Konular.h"
#import "EhliyetSinavi.h"

@interface Konular ()

@end

@implementation Konular

- (void)viewDidLoad{
    [super viewDidLoad];
    _Trafik.on = _tercihler.trafikVarMi;
    _Motor.on = _tercihler.motorVarMi;
    _IlkYardim.on = _tercihler.ilkYardimVarMi;
    _TrafikGosterge.value = _tercihler.trafikSoruSayisi;
    _MotorGosterge.value = _tercihler.motorSoruSayisi;
    _IlkYardimGosterge.value = _tercihler.ilkYardimSoruSayisi;
    _TrafikSayac.text = [NSString stringWithFormat:@"%d", (int)_TrafikGosterge.value];
    _MotorSayac.text = [NSString stringWithFormat:@"%d", (int)_MotorGosterge.value];
    _IlkYardimSayac.text = [NSString stringWithFormat:@"%d", (int)_IlkYardimGosterge.value];
}

- (IBAction)KonuTikla:(id)sender {
    NSUserDefaults* temelTercihler = [NSUserDefaults standardUserDefaults];
    switch ([sender tag]){
            case 1:[temelTercihler setBool:_Trafik.on forKey:@"trafikVarMi"];
                    break;
            case 2:[temelTercihler setBool:_Motor.on forKey:@"motorVarMi"];
                    break;
            case 3:[temelTercihler setBool:_IlkYardim.on forKey:@"ilkYardimVarMi"];
                    break;
    }
}

- (IBAction)KonuDegerDegistir:(id)sender {
    NSUserDefaults* temelTercihler = [NSUserDefaults standardUserDefaults];
    switch ([sender tag]){
        case 1:[temelTercihler setInteger:(int)_TrafikGosterge.value forKey:@"trafikSoruSayisi"];
                _TrafikSayac.text = [NSString stringWithFormat:@"%d", (int)_TrafikGosterge.value];
                break;
        case 2:[temelTercihler setInteger:(int)_MotorGosterge.value forKey:@"motorSoruSayisi"];
                _MotorSayac.text = [NSString stringWithFormat:@"%d", (int)_MotorGosterge.value];
                break;
        case 3:[temelTercihler setInteger:(int)_IlkYardimGosterge.value forKey:@"ilkYardimSoruSayisi"];
                _IlkYardimSayac.text = [NSString stringWithFormat:@"%d", (int)_IlkYardimGosterge.value];
                break;
    }
}

@end