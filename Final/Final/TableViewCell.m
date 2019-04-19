//
//  TableViewCell.m
//  Final
//
//  Created by RUN on 3/27/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import "TableViewCell.h"
#import <UIKit/UIKit.h>
#import "ModelManager.h"
@implementation TableViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)initCell:(ModelDiemStudent *)student index:(NSIndexPath *)indexPath{
    UIView *vi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 100)];
    
    UILabel *hiddenID = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, 40, 40)];
    hiddenID.text = [student rollnum];
    [hiddenID setHidden:YES];
    
    UILabel *lb_name=[[UILabel alloc]initWithFrame:CGRectMake(50, 0, 60, 40)];
    lb_name.text = [student name];
    lb_name.textColor = [UIColor orangeColor];
    [lb_name setFont:[UIFont fontWithName:@"Helvetica" size:26]];
    [vi addSubview:lb_name];
    
    UILabel *lb_score=[[UILabel alloc]initWithFrame:CGRectMake(80, 14, 90, 50)];
    lb_score.text = [NSString stringWithFormat:@"Score: %@",[student diem] ];
    lb_score.textColor = [UIColor purpleColor];
    [lb_score setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    [vi addSubview:lb_score];
    
    UILabel *lb_sexy=[[UILabel alloc]initWithFrame:CGRectMake(180, 14, 70, 50)];
    lb_sexy.text = [NSString stringWithFormat:@"Sexy: %@",[student sexy]];
    lb_sexy.textColor = [UIColor purpleColor];
    [lb_sexy setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    [vi addSubview:lb_sexy];
    
    UIImageView *iconStar = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 30, 30)];
    
    UILabel *lbRank = [[UILabel alloc] initWithFrame:CGRectMake(250, 10, 90, 40)];
    lbRank.textColor = [UIColor purpleColor];
    [lbRank setFont:[UIFont fontWithName:@"Helvetica" size:24]];
    
    // add different icons for each cell created
    if((long)indexPath.row < 3){
        [iconStar setImage:[UIImage imageNamed:[NSString stringWithFormat:@"star%ld.png",(long)indexPath.row]]];
        NSLog(@"Rank: %ld",(long)indexPath.row);
    }
    else{
        [iconStar setImage:[UIImage imageNamed:@"starNormal.png"]];
    }
    
    [iconStar setContentMode:UIViewContentModeScaleAspectFit];
    [vi addSubview:iconStar];
    lbRank.text = [NSString stringWithFormat:@"Rank %ld",(long)indexPath.row+1];
    [vi addSubview:lbRank];
    [self addSubview:vi];
}

@end
