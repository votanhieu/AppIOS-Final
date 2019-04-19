//
//  AddClassViewController.m
//  Final
//
//  Created by RUN on 4/7/19.
//  Copyright © 2019 RUN. All rights reserved.
//
#import "AddStudentViewController.h"
#import "ViewController.h"
#import "ModelManager.h"
#import <UIKit/UIKit.h>
#import "AddClassViewController.h"

@interface AddClassViewController () <UITextViewDelegate>
@end

@implementation AddClassViewController
@synthesize txt_lop,btnAddClass;

-(id)initWithStudent:(Model *)student{
    self = [super init];
    if (self) {
        NSLog(@"initWithstudent: %@ , %@",student.rollnum, student.name);
        [self initLayoutStudent:student];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBackground];
    [self initNavigation];
}

-(void)initBackground{
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    [self.view addSubview:backgroundImage ];
}

-(void)initNavigation{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
    view.backgroundColor = [UIColor orangeColor];
    
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 20, self.view.bounds.size.width, 80)];
    fromLabel.text = @"Add Class";
    
    UIImageView *imgMenu = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 20, 20)];
    [imgMenu setImage:[UIImage imageNamed:@"back.png"]];
    [imgMenu setContentMode:UIViewContentModeScaleAspectFit];
    [imgMenu setUserInteractionEnabled:YES];
    UITapGestureRecognizer *onClickBackImage =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBackImage:)];
    [onClickBackImage setNumberOfTapsRequired:1];
    [imgMenu addGestureRecognizer:onClickBackImage];
    
    
    
    UIImageView *imgEdit = [[UIImageView alloc]initWithFrame:CGRectMake(350, 50, 20, 20)];
    [imgEdit setImage:[UIImage imageNamed:@"edit.png"]];
    [imgEdit setContentMode:UIViewContentModeScaleAspectFit];
    [imgEdit setUserInteractionEnabled:YES];
    UITapGestureRecognizer *onClickEditImage =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickEditImage:)];
    [onClickEditImage setNumberOfTapsRequired:1];
    [imgEdit addGestureRecognizer:onClickEditImage];
    
    [view addSubview:fromLabel];
    [view addSubview:imgMenu];
    [view addSubview:imgEdit];
    [self.view addSubview:view];
}

-(void)initLayoutStudent:(Model*)student{
    
    btnAddClass = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnAddClass addTarget:self
                  action:@selector(onClickAddClass:)
        forControlEvents:UIControlEventTouchUpInside];
    [btnAddClass setTitle:@"Save" forState:UIControlStateNormal];
    btnAddClass.frame = CGRectMake(140.0, 280, 160.0, 40.0);
    btnAddClass.layer.borderWidth = 2 ;
    btnAddClass.layer.borderColor = [UIColor grayColor].CGColor;
    btnAddClass.layer.cornerRadius = 15;
    
    UILabel *lop = [[UILabel alloc]initWithFrame:CGRectMake(60, 200, 300, 60)];
    lop.text = @"lop:  ";
    lop.textColor = [UIColor greenColor];
    lop.layer.borderWidth = 2 ;
    lop.layer.borderColor = [UIColor grayColor].CGColor;
    lop.layer.cornerRadius = 15;
    lop.userInteractionEnabled = YES;
    txt_lop = [[UITextView alloc]initWithFrame:CGRectMake(80, 8, 200, 50)];
    txt_lop.text = [student lop];NSLog(@"%@",txt_lop.text);
    txt_lop.textColor= [UIColor orangeColor];
    txt_lop.backgroundColor = [UIColor clearColor];
    [txt_lop setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_lop.userInteractionEnabled = YES;
    txt_lop.delegate = self;
    [lop addSubview:txt_lop];
    
    [self.view addSubview:lop];
    [self.view addSubview:btnAddClass];
    
}

#pragma mark ON CLICK EVENT

-(void)onClickBackImage:(UIGestureRecognizer *)recognizer {
    NSLog(@"image clicked");
    ViewController *vc =[[ViewController alloc]init];
    [self presentViewController:vc animated:NO completion:nil];
}

-(void)onClickEditImage:(UIGestureRecognizer *)recognizer {
    NSLog(@"onClickEditImage clicked");
}

-(void)onClickAddClass:(UIButton*) button{
}

#pragma mark UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
}

- (void)textViewDidEndEditing:(UITextView *)textView {
}

@end
