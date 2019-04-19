//
//  AddStudentViewController.m
//  Final
//
//  Created by RUN on 4/7/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import "AddStudentViewController.h"
#import "ViewController.h"
#import "ModelManager.h"
#import <UIKit/UIKit.h>
@interface AddStudentViewController () <UITextViewDelegate>

@end

@implementation AddStudentViewController
@synthesize hiddenID;
@synthesize txt_name;
@synthesize txt_mail;
@synthesize txt_birthday;
@synthesize txt_sexy;
@synthesize txt_phone;
@synthesize txt_lop;
@synthesize txt_address;
@synthesize txt_math;
@synthesize txt_physical;
@synthesize txt_chemistry;
@synthesize txt_biological;
@synthesize txt_english;
@synthesize btnUpdate;
@synthesize btnInsert;
@synthesize btnMap;
@synthesize student;


-(id)initWithAddress:(NSString *)address{
    self = [super init];
    if (self) {
        [self initLayoutAddStudent:address];
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self initBackground];
    [self initNavigation];
}

#pragma mark INIT

-(void)initBackground{
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    [self.view addSubview:backgroundImage ];
}

-(void)initNavigation{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
    view.backgroundColor = [UIColor orangeColor];
    
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 20, self.view.bounds.size.width, 80)];
    fromLabel.text = @"Add Student";
    
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

-(void)initLayoutAddStudent:(NSString*)address{

    
    hiddenID = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, 40, 40)];
    hiddenID.text = [student rollnum];
    [hiddenID setHidden:YES];
    
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(30, 110, 400, 650)];
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(120, 10, 100, 100)];
    [img setImage:[UIImage imageNamed:@"person.jpg"]];
    [scroll addSubview:img];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(40, 120, 300, 60)];
    name.text = @"Name:  ";
    name.textColor = [UIColor greenColor];
    name.layer.borderWidth = 2 ;
    name.layer.borderColor = [UIColor grayColor].CGColor;
    name.layer.cornerRadius = 15;
    name.userInteractionEnabled = YES;
    txt_name = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    //txt_name.text = [student name];
    txt_name.textColor= [UIColor orangeColor];
    txt_name.backgroundColor = [UIColor clearColor];
    [txt_name setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_name.userInteractionEnabled = YES;
    txt_name.delegate = self;
    [name addSubview:txt_name];
    [scroll addSubview:name];
    
    
    UILabel *mail = [[UILabel alloc]initWithFrame:CGRectMake(40, 190, 300, 60)];
    mail.text = @"Mail:  ";
    mail.textColor = [UIColor greenColor];
    mail.layer.borderWidth = 2 ;
    mail.layer.borderColor = [UIColor grayColor].CGColor;
    mail.layer.cornerRadius = 15;
    mail.userInteractionEnabled = YES;
    txt_mail = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    //txt_mail.text = [student mail];
    txt_mail.textColor= [UIColor orangeColor];
    txt_mail.backgroundColor = [UIColor clearColor];
    [txt_mail setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_mail.userInteractionEnabled = YES;
    txt_mail.delegate = self;
    [mail addSubview:txt_mail];
    [scroll addSubview:mail];
    
    UILabel *birthday = [[UILabel alloc]initWithFrame:CGRectMake(40, 260, 300, 60)];
    birthday.text = @"Birthday:  ";
    birthday.textColor = [UIColor greenColor];
    birthday.layer.borderWidth = 2 ;
    birthday.layer.borderColor = [UIColor grayColor].CGColor;
    birthday.layer.cornerRadius = 15;
    birthday.userInteractionEnabled = YES;
    txt_birthday = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    //txt_birthday.text = [student birthday];
    txt_birthday.textColor= [UIColor orangeColor];
    txt_birthday.backgroundColor = [UIColor clearColor];
    [txt_birthday setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_birthday.userInteractionEnabled = YES;
    txt_birthday.delegate = self;
    [birthday addSubview:txt_birthday];
    [scroll addSubview:birthday];
    
    UILabel *sexy = [[UILabel alloc]initWithFrame:CGRectMake(40, 330, 300, 60)];
    sexy.text = @"sexy:  ";
    sexy.textColor = [UIColor greenColor];
    sexy.layer.borderWidth = 2 ;
    sexy.layer.borderColor = [UIColor grayColor].CGColor;
    sexy.layer.cornerRadius = 15;
    sexy.userInteractionEnabled = YES;
    txt_sexy = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    //txt_sexy.text = [student sexy];NSLog(@"%@",txt_sexy.text);
    txt_sexy.textColor= [UIColor orangeColor];
    txt_sexy.backgroundColor = [UIColor clearColor];
    [txt_sexy setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_sexy.userInteractionEnabled = YES;
    txt_sexy.delegate = self;
    [sexy addSubview:txt_sexy];
    [scroll addSubview:sexy];
    
    UILabel *lop = [[UILabel alloc]initWithFrame:CGRectMake(40, 400, 300, 60)];
    lop.text = @"lop:  ";
    lop.textColor = [UIColor greenColor];
    lop.layer.borderWidth = 2 ;
    lop.layer.borderColor = [UIColor grayColor].CGColor;
    lop.layer.cornerRadius = 15;
    lop.userInteractionEnabled = YES;
    txt_lop = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    //txt_lop.text = [student lop];NSLog(@"%@",txt_lop.text);
    txt_lop.textColor= [UIColor orangeColor];
    txt_lop.backgroundColor = [UIColor clearColor];
    [txt_lop setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_lop.userInteractionEnabled = YES;
    txt_lop.delegate = self;
    [lop addSubview:txt_lop];
    [scroll addSubview:lop];
    
    UILabel *phone = [[UILabel alloc]initWithFrame:CGRectMake(40, 470, 300, 60)];
    phone.text = @"phone:  ";
    phone.textColor = [UIColor greenColor];
    phone.layer.borderWidth = 2 ;
    phone.layer.borderColor = [UIColor grayColor].CGColor;
    phone.layer.cornerRadius = 15;
    phone.userInteractionEnabled = YES;
    txt_phone = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    //txt_phone.text = [student phone];
    txt_phone.textColor= [UIColor orangeColor];
    txt_phone.backgroundColor = [UIColor clearColor];
    [txt_phone setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_phone.userInteractionEnabled = YES;
    txt_phone.delegate = self;
    [phone addSubview:txt_phone];
    [scroll addSubview:phone];
    
    UILabel *address2 = [[UILabel alloc]initWithFrame:CGRectMake(40, 540, 230, 60)];
    address2.text = @"address:  ";
    address2.textColor = [UIColor greenColor];
    address2.layer.borderWidth = 2 ;
    address2.layer.borderColor = [UIColor grayColor].CGColor;
    address2.layer.cornerRadius = 15;
    address2.userInteractionEnabled = YES;
    txt_address = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    //txt_address.text = [student address];
    if([address length]!=0)
        txt_address.text = address;
    txt_address.textColor= [UIColor orangeColor];
    txt_address.backgroundColor = [UIColor clearColor];
    txt_address.userInteractionEnabled = YES;
    [txt_address setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_address.delegate = self;
    [address2 addSubview:txt_address];
    [scroll addSubview:address2];
    
    
    UILabel *math = [[UILabel alloc]initWithFrame:CGRectMake(40, 610, 300, 60)];
    math.text = @"Math:  ";
    math.textColor = [UIColor greenColor];
    math.layer.borderWidth = 2 ;
    math.layer.borderColor = [UIColor grayColor].CGColor;
    math.layer.cornerRadius = 15;
    math.userInteractionEnabled = YES;
    txt_math = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    //txt_math.text = [student phone];
    txt_math.textColor= [UIColor orangeColor];
    txt_math.backgroundColor = [UIColor clearColor];
    [txt_math setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_math.userInteractionEnabled = YES;
    txt_math.delegate = self;
    [math addSubview:txt_math];
    [scroll addSubview:math];
    
    UILabel *physical = [[UILabel alloc]initWithFrame:CGRectMake(40, 680, 300, 60)];
    physical.text = @"physical:  ";
    physical.textColor = [UIColor greenColor];
    physical.layer.borderWidth = 2 ;
    physical.layer.borderColor = [UIColor grayColor].CGColor;
    physical.layer.cornerRadius = 15;
    physical.userInteractionEnabled = YES;
    txt_physical = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    //txt_math.text = [student phone];
    txt_physical.textColor= [UIColor orangeColor];
    txt_physical.backgroundColor = [UIColor clearColor];
    [txt_physical setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_physical.userInteractionEnabled = YES;
    txt_physical.delegate = self;
    [physical addSubview:txt_physical];
    [scroll addSubview:physical];
    
    UILabel *chemistry = [[UILabel alloc]initWithFrame:CGRectMake(40, 750, 300, 60)];
    chemistry.text = @"chemistry:  ";
    chemistry.textColor = [UIColor greenColor];
    chemistry.layer.borderWidth = 2 ;
    chemistry.layer.borderColor = [UIColor grayColor].CGColor;
    chemistry.layer.cornerRadius = 15;
    chemistry.userInteractionEnabled = YES;
    txt_chemistry = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    //txt_math.text = [student phone];
    txt_chemistry.textColor= [UIColor orangeColor];
    txt_chemistry.backgroundColor = [UIColor clearColor];
    [txt_chemistry setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_chemistry.userInteractionEnabled = YES;
    txt_chemistry.delegate = self;
    [chemistry addSubview:txt_chemistry];
    [scroll addSubview:chemistry];
    
    UILabel *biological = [[UILabel alloc]initWithFrame:CGRectMake(40, 820, 300, 60)];
    biological.text = @"biological:  ";
    biological.textColor = [UIColor greenColor];
    biological.layer.borderWidth = 2 ;
    biological.layer.borderColor = [UIColor grayColor].CGColor;
    biological.layer.cornerRadius = 15;
    biological.userInteractionEnabled = YES;
    txt_biological = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    //txt_math.text = [student phone];
    txt_biological.textColor= [UIColor orangeColor];
    txt_biological.backgroundColor = [UIColor clearColor];
    [txt_biological setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_biological.userInteractionEnabled = YES;
    txt_biological.delegate = self;
    [biological addSubview:txt_biological];
    [scroll addSubview:biological];
    
    UILabel *english = [[UILabel alloc]initWithFrame:CGRectMake(40, 890, 300, 60)];
    english.text = @"english:  ";
    english.textColor = [UIColor greenColor];
    english.layer.borderWidth = 2 ;
    english.layer.borderColor = [UIColor grayColor].CGColor;
    english.layer.cornerRadius = 15;
    english.userInteractionEnabled = YES;
    txt_english = [[UITextView alloc]initWithFrame:CGRectMake(70, 8, 200, 50)];
    //txt_math.text = [student phone];
    txt_english.textColor= [UIColor orangeColor];
    txt_english.backgroundColor = [UIColor clearColor];
    [txt_english setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    txt_english.userInteractionEnabled = YES;
    txt_english.delegate = self;
    [english addSubview:txt_english];
    [scroll addSubview:english];
    
    btnInsert = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnInsert addTarget:self
                  action:@selector(onClickSave:)
        forControlEvents:UIControlEventTouchUpInside];
    [btnInsert setTitle:@"Save" forState:UIControlStateNormal];
    btnInsert.frame = CGRectMake(120.0, 950.0, 160.0, 40.0);
    btnInsert.layer.borderWidth = 2 ;
    btnInsert.layer.borderColor = [UIColor grayColor].CGColor;
    btnInsert.layer.cornerRadius = 15;
    
    
    btnMap = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnMap addTarget:self
               action:@selector(onClickMap:)
     forControlEvents:UIControlEventTouchUpInside];
    [btnMap setTitle:@"Map" forState:UIControlStateNormal];
    btnMap.frame = CGRectMake(270, 540, 70.0, 60.0);
    btnMap.layer.borderWidth = 2 ;
    btnMap.layer.borderColor = [UIColor grayColor].CGColor;
    btnMap.layer.cornerRadius = 15;
    
    [scroll addSubview:btnInsert];
    [scroll addSubview:btnMap];
    [self.view addSubview:scroll];
    scroll.contentSize = CGSizeMake(300, btnInsert.frame.origin.y + btnInsert.frame.size.height);

    
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

-(void)onClickSave:(UIButton*) button{
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
    if([txt_name.text length]==0){
        [self validateTextField:student];
    }
    else{
    [mgrObj insertData:student];
    [mgrObj insertDiem:(student.rollnum) idmon:(@"a") diem:(txt_math.text)];
    [mgrObj insertDiem:(student.rollnum) idmon:(@"b") diem:(txt_physical.text)];
    [mgrObj insertDiem:(student.rollnum) idmon:(@"c") diem:(txt_chemistry.text)];
    [mgrObj insertDiem:(student.rollnum) idmon:(@"d") diem:(txt_biological.text)];
    [mgrObj insertDiem:(student.rollnum) idmon:(@"e") diem:(txt_english.text)];
    }
    NSLog(@"onClickInsert");
    
}

-(void)validateTextField:(Model *)student{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Message"
                                  message:@"Please fill into field (*)"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    //    UIAlertAction* cancel = [UIAlertAction
    //                             actionWithTitle:@"Cancel"
    //                             style:UIAlertActionStyleDefault
    //                             handler:^(UIAlertAction * action)
    //                             {
    //                                 [alert dismissViewControllerAnimated:YES completion:nil];
    //
    //                             }];
    
    [alert addAction:ok];
    //    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
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

