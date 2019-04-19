//
//  AddClassViewController.h
//  Final
//
//  Created by RUN on 4/7/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddClassViewController : UIViewController{}
@property (nonatomic, strong) UITextView *txt_lop;
@property (nonatomic, strong) UIButton *btnAddClass;
-(id)initWithStudent:(Model *)student;
@end

NS_ASSUME_NONNULL_END
