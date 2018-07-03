//
//  Tugla.h
//  BarKirmaca
//
//  Created by Olcay Taner YILDIZ on 10/29/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    NORMAL = 1,
    ZOR,
    HIZLI,
    YAVAS,
    BUYUK,
    KUCUK,
    YASAM,
    OLUM,
    COKTOP
}TuglaTip;

@interface Tugla : NSObject
@property TuglaTip tip;
@property CGRect yer;
@property bool kirildi;
@property int vurmaSayisi;
- (id)initWithAll:(TuglaTip)tip yer:(CGRect)yer;
- (void)vuruldu;
@end
