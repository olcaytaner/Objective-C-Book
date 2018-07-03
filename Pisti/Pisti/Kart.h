//
//  Kart.h
//  Pisti
//
//  Created by Olcay on 10/14/14.
//  Copyright (c) 2014 Olcay. All rights reserved.
//

@interface Kart : NSObject

@property (readonly) NSString* tip;
@property (readonly) int deger;
- (id)initWithAll:(NSString *)aKartTipi kartDeger:(int)aKartDeger;
-(NSString*) description;

@end
