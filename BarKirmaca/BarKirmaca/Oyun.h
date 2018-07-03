//
//  Oyun.h
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/29/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Seviye.h"

@interface Oyun : NSObject
@property NSMutableArray* seviyeler;
@property int seviyeSayisi;
- (id)initWithAll:(NSString*)dosyaAd genislik:(int)genislik;
- (Seviye*)seviye:(int)pozisyon;
@end
