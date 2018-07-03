//
//  HesapMakinesi.h
//
//  Created by Olcay Taner YILDIZ on 9/21/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HesapMakinesi : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *Sonuc;
- (IBAction)Dugme1Tikla:(id)sender;
- (IBAction)Dugme2Tikla:(id)sender;
- (IBAction)Dugme3Tikla:(id)sender;
- (IBAction)Dugme4Tikla:(id)sender;
- (IBAction)Dugme5Tikla:(id)sender;
- (IBAction)Dugme6Tikla:(id)sender;
- (IBAction)Dugme7Tikla:(id)sender;
- (IBAction)Dugme8Tikla:(id)sender;
- (IBAction)Dugme9Tikla:(id)sender;
- (IBAction)Dugme0Tikla:(id)sender;
- (IBAction)DugmeArtiTikla:(id)sender;
- (IBAction)DugmeEksiTikla:(id)sender;
- (IBAction)DugmeCarpiTikla:(id)sender;
- (IBAction)DugmeBoluTikla:(id)sender;
- (IBAction)DugmeEsitTikla:(id)sender;
- (IBAction)DugmeSilTikla:(id)sender;
- (IBAction)DugmeHafizayaEkleTikla:(id)sender;
- (IBAction)DugmeHafizadanCikarTikla:(id)sender;
- (IBAction)DugmeHafizayiGosterTikla:(id)sender;
- (IBAction)DugmeHafizayiSilTikla:(id)sender;


@end
