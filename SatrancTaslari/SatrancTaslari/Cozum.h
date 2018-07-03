//
//  Cozum.h
//  SatrancTaslari
//
//  Created by Olcay on 10/27/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Tas.h"

@interface Cozum : NSObject

@property NSMutableArray* taslar;
- (id)initWithAll;
-(NSString*)tasAd:(int)pozisyon;
-(NSMutableArray*)adaylariOlustur;
-(int)tasSayisi;
-(void)tasEkle:(Tas*)tas;
-(void)tasNoIleEkle:(int)tas;
-(void)tasCikar;
-(int)tasNo:(int)pozisyon;

@end
