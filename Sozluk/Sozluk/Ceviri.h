//
//  Ceviri.h
//  Sozluk
//
//  Created by Olcay Taner YILDIZ on 11/8/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Anlam.h"

@interface Ceviri : NSObject
@property NSString* sinif;
@property Anlam* anlam;
- (id)initWithAll:(NSString*)sinif anlam:(Anlam*)anlam;
- (id)initWithAll:(Anlam*)anlam;
@end
