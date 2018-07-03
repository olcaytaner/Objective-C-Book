//
//  Piramit.m
//  Piramit
//
//  Created by Olcay Taner YILDIZ on 11/18/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Piramit.h"
#import "Bulmaca.h"

@interface Piramit ()

@end


@implementation Piramit

- (void)viewDidLoad{
    [super viewDidLoad];
    NSArray* bulmacaBilgileri = [NSArray arrayWithObjects:@"443252145336141522663", @"234524435626143614625", @"161524246313452326215", @"355424315665631243245", @"653634542621351325265", @"543236612135654465432", @"445385279314268683141725276595138379834941283", @"345342468929768161215485464767167583529398619", @"233154981265474421359918793858356165737438971", @"134925548326192374564412375353491475182356918", nil];
    _bulmacalar = [[NSMutableArray alloc] initWithCapacity:bulmacaBilgileri.count];
    for (int i = 0; i < bulmacaBilgileri.count; i++){
        _bulmacalar[i] = [[Bulmaca alloc] initWithAll:bulmacaBilgileri[i]];
    }
    _ekran.bulmaca = _bulmacalar[arc4random_uniform([_bulmacalar count])];
    _ekran.hucreGenislik = [[UIScreen mainScreen] bounds].size.width / (_ekran.bulmaca.buyukluk + 2);
    [_ekran setNeedsDisplay];
}

- (IBAction)hucreTikla:(id)sender {
    float x1, y1;
    CGPoint nokta = [sender locationInView:self.view];
    for (int i = 0; i < _ekran.bulmaca.buyukluk; i++){
        for (int j = 0; j <= i; j++){
            x1 = (j + (_ekran.bulmaca.buyukluk - i + 1) / 2.0) * _ekran.hucreGenislik;
            y1 = (i + 1) * _ekran.hucreGenislik;
            CGRect alan = CGRectMake(x1, y1, _ekran.hucreGenislik, _ekran.hucreGenislik);
            if (nokta.x >= alan.origin.x && nokta.x <= alan.origin.x + alan.size.width &&
                nokta.y >= alan.origin.y && nokta.y <= alan.origin.y + alan.size.height){
                [_ekran.bulmaca oyna:i deger:j];
                [_ekran setNeedsDisplay];
                return;
            }
        }
    }
}

@end
