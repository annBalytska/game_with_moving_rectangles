//
//  View.h
//  rectangles
//
//  Created by Anna Balytska on 3/4/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rectangle.h"

@interface View : UIView
{
    NSMutableArray *rectangles;
}
-(void)startTimer;
@end
