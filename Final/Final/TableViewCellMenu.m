//
//  TableViewCellMenu.m
//  Final
//
//  Created by RUN on 4/1/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import "TableViewCellMenu.h"
#import <UIKit/UIKit.h>
#import "ModelManager.h"
@implementation TableViewCellMenu

-(void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)initCell:(Model *)student index:(NSIndexPath *)indexPath{
    NSLog(@"initCell_Menu");
    
    UILabel *lb1=[[UILabel alloc]initWithFrame:CGRectMake(60, 20, 300, 30)];
    lb1.textColor = [UIColor greenColor];
    switch((long)indexPath.row) {
        case 0 :
            lb1.text = @"Home";
            break;
        case 1 :
            lb1.text = @"Add Student";
            break;
        case 2 :
            lb1.text = @"Add Class";
            break;
        case 3 :
            lb1.text = @"Edit";
            break;
        case 4 :
            lb1.text = @"List All Student";
            break;
        default :
            NSLog(@"Invalid grade\n" );
    }
    [self addSubview:lb1];
    
    UIImageView *imgMenu = [[UIImageView alloc]initWithFrame:CGRectMake(30, 20, 20, 20)];
    // add different icons for each cell created
    [imgMenu setImage:[UIImage imageNamed:[NSString stringWithFormat:@"iconMenu%ld.png",(long)indexPath.row]]];
    NSLog(@"indexPath: %ld",(long)indexPath.row);
    [imgMenu setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:imgMenu];
}
@end
