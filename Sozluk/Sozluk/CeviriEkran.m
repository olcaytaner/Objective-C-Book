//
//  Ceviri.m
//  Sozluk
//
//  Created by Olcay Taner YILDIZ on 11/8/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "CeviriEkran.h"
#import "KaynakKelime.h"

@interface CeviriEkran ()

@end

@implementation CeviriEkran
NSMutableArray* ceviriSozlukKelimeler = nil;

- (void)viewDidLoad{
    [super viewDidLoad];
    _ceviriSozluk = [[CeviriSozluk alloc] initWithAll:@"english-turkish"];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    ceviriSozlukKelimeler = [_ceviriSozluk kelimeAra:searchString];
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.searchDisplayController.searchResultsTableView && ceviriSozlukKelimeler != nil) {
        return [ceviriSozlukKelimeler[section] ceviriSayisi];
    } else {
        return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return ceviriSozlukKelimeler.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Ceviri* ceviri;
    Anlam* anlam;
    KaynakKelime* kaynakKelime;
    NSMutableAttributedString* anlamBilgi;
    static NSString *CellIdentifier = @"CeviriSozlukHucre";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    kaynakKelime = ceviriSozlukKelimeler[indexPath.section];
    ceviri = [kaynakKelime ceviri:indexPath.row];
    anlam = ceviri.anlam;
    if (ceviri.sinif){
        anlamBilgi = [[NSMutableAttributedString alloc] initWithString:ceviri.sinif];
        [anlamBilgi appendAttributedString:[[NSAttributedString alloc] initWithString:@". "]];
        [anlamBilgi addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, anlamBilgi.length)];
        [anlamBilgi appendAttributedString:[[NSAttributedString alloc] initWithString:anlam.anlam]];
    } else {
        anlamBilgi = [[NSMutableAttributedString alloc] initWithString:anlam.anlam];
    }
    UITextView *anlamGosterge = (UITextView *)[cell viewWithTag:1];
    [anlamGosterge setAttributedText:anlamBilgi];
    return cell;
}

@end
