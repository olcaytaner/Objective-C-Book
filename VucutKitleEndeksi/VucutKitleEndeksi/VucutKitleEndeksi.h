//
//  VucutKutleEndeksi.h
//  VucutKutleEndeksi
//
//  Created by Olcay Taner YILDIZ on 11/17/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VucutKitleEndeksi : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *Boy;
@property (weak, nonatomic) IBOutlet UITextField *Kilo;
@property (weak, nonatomic) IBOutlet UILabel *Durum;
@property (weak, nonatomic) IBOutlet UITextField *VucutKitleEndeks;
- (IBAction)BoyDegerIzleyici:(id)sender;
- (IBAction)KiloDegerIzleyici:(id)sender;
@end
