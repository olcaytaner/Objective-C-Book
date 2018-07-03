//
//  Seviye.h
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/29/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tugla.h"

@interface Seviye : NSObject
@property NSMutableArray* satirlar;
@property int satir;
@property int sutun;
@property int seviyeNo;
- (id)initWithAll:(int)satir sutun:(int)sutun genislik:(int)genislik seviyeNo:(int)seviyeNo;
- (void)satirAyarla:(int)satirNo satirBilgi:(NSString*)satirBilgi;
-(Tugla*)tugla:(int)satir sutun:(int)sutun;
-(bool)bittiMi;
@end
