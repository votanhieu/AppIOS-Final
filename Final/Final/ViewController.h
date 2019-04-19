//
//  ViewController.h
//  Final
//
//  Created by RUN on 3/25/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelManager.h"
#import "DetailStudentViewController.h"
#import "TableViewCell.h"
#import "TableViewCellMenu.h"
@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *tableViewMenu;
@property(strong, nonatomic)  NSMutableArray *studentsDiem;
@property (nonatomic, strong) UISegmentedControl *mySegmentedControl;
@property (nonatomic, strong) UIView *TableViewMenuBackGround;
@property (nonatomic) BOOL flag;
@end

