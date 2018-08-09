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

    _ourStrings = [NSMutableArray arrayWithArray:@[@"The First Row!", @"More Data", @"Even more data"]];
}

- (IBAction)addTapped:(id)sender {
    [_tableView beginUpdates];
    
    // update data store
    [_ourStrings addObject:_textField.text];
    // in which row the new data should be added into
    NSInteger newRow = [_ourStrings count]-1;
    // we create an index for it
    NSIndexPath *newIndex = [NSIndexPath indexPathForRow:newRow inSection:0];
    // we tell iOS to insert the new data
    [_tableView insertRowsAtIndexPaths:@[newIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [_tableView endUpdates];
    
}

- (IBAction)sortTapped:(id)sender {

    for(long i = [_ourStrings count]-2; i>=0; i--){
        for(long j = i; j<[_ourStrings count]-1; j++){
            if([_ourStrings[j] compare:_ourStrings[j+1]] > 0){
                // swap or elements
                [_tableView beginUpdates];
                
                [_ourStrings exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                NSIndexPath *firstIndex = [NSIndexPath indexPathForRow:j inSection:0];
                NSIndexPath *secondIndex = [NSIndexPath indexPathForRow:j+1 inSection:0];
                [_tableView moveRowAtIndexPath:firstIndex toIndexPath:secondIndex];
                
                [_tableView endUpdates];
            }
        }
    }
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
    
    //return [tableView dequeueReusableCellWithIdentifier:@"OurCell" forIndexPath:indexPath];
    
    MyCell * cell = (MyCell *)[tableView dequeueReusableCellWithIdentifier:@"OurCell" forIndexPath:indexPath];
    cell.ourCellLabel.text = _ourStrings[indexPath.row];
    
    // Sets the label text with the number of the rows after the text "Row Number "
    // cell.ourCellLabel.text = [NSString stringWithFormat:@"Row number %d", (int) indexPath.row];
    return cell;
}


@end
