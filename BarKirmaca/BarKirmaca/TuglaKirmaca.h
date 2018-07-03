//
//  TuglaKirmaca.h
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/29/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ekran.h"
#import "Oyun.h"

@interface TuglaKirmaca : UIViewController

@property (strong, nonatomic) IBOutlet Ekran *ekran;
@property Oyun* oyun;
@property int seviyeNo;
- (IBAction)hareketEttir:(UIPanGestureRecognizer *)hareketAlgilayici;

@end
