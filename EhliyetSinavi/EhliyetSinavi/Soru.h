//
//  Soru.h
//  EhliyetSinavi
//
//  Created by Olcay Taner YILDIZ on 9/28/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

@interface Soru : NSObject

@property (readonly) NSString* soruTipi;
@property (readonly) NSString* soruCumle;
@property (readonly) NSString* cevap1;
@property (readonly) NSString* cevap2;
@property (readonly) NSString* cevap3;
@property (readonly) NSString* cevap4;
@property (readonly) NSString* dogruCevap;
- (id)initWithAll:(NSString *)aSoruTipi soruCumle:(NSString *)aSoruCumle cevap1:(NSString *)aCevap1 cevap2:(NSString *)aCevap2 cevap3:(NSString *)aCevap3 cevap4:(NSString *)aCevap4 dogruCevap:(NSString *)aDogruCevap;

@end
