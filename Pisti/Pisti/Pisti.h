//
//  Pisti.h
//  Pisti
//
//  Created by Olcay on 10/14/14.
//  Copyright (c) 2014 Olcay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deste.h"
#import "Orta.h"
#import "El.h"
#import "Kazanc.h"

@interface Pisti : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *kartlar;
@property (weak, nonatomic) IBOutlet UIImageView *ortaKart;
@property UIImageView* animasyonKart;
- (IBAction)kartTikla:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *bilgisayarKartlar;
@property Deste* deste;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *kapaliKartlar;
@property Orta* orta;
@property El* insan;
@property El* bilgisayar;
@property Kazanc* insanKazanc;
@property Kazanc* bilgisayarKazanc;
@property int tur;
@property int hamle;

@end
