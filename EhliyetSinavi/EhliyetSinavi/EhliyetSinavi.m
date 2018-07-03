//
//  EhliyetSinavi.m
//  EhliyetSinavi
//
//  Created by Olcay Taner YILDIZ on 9/28/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "EhliyetSinavi.h"
#import "Soru.h"
#import "Tercihler.h"

@interface EhliyetSinavi ()
@end

@implementation EhliyetSinavi

- (void) tercihleriOku{
    NSURL *temelTercihDosyasi = [[NSBundle mainBundle]
                               URLForResource:@"TemelTercihler" withExtension:@"plist"];
    NSDictionary *temelTercihListesi = [NSDictionary dictionaryWithContentsOfURL:temelTercihDosyasi];
    [[NSUserDefaults standardUserDefaults] registerDefaults:temelTercihListesi];
    NSUserDefaults* temelTercihler = [NSUserDefaults standardUserDefaults];
    _tercihler = [[Tercihler alloc] initWithAll:[temelTercihler boolForKey:@"trafikVarMi"] motorVarMi:[temelTercihler boolForKey:@"motorVarMi"] ilkYardimVarMi:[temelTercihler boolForKey:@"ilkYardimVarMi"] trafikSoruSayisi:[temelTercihler integerForKey:@"trafikSoruSayisi"] motorSoruSayisi:[temelTercihler integerForKey:@"motorSoruSayisi"] ilkYardimSoruSayisi:[temelTercihler integerForKey:@"ilkYardimSoruSayisi"]];
}

- (void) soruDosyasiOku{
    NSString *dosyaAdi, *dosyaIcerik;
    NSArray *satirlar, *soruIcerik;
    Soru *yeniSoru;
    dosyaAdi = [[NSBundle mainBundle] pathForResource:@"ehliyet"
                                               ofType:@"txt"];
    dosyaIcerik = [NSString stringWithContentsOfFile:dosyaAdi
                                            encoding:NSUTF16StringEncoding
                                               error:NULL];
    satirlar = [dosyaIcerik componentsSeparatedByString:@"\n"];
    _sorular = [[NSMutableArray alloc] init];
    for (NSString* soru in satirlar){
        soruIcerik = [soru componentsSeparatedByString:@";"];
        if (([soruIcerik[0] isEqualToString:@"T"] || [soruIcerik[0] isEqualToString:@"M"] || [soruIcerik[0] isEqualToString:@"Y"])
            && ([soruIcerik[6] isEqualToString:@"A"] || [soruIcerik[6] isEqualToString:@"B"] || [soruIcerik[6] isEqualToString:@"C"] || [soruIcerik[6] isEqualToString:@"D"])){
            yeniSoru = [[Soru alloc] initWithAll:soruIcerik[0] soruCumle:soruIcerik[1] cevap1:soruIcerik[2] cevap2:soruIcerik[3] cevap3:soruIcerik[4] cevap4:soruIcerik[5] dogruCevap:soruIcerik[6]];
            [_sorular addObject:yeniSoru];
        }
    }
}

-(Soru*) simdikiSoruyuBul{
    int hangiSoru, i;
    NSString* soruTipi;
    if (_soruNo < _trafikSoruSayisi){
        hangiSoru = _soruNo;
        soruTipi = @"T";
    } else {
        if (_soruNo < _trafikSoruSayisi + _motorSoruSayisi){
            hangiSoru = _soruNo - _trafikSoruSayisi;
            soruTipi = @"M";
        } else {
            hangiSoru = _soruNo - _trafikSoruSayisi - _motorSoruSayisi;
            soruTipi = @"Y";
        }
    }
    i = 0;
    for (Soru* soru in _sorular){
        if ([[soru soruTipi] isEqualToString:soruTipi]){
            if (i == hangiSoru){
                return soru;
            } else {
                i++;
            }
        }
    }
    return nil;
}

- (void)karistir{
    NSInteger count = [_sorular count];
    for (NSInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform(remainingCount);
        [_sorular exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

- (void)simdikiSoruyuGoster{
    Soru* simdikiSoru;
    simdikiSoru = [self simdikiSoruyuBul];
    if (simdikiSoru != nil){
        NSString *soruNo = [NSString stringWithFormat:@"%d) ", _soruNo + 1];
        [_Soru setText:[soruNo stringByAppendingString:[simdikiSoru soruCumle]]];
        [_Cevap1 setTitle:[@"A) " stringByAppendingString:[simdikiSoru cevap1]] forState:UIControlStateNormal];
        [_Cevap2 setTitle:[@"B) " stringByAppendingString:[simdikiSoru cevap2]] forState:UIControlStateNormal];
        [_Cevap3 setTitle:[@"C) " stringByAppendingString:[simdikiSoru cevap3]] forState:UIControlStateNormal];
        [_Cevap4 setTitle:[@"D) " stringByAppendingString:[simdikiSoru cevap4]] forState:UIControlStateNormal];
        if ([[simdikiSoru dogruCevap] isEqualToString:@"A"]){
            _dogruCevap = 1;
        } else {
            if ([[simdikiSoru dogruCevap] isEqualToString:@"B"]){
                _dogruCevap = 2;
            } else {
                if ([[simdikiSoru dogruCevap] isEqualToString:@"C"]){
                    _dogruCevap = 3;
                } else {
                    _dogruCevap = 4;
                }
            }
        }
    }
}

- (void)sinaviBaslat{
    if (![_tercihler trafikVarMi])
        _trafikSoruSayisi = 0;
    else
        _trafikSoruSayisi = [_tercihler trafikSoruSayisi];
    if (![_tercihler motorVarMi])
        _motorSoruSayisi = 0;
    else
        _motorSoruSayisi = [_tercihler motorSoruSayisi];
    if (![_tercihler ilkYardimVarMi])
        _ilkYardimSoruSayisi = 0;
    else
        _ilkYardimSoruSayisi = [_tercihler ilkYardimSoruSayisi];
    _soruNo = 0;
    _dogruCevapSayisi = 0;
    [self karistir];
    [self simdikiSoruyuGoster];
    [_Cevap1 setEnabled:true];
    [_Cevap2 setEnabled:true];
    [_Cevap3 setEnabled:true];
    [_Cevap4 setEnabled:true];
}

- (void)viewDidLoad{
    [_Soru setEditable:false];
    [super viewDidLoad];
    [self soruDosyasiOku];
    [self tercihleriOku];
    [self sinaviBaslat];
}

- (IBAction)CevapTikla:(id)sender {
    if ([sender tag] == _dogruCevap){
        _dogruCevapSayisi++;
    }
    _soruNo++;
    if (_soruNo < _trafikSoruSayisi + _motorSoruSayisi + _ilkYardimSoruSayisi){
        [self simdikiSoruyuGoster];
    } else {
        NSString *mesaj = [NSString stringWithFormat:@"%d soruyu doğru cevapladınız!", _dogruCevapSayisi];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sınav Bitti!" message:mesaj
                                                       delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [alert show];
        [_Cevap1 setEnabled:false];
        [_Cevap2 setEnabled:false];
        [_Cevap3 setEnabled:false];
        [_Cevap4 setEnabled:false];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"tercihSecimi"]){
        Konular *konular = (Konular *)[segue destinationViewController];
        konular.tercihler = _tercihler;
    }
}

- (IBAction)unwindToEhliyetSinavi:(UIStoryboardSegue *)unwindSegue{
    if ([[unwindSegue identifier] isEqualToString:@"sinaviYenidenBaslat"]){
        [self tercihleriOku];
        [self sinaviBaslat];
    }
}

- (IBAction)SinaviBaslatTikla:(id)sender {
    [self sinaviBaslat];
}
@end
