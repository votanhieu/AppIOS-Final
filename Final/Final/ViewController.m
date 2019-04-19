//
//  ViewController.m
//  Final
//
//  Created by RUN on 3/25/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import "ViewController.h"
#import "ModelManager.h"
#import "AddStudentViewController.h"
#import "AddClassViewController.h"

@interface ViewController ()
@end

@implementation ViewController
static ModelManager *instance=nil;
@synthesize studentsDiem;
@synthesize mySegmentedControl;
@synthesize TableViewMenuBackGround;
@synthesize flag;
@synthesize tableViewMenu;
@synthesize tableView;

-(void)viewDidLoad {
    [super viewDidLoad];
    [self initBackground];
    [self initNavigation];
    [self initSegment];
    [self getAllStudentsOrderByDESC];
    [self initTable];
    [self initTableMenu];
}

#pragma mark -START INIT
-(void)initSegment{
    
    //frame for the segemented button
    CGRect myFrame = CGRectMake(50, 100, 320.0f, 40.0f);
    
    //Array of items to go inside the segment control
    //You can choose to add an UIImage as one of the items instead of NSString
    NSArray *mySegments = [[NSArray alloc] initWithObjects: @"physical",
                           @"math", @"chemistry", @"biological",@"english", nil];
    
    //create an intialize our segmented control
    self.mySegmentedControl = [[UISegmentedControl alloc] initWithItems:mySegments];
    
    //set the size and placement
    self.mySegmentedControl.frame = myFrame;
    
    
    //remove the third index from the control
    [self.mySegmentedControl removeSegmentAtIndex:2
                                         animated:true];
    
    //add another control at the end
    [self.mySegmentedControl insertSegmentWithTitle:@"chemistry"
                                            atIndex:3
                                           animated:true];
    
    
    //default the selection to second item
    [self.mySegmentedControl setSelectedSegmentIndex:1];
    
    //attach target action for if the selection is changed by the user
    [self.mySegmentedControl addTarget:self
                                action:@selector(onClickButtonSubject:)
                      forControlEvents:UIControlEventValueChanged];
    
    //add the control to the view
    [self.view addSubview:self.mySegmentedControl];
    
}

-(void)initNavigation{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
    view.backgroundColor = [UIColor orangeColor];
    
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 20, self.view.bounds.size.width, 80)];
    fromLabel.text = @"List Students";
    
    [view addSubview:[self sideMenu]];
    [view addSubview:[self sideEdit]];
    [view addSubview:fromLabel];
    [self.view addSubview:view];
}

-(void)initBackground{
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    [self.view addSubview:backgroundImage ];
    int pixel=0;
    for(int i = 0; i<=8; i++){
        UIImageView *imgEdit = [[UIImageView alloc]initWithFrame:CGRectMake(100+pixel, 200, 20, 20)];
        [imgEdit setImage:[UIImage imageNamed:@"study.png"]];
        [imgEdit setContentMode:UIViewContentModeScaleAspectFit];
        [self.view addSubview:imgEdit ];
        pixel +=25;
    }
}

-(void)initTable{
    NSLog(@"inittable");
    tableView=[[UITableView alloc]init];
    tableView.frame = CGRectMake(30,250,360,500);
    tableView.backgroundColor = [UIColor clearColor];
    tableView.layer.borderWidth = 2 ;
    tableView.layer.borderColor = [UIColor grayColor].CGColor;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    tableView.layer.cornerRadius = 20;
    tableView.dataSource=self;
    tableView.delegate=self;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];
    [tableView reloadData];
    [self.view addSubview:tableView];
}

-(void)initTableMenu{
    NSLog(@"initTableMenu");
    tableViewMenu = [[UITableView alloc]init];
    tableViewMenu.frame = CGRectMake(0,0,self.view.bounds.size.width,200);
    tableViewMenu.backgroundColor = [UIColor darkGrayColor];
    tableViewMenu.dataSource=self;
    tableViewMenu.delegate=self;
    tableViewMenu.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [tableViewMenu registerClass:[TableViewCellMenu class] forCellReuseIdentifier:@"cellMenu"];
    [tableViewMenu reloadData];
}

-(UIImageView *)sideMenu{
    UIImageView *imgMenu = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 20, 20)];
    [imgMenu setImage:[UIImage imageNamed:@"menu.png"]];
    [imgMenu setContentMode:UIViewContentModeScaleAspectFit];
    [imgMenu setUserInteractionEnabled:YES];
    UITapGestureRecognizer *onClickMenu =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickMenu:)];
    [onClickMenu setNumberOfTapsRequired:1];
    [imgMenu addGestureRecognizer:onClickMenu];
    return imgMenu;
}

-(UIImageView *)sideEdit{
    UIImageView *imgEdit = [[UIImageView alloc]initWithFrame:CGRectMake(350, 50, 20, 20)];
    [imgEdit setImage:[UIImage imageNamed:@"edit.png"]];
    [imgEdit setContentMode:UIViewContentModeScaleAspectFit];
    return imgEdit;
}

-(UIView *)dropDownMenu{
    
    UIView *dropDownMenu=[[UIView alloc]initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, 200)];
    dropDownMenu.backgroundColor = [UIColor grayColor];
    [dropDownMenu addSubview:tableViewMenu];
    TableViewMenuBackGround = dropDownMenu;
    return TableViewMenuBackGround;
}


#pragma mark -START TABLE LIST ALL STUDENT CUSTOM CELL
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView == self.tableView){
        ModelDiemStudent *tempp = [[ModelDiemStudent alloc ]init];
        tempp = [studentsDiem objectAtIndex:indexPath.row];
        [self moveToDetailStudentView:tempp];
    }
    else if(tableView == self.tableViewMenu)
    {
        if(indexPath.row == 0){
            ViewController *vc =[[ViewController alloc]init];
            [self presentViewController:vc animated:NO completion:nil];
        }
        if(indexPath.row == 1)
            [self moveToAddStudentView:NULL];
        if(indexPath.row == 2)
            [self moveToAddClassView:NULL];
        if(indexPath.row == 3)
        {
            ViewController *vc =[[ViewController alloc]init];
            [self presentViewController:vc animated:NO completion:nil];
        }
        if(indexPath.row == 4)
        {
            ViewController *vc =[[ViewController alloc]init];
            [self presentViewController:vc animated:NO completion:nil];
        }
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == tableViewMenu)
    return 5;
    else return [studentsDiem count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView == self.tableView)
    {
           [self initTableMenu];
           NSLog(@"tableView");
           TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
           cell.backgroundColor = [UIColor clearColor];
           [cell initCell:[studentsDiem objectAtIndex:indexPath.row] index:(NSIndexPath *)indexPath];
           return cell;
    }
    else if(tableView == self.tableViewMenu)
    {
        NSLog(@"tableViewMenu");
        TableViewCellMenu *cell=[tableView dequeueReusableCellWithIdentifier:@"cellMenu"];
        cell.backgroundColor = [UIColor clearColor];
        [cell initCell:[studentsDiem objectAtIndex:indexPath.row] index:(NSIndexPath *)indexPath];
        return cell;

    }
    return nil;
}


#pragma mark -START UTIL
// input param la ModelDiemStudent do cell la ModelDiemStudent, ModelDiemStudent la doi tuong tra ve tu ket bang AVG(tinh trung binh diem)
-(void)moveToDetailStudentView:(ModelDiemStudent *)student{
    ModelManager *mgrObj=[ModelManager getInstance];
    
    Model * aStudent = [[Model alloc]init];
    aStudent = [mgrObj getStudentByID:student.rollnum];
    
    DetailStudentViewController *vc =[[DetailStudentViewController alloc]initWithStudent:aStudent];
    [self presentViewController:vc animated:NO completion:nil];
}

-(void)moveToAddStudentView:(NSString *)address{
    AddStudentViewController *vc =[[AddStudentViewController alloc]initWithAddress:address];
    [self presentViewController:vc animated:NO completion:nil];
}

-(void)moveToAddClassView:(Model *)student{
    AddClassViewController *vc =[[AddClassViewController alloc]initWithStudent:student];
    [self presentViewController:vc animated:NO completion:nil];
}

-(void)onClickGetStudentBySubject:(NSString *)myChoice {
    ModelManager *mgrObj=[ModelManager getInstance];
    studentsDiem = [[NSMutableArray alloc] init];
    studentsDiem = [mgrObj getDataBySubject:myChoice];
    [tableView removeFromSuperview];
    [self initTable];
}

-(void)onClickButtonSubject:(UISegmentedControl *)paramSender{
    
    //check if its the same control that triggered the change event
    if ([paramSender isEqual:self.mySegmentedControl]){
        
        //get index position for the selected control
        NSInteger selectedIndex = [paramSender selectedSegmentIndex];
        
        //get the Text for the segmented control that was selected
        NSString *myChoice =
        [paramSender titleForSegmentAtIndex:selectedIndex];
        //let log this info to the console
        
        NSLog(@"Segment at position %li with %@ text is selected",
              selectedIndex, myChoice);
        
        //getStudentBySubject
        [self onClickGetStudentBySubject:myChoice];
    }
}

-(NSMutableArray *)getAllStudentsOrderByDESC{
    ModelManager *mgrObj=[ModelManager getInstance];
    studentsDiem = [[NSMutableArray alloc] init];
    return studentsDiem = [mgrObj getDataOrderByDESC];
}


#pragma mark -START UIBarButtonItem
-(void)onClickMenu:(UIGestureRecognizer *)recognizer{
    NSLog(@"image clicked");
    if(flag == NO){
        [self.view addSubview:[self dropDownMenu]];
    }
    else{
        [TableViewMenuBackGround removeFromSuperview];
    }
    flag = !flag;
}


@end
