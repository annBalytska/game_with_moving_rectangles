//
//  Rectangle.h
//  rectangles
//
//  Created by Anna Balytska on 3/4/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View.h"

@interface Rectangle : NSObject
{
    CGRect rect;
    CGRect rectView;
    int shiftX;
    int shiftY;
}
-(void)setRectX:(float)x setRectY:(float)y;
-(void)draw:(CGContextRef) context;
-(void)move;
-(CGRect)rect;
-(void)setViewSize:(CGRect)rectSize;
-(void)setX:(int)x setY:(int)y;
@end
