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
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *ourStrings;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _ourStrings = [NSMutableArray arrayWithArray:@[@"The First Row!", @"More Data"]];
}

- (IBAction)addTapped:(id)sender {
    //[_tableView beginUpdates];
    
    [_ourStrings addObject:_textField.text];
    [_tableView reloadData];
    
    //[_tableView endUpdates];
    
    
}


#pragma mark - UITableViewDataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _ourStrings.count;
    //return 3;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell * cell = (MyCell *)[tableView dequeueReusableCellWithIdentifier:@"OurCell" forIndexPath:indexPath];
    //return [tableView dequeueReusableCellWithIdentifier:@"OurCell" forIndexPath:indexPath];
    cell.ourCellLabel.text = _ourStrings[indexPath.row];
    // Sets the label text with the number of the rows after the text "Row Number "
    // cell.ourCellLabel.text = [NSString stringWithFormat:@"Row number %d", (int) indexPath.row];
    return cell;
}


@end
