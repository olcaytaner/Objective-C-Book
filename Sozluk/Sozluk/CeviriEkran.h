//
//  CeviriEkran.h
//  Sozluk
//
//  Created by Olcay Taner YILDIZ on 11/8/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CeviriSozluk.h"

@interface CeviriEkran : UITableViewController <UISearchDisplayDelegate>
@property CeviriSozluk* ceviriSozluk;
@end
