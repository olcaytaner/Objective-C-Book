//
//  Konular.h
//  EhliyetSinavi
//
//  Created by Olcay Taner YILDIZ on 9/28/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tercihler.h"

@interface Konular : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *Trafik;
@property (weak, nonatomic) IBOutlet UISwitch *Motor;
@property (weak, nonatomic) IBOutlet UISwitch *IlkYardim;
@property (weak, nonatomic) IBOutlet UIStepper *TrafikGosterge;
@property (weak, nonatomic) IBOutlet UIStepper *MotorGosterge;
@property (weak, nonatomic) IBOutlet UIStepper *IlkYardimGosterge;
@property (weak, nonatomic) IBOutlet UILabel *TrafikSayac;
@property (weak, nonatomic) IBOutlet UILabel *MotorSayac;
@property (weak, nonatomic) IBOutlet UILabel *IlkYardimSayac;
@property Tercihler* tercihler;
- (IBAction)KonuTikla:(id)sender;
- (IBAction)KonuDegerDegistir:(id)sender;

@end
