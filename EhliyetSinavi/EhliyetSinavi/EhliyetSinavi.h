//
//  EhliyetSinavi.h
//  EhliyetSinavi
//
//  Created by Olcay Taner YILDIZ on 9/28/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tercihler.h"
#import "Konular.h"

@interface EhliyetSinavi : UIViewController

@property Tercihler* tercihler;
@property int trafikSoruSayisi;
@property int motorSoruSayisi;
@property int ilkYardimSoruSayisi;
@property int dogruCevapSayisi;
@property int soruNo;
@property int dogruCevap;
@property NSMutableArray* sorular;
@property (weak, nonatomic) IBOutlet UITextView *Soru;
@property (weak, nonatomic) IBOutlet UIButton *Cevap1;
@property (weak, nonatomic) IBOutlet UIButton *Cevap2;
@property (weak, nonatomic) IBOutlet UIButton *Cevap3;
@property (weak, nonatomic) IBOutlet UIButton *Cevap4;
@property Konular* konular;
- (IBAction)unwindToEhliyetSinavi:(UIStoryboardSegue *)unwindSegue;
- (IBAction)CevapTikla:(id)sender;
- (IBAction)SinaviBaslatTikla:(id)sender;

@end
