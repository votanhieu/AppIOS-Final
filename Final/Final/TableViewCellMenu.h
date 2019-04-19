//
//  TableViewCellMenu.h
//  Final
//
//  Created by RUN on 4/1/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCellMenu : UITableViewCell {
    UIImageView *im;
    UILabel *lb;
}
-(void)initCell:(Model *)student index:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
