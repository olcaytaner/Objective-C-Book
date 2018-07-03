//
//  Piramit.h
//  Piramit
//
//  Created by Olcay Taner YILDIZ on 11/18/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ekran.h"

@interface Piramit : UIViewController
@property (strong, nonatomic) IBOutlet Ekran *ekran;
@property NSMutableArray* bulmacalar;
- (IBAction)hucreTikla:(id)sender;
@end
