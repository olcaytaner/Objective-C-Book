//
//  Ekran.h
//  SatrancTaslari
//
//  Created by Olcay Taner YILDIZ on 10/25/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bulmaca.h"

@interface Ekran : UIView

@property int tahtaGenislik;
@property int hucreGenislik;
@property Bulmaca* bulmaca;
@property NSMutableArray* tablo;
@property NSMutableArray* tahtayaKonduMu;
@property int hareketX;
@property int hareketY;
@property bool hareketEdiyor;
@property int hangiTas;

@end
