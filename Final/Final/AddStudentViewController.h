//
//  AddStudentViewController.h
//  Final
//
//  Created by RUN on 4/7/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelManager.h"
#import "MapViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddStudentViewController : UIViewController{
    
}
@property (nonatomic, strong) UILabel *hiddenID;
@property (nonatomic, strong) UITextView *txt_name;
@property (nonatomic, strong) UITextView *txt_mail;
@property (nonatomic, strong) UITextView *txt_birthday;
@property (nonatomic, strong) UITextView *txt_sexy;
@property (nonatomic, strong) UITextView *txt_phone;
@property (nonatomic, strong) UITextView *txt_lop;
@property (nonatomic, strong) UITextView *txt_address;
@property (nonatomic, strong) UITextView *txt_math;
@property (nonatomic, strong) UITextView *txt_physical;
@property (nonatomic, strong) UITextView *txt_chemistry;
@property (nonatomic, strong) UITextView *txt_biological;
@property (nonatomic, strong) UITextView *txt_english;
@property (nonatomic, strong) UIButton *btnUpdate;
@property (nonatomic, strong) UIButton *btnInsert;
@property (nonatomic, strong) UIButton *btnMap;
@property (nonatomic, strong) Model *student;


-(id)initWithAddress:(NSString *)address;
@end

NS_ASSUME_NONNULL_END
