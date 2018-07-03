//
//  Bulmaca.m
//  SatrancTaslari
//
//  Created by Olcay on 10/27/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "Bulmaca.h"
#import "Kare.h"
#import "Tehdit.h"
#import "Cozum.h"

@implementation Bulmaca

const int BOS = -1;

- (id)initWithAll{
    self = [super init];
    if (self){
        _yerlestirilecekYerler = [[NSMutableArray alloc] init];
        _tehditler = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)yerlestirilecekYerEkle:(Kare*) yer{
    [_yerlestirilecekYerler addObject:yer];
}

- (int)yerlestirilecekYerNo:(int)x y:(int)y{
    int i;
    for (i = 0; i < [_yerlestirilecekYerler count]; i++){
        Kare* kare = _yerlestirilecekYerler[i];
        if ([kare x] == x && [kare y] == y){
            return i;
        }
    }
    return -1;
}

- (int)yerlestirilecekYerSayisi{
    return [_yerlestirilecekYerler count];
}

- (Kare*)yerlestirilecekYer:(int) pozisyon{
    return _yerlestirilecekYerler[pozisyon];
}

- (int)tehditSayisi{
    return [_tehditler count];
}

- (void)tehditEkle:(Tehdit*) tehdit{
    [_tehditler addObject:tehdit];
}

- (Tehdit*)tehdit:(int) pozisyon{
    return _tehditler[pozisyon];
}

-(int) sahKontrol:(Cozum*) cozum x:(int) x y:(int)y{
    int i, j, kim;
    for (i = -1; i < 2; i++)
        for (j = -1; j < 2; j++){
            kim = [self yerlestirilecekYerNo:x + i y:y + j];
            if (kim != -1 && [[cozum tasAd:kim] isEqualToString:@"sah"])
                return 1;
        }
    return 0;
}

- (int) filKontrol:(Cozum*) cozum x:(int) x y:(int) y{
    int xArtis[4] = {1, 1, -1, -1};
    int yArtis[4] = {1, -1, 1, -1};
    int i, j, kim, count = 0, a, b;
    for (j = 0; j < 4; j++){
        for (i = 1; i < 8; i++){
            a = x + i * xArtis[j];
            b = y + i * yArtis[j];
            kim = [self yerlestirilecekYerNo:a y:b];
            if (kim != BOS){
                if ([[cozum tasAd:kim] hasPrefix:@"fil"])
                    count++;
                else
                    break;
            }
        }
    }
    return count;
}

- (int) kaleKontrol:(Cozum*) cozum x:(int)x y:(int) y{
    int xArtis[4] = {1, -1, 0, 0};
    int yArtis[4] = {0, 0, 1, -1};
    int i, j, kim, count = 0, a, b;
    for (j = 0; j < 4; j++){
        for (i = 1; i < 8; i++){
            a = x + i * xArtis[j];
            b = y + i * yArtis[j];
            kim = [self yerlestirilecekYerNo:a y:b];
            if (kim != BOS){
                if ([[cozum tasAd:kim] hasPrefix:@"kale"])
                    count++;
                else
                    break;
            }
        }
    }
    return count;
}

- (int) vezirKontrol:(Cozum*) cozum x:(int) x y:(int) y{
    int xArtis[8] = {1, 1, -1, -1, 1, -1, 0, 0};
    int yArtis[8] = {1, -1, 1, -1, 0, 0, 1, -1};
    int i, j, kim, a, b;
    for (j = 0; j < 8; j++){
        for (i = 1; i < 8; i++){
            a = x + i * xArtis[j];
            b = y + i * yArtis[j];
            kim = [self yerlestirilecekYerNo:a y:b];
            if (kim != BOS){
                if ([[cozum tasAd:kim] isEqualToString:@"vezir"])
                    return 1;
                else
                    break;
            }
        }
    }
    return 0;
}

- (int) atKontrol:(Cozum*) cozum x:(int) x y:(int) y{
    int xArtis[8] = {1, 2, 1, -1, -1, 2, -2, -2};
    int yArtis[8] = {-2, -1, 2, 2, -2, 1, 1, -1};
    int j, kim, a, b, count = 0;
    for (j = 0; j < 8; j++){
        a = x + xArtis[j];
        b = y + yArtis[j];
        kim = [self yerlestirilecekYerNo:a y:b];
        if (kim != BOS){
            if ([[cozum tasAd:kim] hasPrefix:@"at"])
                count++;
            else
                break;
        }
    }
    return count;
}

-(bool) sartlariSaglar:(Cozum*) cozum{
    int i, x, y, count;
    for (i = 0; i < [_tehditler count]; i++){
        Tehdit* tehdit = _tehditler[i];
        x = [tehdit x];
        y = [tehdit y];
        count = [self sahKontrol:cozum x:x y:y] + [self filKontrol:cozum x:x y:y] + [self kaleKontrol:cozum x:x y:y] + [self vezirKontrol:cozum x:x y:y] + [self atKontrol:cozum x:x y:y];
        if (count != [tehdit tehditSayisi])
            return false;
    }
    return true;
}

-(bool) sartlariSimdilikSaglar:(Cozum*) cozum{
    int i, x, y, count;
    for (i = 0; i < [_tehditler count]; i++){
        Tehdit* tehdit = _tehditler[i];
        x = [tehdit x];
        y = [tehdit y];
        count = [self sahKontrol:cozum x:x y:y] + [self filKontrol:cozum x:x y:y] + [self kaleKontrol:cozum x:x y:y] + [self vezirKontrol:cozum x:x y:y] + [self atKontrol:cozum x:x y:y];
        if (count > [tehdit tehditSayisi])
            return false;
    }
    return true;
}

@end
