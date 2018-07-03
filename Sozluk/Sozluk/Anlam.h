//
//  Anlam.h
//  Sozluk
//
//  Created by Olcay Taner YILDIZ on 11/8/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Anlam : NSObject
@property NSString* sinif;
@property NSString* anlam;
- (id)initWithAll:(NSString*)sinif anlam:(NSString*)anlam;
- (id)initWithAll:(NSString*)anlam;
@end
