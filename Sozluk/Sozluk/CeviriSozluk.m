//
//  CeviriSozluk.m
//  Sozluk
//
//  Created by Olcay Taner YILDIZ on 11/8/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "CeviriSozluk.h"
#import "KaynakKelime.h"

@implementation CeviriSozluk

KaynakKelime *kelime;
NSString* ceviriSinif;
NSString* anlamSinif;
NSMutableString *deger;

- (id)initWithAll:(NSString*)dosyaAd{
    NSData* dosyaIcerik;
    NSString* dosyaAdi;
    self = [super init];
    if (self){
        _kelimeler = [[NSMutableArray alloc] init];
        dosyaAdi = [[NSBundle mainBundle] pathForResource:dosyaAd ofType:@"xml"];
        dosyaIcerik = [NSData dataWithContentsOfFile:dosyaAdi];
        _cozumleyici = [[NSXMLParser alloc] initWithData:dosyaIcerik];
        [_cozumleyici setDelegate:self];
        [_cozumleyici parse];
    }
    return self;
}

- (NSMutableArray*) kelimeAra:(NSString*)arananKelime{
    NSMutableArray* sonucListe;
    sonucListe = [[NSMutableArray alloc] init];
    for (KaynakKelime* kelime in _kelimeler){
        if ([kelime.ad isEqualToString:arananKelime]){
            [sonucListe addObject:kelime];
        }
    }
    return sonucListe;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"word"]) {
        NSString* ad = [attributeDict objectForKey:@"name"];
        kelime = [[KaynakKelime alloc] initWithAll:ad];
        ceviriSinif = nil;
        deger = nil;
    } else {
        if ([elementName isEqualToString:@"lexical"]) {
            ceviriSinif = [attributeDict objectForKey:@"class"];
            deger = nil;
        } else {
            if ([elementName isEqualToString:@"meaning"]) {
                anlamSinif = [attributeDict objectForKey:@"class"];
                deger = nil;
            }            
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!deger) {
        deger = [[NSMutableString alloc] initWithString:string];
    } else {
        [deger appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    Ceviri* ceviri;
    Anlam* anlam;
    if ([elementName isEqualToString:@"lexicon"]){
        return;
    } else {
        if ([elementName isEqualToString:@"word"]){
            [_kelimeler addObject:kelime];
        } else {
            if ([elementName isEqualToString:@"lexical"]){
                ceviriSinif = nil;
            } else {
                if ([elementName isEqualToString:@"meaning"]){
                    if (anlamSinif != NULL){
                        anlam = [[Anlam alloc] initWithAll:anlamSinif anlam:deger];
                    } else {
                        anlam = [[Anlam alloc] initWithAll:deger];
                    }
                    if (ceviriSinif != NULL){
                        ceviri = [[Ceviri alloc] initWithAll:ceviriSinif anlam:anlam];
                    } else {
                        ceviri = [[Ceviri alloc] initWithAll:anlam];
                    }
                    [kelime ceviriEkle:ceviri];
                }                                    
            }
        }
    }
}

@end
