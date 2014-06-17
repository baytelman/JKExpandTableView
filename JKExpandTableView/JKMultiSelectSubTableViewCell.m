//
//  JKMultiSelectSubTableViewCell.m
//  ExpandTableView
//
//  Created by Jack Kwok on 7/5/13.
//  Copyright (c) 2013 Jack Kwok. All rights reserved.
//

#import "JKMultiSelectSubTableViewCell.h"
#import "JKSubTableViewCellCell.h"

@implementation JKMultiSelectSubTableViewCell

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JKSubTableViewCellCell *cell = (JKSubTableViewCellCell *)[tableView cellForRowAtIndexPath:indexPath];
    BOOL isSwitchedOn = YES;
    BOOL isRowSelected = !(cell.selectionOnIndicatorImg.hidden);
    
    if(isRowSelected){
        cell.selectionOnIndicatorImg.hidden = YES;
        cell.selectionOffIndicatorImg.hidden = NO;
        isSwitchedOn = NO;
    } else {
        cell.selectionOnIndicatorImg.hidden = NO;
        cell.selectionOffIndicatorImg.hidden = YES;
        isSwitchedOn = YES;
    }
    
    [self.delegate didSelectRowAtChildIndex:indexPath.row selected:isSwitchedOn underParentIndex:self.parentIndex];
}


@end
