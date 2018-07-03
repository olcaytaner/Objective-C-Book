//
//  SozlukEkran.m
//  Sozluk
//
//  Created by Olcay Taner YILDIZ on 11/8/14.
//  Copyright (c) 2014 Olcay Taner YILDIZ. All rights reserved.
//

#import "SozlukEkran.h"
#import "SozlukKelime.h"

@interface SozlukEkran ()

@end

@implementation SozlukEkran

NSMutableArray* sozlukKelimeler = nil;

- (void)viewDidLoad{
    [super viewDidLoad];
    _sozluk = [[Sozluk alloc] initWithAll:@"turkish-dictionary"];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    sozlukKelimeler = [_sozluk kelimeAra:searchString];
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.searchDisplayController.searchResultsTableView && sozlukKelimeler != nil) {
        return [sozlukKelimeler[section] anlamSayisi];
    } else {
        return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return sozlukKelimeler.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Anlam* anlam;
    SozlukKelime* sozlukKelime;
    NSMutableAttributedString* anlamBilgi;
    static NSString *CellIdentifier = @"SozlukHucre";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    sozlukKelime = sozlukKelimeler[indexPath.section];
    anlam = [sozlukKelime anlam:indexPath.row];
    if (sozlukKelime.sinif){
        anlamBilgi = [[NSMutableAttributedString alloc] initWithString:sozlukKelime.sinif];
        [anlamBilgi appendAttributedString:[[NSAttributedString alloc] initWithString:@". "]];
        [anlamBilgi addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, anlamBilgi.length)];
    } else {
        anlamBilgi = [[NSMutableAttributedString alloc] initWithString:@""];
    }
    if (sozlukKelime.koken){
        NSMutableAttributedString* koken = [[NSMutableAttributedString alloc] initWithString:sozlukKelime.koken];
        [koken appendAttributedString:[[NSAttributedString alloc] initWithString:@". "]];
        [anlamBilgi appendAttributedString:koken];
        [anlamBilgi addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(anlamBilgi.length - koken.length, koken.length)];
    }
    [anlamBilgi appendAttributedString:[[NSAttributedString alloc] initWithString:anlam.anlam]];
    UITextView *anlamGosterge = (UITextView *)[cell viewWithTag:1];
    [anlamGosterge setAttributedText:anlamBilgi];
    return cell;
}

@end
