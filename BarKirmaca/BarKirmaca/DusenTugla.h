//
//  DusenTugla.h
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/30/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tugla.h"
#import "Cubuk.h"

@interface DusenTugla : NSObject
@property TuglaTip tip;
@property CGRect yer;
@property CGPoint hiz;
- (id)initWithAll:(TuglaTip)tip yer:(CGRect)yer yukseklik:(int)yukseklik;
-(void)hareketEttir;
-(bool)cubuklaTemas:(Cubuk*)cubuk;

@end
