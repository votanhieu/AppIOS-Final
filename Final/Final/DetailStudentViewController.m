//
//  DetailStudentViewController.m
//  Final
//
//  Created by RUN on 3/27/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import "DetailStudentViewController.h"
#import "ViewController.h"
#import "ModelManager.h"
#import <UIKit/UIKit.h>
@interface DetailStudentViewController () <UITextViewDelegate>

@end

@implementation DetailStudentViewController
@synthesize hiddenID;
@synthesize txt_name;
@synthesize txt_mail;
@synthesize txt_birthday;
@synthesize txt_sexy;
@synthesize txt_phone;
@synthesize txt_lop;
@synthesize txt_address;
@synthesize btnUpdate;
@synthesize btnInsert;
@synthesize btnMap;
@synthesize student;


-(id)initWithStudent:(Model *)student{
    self = [super init];
    if (self) {
        NSLog(@"DetailStudent initWithstudent: %@ , %@",student.rollnum, student.name);
        [self initLayoutStudent:student];
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self initBackground];
    [self initNavigation];
    [self initButton];
}

#pragma mark INIT

-(void)initBackground{
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    [self.view addSubview:backgroundImage ];
}

-(void)initButton{
    btnUpdate = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnUpdate addTarget:self
                  action:@selector(onClickUpdate:)
        forControlEvents:UIControlEventTouchUpInside];
    [btnUpdate setTitle:@"Update" forState:UIControlStateNormal];
    btnUpdate.frame = CGRectMake(130.0, 700.0, 160.0, 40.0);
    btnUpdate.layer.borderWidth = 2 ;
    btnUpdate.layer.borderColor = [UIColor grayColor].CGColor;
    btnUpdate.layer.cornerRadius = 15;
    
    btnMap = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnMap addTarget:self
                  action:@selector(onClickMap:)
        forControlEvents:UIControlEventTouchUpInside];
    [btnMap setTitle:@"Map" forState:UIControlStateNormal];
    btnMap.frame = CGRectMake(290, 620, 70.0, 60.0);
    btnMap.layer.borderWidth = 2 ;
    btnMap.layer.borderColor = [UIColor grayColor].CGColor;
    btnMap.layer.cornerRadius = 15;
    
    [self.view addSubview:btnInsert];
    [self.view addSubview:btnUpdate];
    [self.view addSubview:btnMap];
}

-(void)initNavigation{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
    view.backgroundColor = [UIColor orangeColor];
    
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 20, self.view.bounds.size.width, 80)];
    fromLabel.text = @"Detail Student";

    UIImageView *imgMenu = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 20, 20)];
    [imgMenu setImage:[UIImage imageNamed:@"back.png"]];
    [imgMenu setContentMode:UIViewContentModeScaleAspectFit];
    [imgMenu setUserInteractionEnabled:YES];
    UITapGestureRecognizer *onClickBackImage =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBackImage:)];
    [onClickBackImage setNumberOfTapsRequired:1];
    [imgMenu addGestureRecognizer:onClickBackImage];


    
    UIImageView *imgEdit = [[UIImageView alloc]initWithFrame:CGRectMake(350, 50, 20, 20)];
    [imgEdit setImage:[UIImage imageNamed:@"delete.png"]];
    [imgEdit setContentMode:UIViewContentModeScaleAspectFit];
    [imgEdit setUserInteractionEnabled:YES];
    UITapGestureRecognizer *onClickDeleteImage =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickDeleteImage:)];
    [onClickDeleteImage setNumberOfTapsRequired:1];
    [imgEdit addGestureRecognizer:onClickDeleteImage];
    
    [view addSubview:fromLabel];
    [view addSubview:imgMenu];
    [view addSubview:imgEdit];
    [self.view addSubview:view];
}

-(void)initLayoutStudent:(Model*)student{
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(150, 100, 100, 100)];
    [img setImage:[UIImage imageNamed:@"person.jpg"]];
    [self.view addSubview:img];
    
    hiddenID = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, 40, 40)];
    hiddenID.text = [student rollnum];
    [hiddenID setHidden:YES];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(55, 210, 300, 60)];
    name.text = @"Name:  ";
    name.textColor = [UIColor greenColor];
    name.layer.borderWidth = 2 ;
    name.layer.borderColor = [UIColor grayColor].CGColor;
    name.layer.cornerRadius = 15;
    name.userInteractionEnabled = YES;
    txt_name = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    txt_name.text = [student name];
    txt_name.textColor= [UIColor orangeColor];
    txt_name.backgroundColor = [UIColor clearColor];
    [txt_name setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_name.userInteractionEnabled = YES;
    txt_name.delegate = self;
    [name addSubview:txt_name];
    [self.view addSubview:name];
    
    
    UILabel *mail = [[UILabel alloc]initWithFrame:CGRectMake(60, 280, 300, 60)];
    mail.text = @"Mail:  ";
    mail.textColor = [UIColor greenColor];
    mail.layer.borderWidth = 2 ;
    mail.layer.borderColor = [UIColor grayColor].CGColor;
    mail.layer.cornerRadius = 15;
    mail.userInteractionEnabled = YES;
    txt_mail = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    txt_mail.text = [student mail];NSLog(@"%@",txt_mail.text);
    txt_mail.textColor= [UIColor orangeColor];
    txt_mail.backgroundColor = [UIColor clearColor];
    [txt_mail setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_mail.userInteractionEnabled = YES;
    txt_mail.delegate = self;
    [mail addSubview:txt_mail];
    [self.view addSubview:mail];
    
    UILabel *birthday = [[UILabel alloc]initWithFrame:CGRectMake(60, 350, 300, 60)];
    birthday.text = @"Birthday:  ";
    birthday.textColor = [UIColor greenColor];
    birthday.layer.borderWidth = 2 ;
    birthday.layer.borderColor = [UIColor grayColor].CGColor;
    birthday.layer.cornerRadius = 15;
    birthday.userInteractionEnabled = YES;
    txt_birthday = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    txt_birthday.text = [student birthday];NSLog(@"%@",txt_birthday.text);
    txt_birthday.textColor= [UIColor orangeColor];
    txt_birthday.backgroundColor = [UIColor clearColor];
    [txt_birthday setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_birthday.userInteractionEnabled = YES;
    txt_birthday.delegate = self;
    [birthday addSubview:txt_birthday];
    [self.view addSubview:birthday];
    
    UILabel *sexy = [[UILabel alloc]initWithFrame:CGRectMake(60, 420, 300, 60)];
    sexy.text = @"sexy:  ";
    sexy.textColor = [UIColor greenColor];
    sexy.layer.borderWidth = 2 ;
    sexy.layer.borderColor = [UIColor grayColor].CGColor;
    sexy.layer.cornerRadius = 15;
    sexy.userInteractionEnabled = YES;
    txt_sexy = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    txt_sexy.text = [student sexy];NSLog(@"%@",txt_sexy.text);
    txt_sexy.textColor= [UIColor orangeColor];
    txt_sexy.backgroundColor = [UIColor clearColor];
    [txt_sexy setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_sexy.userInteractionEnabled = YES;
    txt_sexy.delegate = self;
    [sexy addSubview:txt_sexy];
    [self.view addSubview:sexy];
    
    UILabel *lop = [[UILabel alloc]initWithFrame:CGRectMake(60, 490, 300, 60)];
    lop.text = @"lop:  ";
    lop.textColor = [UIColor greenColor];
    lop.layer.borderWidth = 2 ;
    lop.layer.borderColor = [UIColor grayColor].CGColor;
    lop.layer.cornerRadius = 15;
    lop.userInteractionEnabled = YES;
    txt_lop = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    txt_lop.text = [student lop];NSLog(@"%@",txt_lop.text);
    txt_lop.textColor= [UIColor orangeColor];
    txt_lop.backgroundColor = [UIColor clearColor];
    [txt_lop setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_lop.userInteractionEnabled = YES;
    txt_lop.delegate = self;
    [lop addSubview:txt_lop];
    [self.view addSubview:lop];
    
    UILabel *phone = [[UILabel alloc]initWithFrame:CGRectMake(60, 560, 300, 60)];
    phone.text = @"phone:  ";
    phone.textColor = [UIColor greenColor];
    phone.layer.borderWidth = 2 ;
    phone.layer.borderColor = [UIColor grayColor].CGColor;
    phone.layer.cornerRadius = 15;
    phone.userInteractionEnabled = YES;
    txt_phone = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    txt_phone.text = [student phone];
    txt_phone.textColor= [UIColor orangeColor];
    txt_phone.backgroundColor = [UIColor clearColor];
    [txt_phone setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_phone.userInteractionEnabled = YES;
    txt_phone.delegate = self;
    [phone addSubview:txt_phone];
    [self.view addSubview:phone];
    
    UILabel *address = [[UILabel alloc]initWithFrame:CGRectMake(60, 620, 230, 60)];
    address.text = @"address:  ";
    address.textColor = [UIColor greenColor];
    address.layer.borderWidth = 2 ;
    address.layer.borderColor = [UIColor grayColor].CGColor;
    address.layer.cornerRadius = 15;
    address.userInteractionEnabled = YES;
    txt_address = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    txt_address.text = [student address];
    txt_address.textColor= [UIColor orangeColor];
    txt_address.backgroundColor = [UIColor clearColor];
    txt_address.userInteractionEnabled = YES;
    [txt_address setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_address.delegate = self;
    [address addSubview:txt_address];
    [self.view addSubview:address];
    
}

#pragma mark ON CLICK EVENT

-(void)onClickBackImage:(UIGestureRecognizer *)recognizer {
    NSLog(@"image clicked");
    ViewController *vc =[[ViewController alloc]init];
    [self presentViewController:vc animated:NO completion:nil];
}

-(void)onClickDeleteImage:(UIGestureRecognizer *)recognizer {
    NSLog(@"onClickDeleteImage clicked");
    ModelManager *mgrObj=[ModelManager getInstance];
    Model *student = [[Model alloc] init];
    student.rollnum = hiddenID.text;
    [mgrObj deleteData:student];
}

//TODO: ko cho id thay đổi được khi update
-(void)onClickUpdate:(UIButton*) button{
    ModelManager *mgrObj=[ModelManager getInstance];
    Model *student = [[Model alloc] init];
    student.rollnum = hiddenID.text;
    student.name = txt_name.text;
    student.mail = txt_mail.text;
    student.birthday = txt_birthday.text;
    student.sexy = txt_sexy.text;
    student.phone = txt_phone.text;
    student.lop = txt_lop.text;
    student.address = txt_address.text;
    [mgrObj updateData:student];
    NSLog(@"onClickUpdate");
    NSLog(@"%@",hiddenID.text);
}

-(void)onClickInsert:(UIButton*) button{
    ModelManager *mgrObj=[ModelManager getInstance];
    Model *student = [[Model alloc] init];
    //TODO generate auto ID without Auto increment;
    hiddenID.text = txt_name.text;
    student.rollnum = hiddenID.text;
    student.name = txt_name.text;
    student.mail = txt_mail.text;
    student.birthday = txt_birthday.text;
    student.sexy = txt_sexy.text;
    student.phone = txt_phone.text;
    student.lop = txt_lop.text;
    student.address = txt_address.text;
    NSLog(@"%@-%@-%@-%@-%@-%@-%@",txt_name.text,txt_mail.text,txt_birthday.text,txt_sexy.text,txt_phone.text,txt_lop.text,txt_address.text);
    [mgrObj insertData:student];
    NSLog(@"onClickInsert");
}

-(void)onClickMap:(UIButton*) button{
    
    MapViewController *vc = [[MapViewController alloc]init];
    [self presentViewController:vc animated:NO completion:nil];
    NSLog(@"onClickMap");
}

#pragma mark UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
}

- (void)textViewDidEndEditing:(UITextView *)textView {
}

@end
