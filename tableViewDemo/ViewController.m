//
//  ViewController.m
//  tableViewDemo
//
//  Created by Mircea Popescu on 8/8/18.
//  Copyright © 2018 Mircea Popescu. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return _ourStrings.count;
    return 3;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 MyCell * cell = (MyCell *)[tableView dequeueReusableCellWithIdentifier:@"OurCell" forIndexPath:indexPath];
    //return [tableView dequeueReusableCellWithIdentifier:@"OurCell" forIndexPath:indexPath];
//    cell.ourCellLabel.text = _ourStrings[indexPath.row];
    // Sets the label text with the number of the rows after the text "Row Number "
    cell.ourCellLabel.text = [NSString stringWithFormat:@"Row number %d", (int) indexPath.row];
    return cell;
}


@end
