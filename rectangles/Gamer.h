//
//  Gamer.h
//  rectangles
//
//  Created by Anna Balytska on 3/5/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gamer : NSObject
{
    CGRect rect;
}
-(void)setX:(float)x setY:(float)y;
-(void)draw:(CGContextRef) context;
@end
