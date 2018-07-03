#import "Soru.h"

@interface Soru ()

@end

@implementation Soru

- (id)initWithAll:(NSString *)aSoruTipi soruCumle:(NSString *)aSoruCumle cevap1:(NSString *)aCevap1 cevap2:(NSString *)aCevap2 cevap3:(NSString *)aCevap3 cevap4:(NSString *)aCevap4 dogruCevap:(NSString *)aDogruCevap{
    self = [super init];
    if (self){
        _soruTipi = aSoruTipi;
        _soruCumle = aSoruCumle;
        _cevap1 = aCevap1;
        _cevap2 = aCevap2;
        _cevap3 = aCevap3;
        _cevap4 = aCevap4;
        _dogruCevap = aDogruCevap;
    }
    return self;
}

@end