//
//  SatrancTaslari.h
//  SatrancTaslari
//
//  Created by Olcay Taner YILDIZ on 10/23/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Ekran.h"
#import "Bulmaca.h"

@interface SatrancTaslari : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *zamanGosterge;
@property Bulmaca* bulmaca;
@property bool bitti;
@property NSMutableArray* bulmacalar;
@property int soruSayisi;
@property (strong, nonatomic) IBOutlet Ekran *ekran;

- (IBAction)hareketEttir:(UIPanGestureRecognizer *)hareketAlgilayici;
- (IBAction)cozTikla:(id)sender;
- (IBAction)kontrolEtTikla:(id)sender;
- (IBAction)yeniOyunTikla:(id)sender;

@end
