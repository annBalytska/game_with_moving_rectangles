//
//  Rectangle.m
//  rectangles
//
//  Created by Anna Balytska on 3/4/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle


-(void)setRectX:(float)x setRectY:(float)y;
{
    rect.origin.x=x;
    rect.origin.y=y;
    rect.size.height=30;
    rect.size.width=30;
}

-(void) draw:(CGContextRef) context
{
    CGContextFillRect(context, rect);
}


-(void)move
{
    if ((rect.origin.x+rect.size.width == rectView.size.width) || (rect.origin.x == rectView.origin.x)){
        shiftX=-shiftX;
    }
    if ((rect.origin.y+rect.size.height == rectView.size.height) || (rect.origin.y == rectView.origin.y)){
        shiftY=-shiftY;
    }    
    [self setRectX:(rect.origin.x+shiftX)
          setRectY:(rect.origin.y+shiftY)];
}

-(CGRect)rect
{
    return rect;
}

-(void)setViewSize:(CGRect)rectSize
{
    rectView=rectSize;
}


-(void)setX:(int)x setY:(int)y
{
    shiftX=x;
    shiftY=y;
}

@end
