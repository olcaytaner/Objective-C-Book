//
//  Deste.h
//  Pisti
//
//  Created by Olcay on 10/14/14.
//  Copyright (c) 2014 Olcay. All rights reserved.
//

#import "Kart.h"
#import "Orta.h"
#import "El.h"

@interface Deste : NSObject

@property NSMutableArray* kartlar;
- (id)initWithAll;
-(void)ortaDagit:(Orta*)orta;
-(El*)elDagit;

@end
