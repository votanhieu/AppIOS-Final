//
//  TableViewCell.h
//  Final
//
//  Created by RUN on 3/27/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell {
    UIImageView *im;
    UILabel *lb;
}
-(void)initCell:(Model *)student index:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
