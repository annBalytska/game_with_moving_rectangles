//
//  View.m
//  rectangles
//
//  Created by Anna Balytska on 3/4/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import "View.h"

@interface View ()

@property CGPoint loc;

@end

@implementation View



NSTimer *timer;
int changedBounds;
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        rectangles=[[NSMutableArray array] retain];
        
        
        [self registerAsObserver];
        for(int i=0;i<5;i++)
        {
            Rectangle *r=[[Rectangle alloc]init];
                    
            int x = (arc4random() % 2) * 2 - 1;
            int y = (arc4random() % 2) * 2 - 1;
            
            [r setX:x
               setY:y];
            [rectangles addObject:r];
            [r release];
            r=nil;
        }
    }
    return self;
}




- (void)registerAsObserver {
    [self addObserver:self
              forKeyPath:@"self.bounds"
                 options:(NSKeyValueObservingOptionNew |
                          NSKeyValueObservingOptionOld)
                 context:&changedBounds];
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context {
    if (context==&changedBounds) {
        [self setSelfBounds:self.bounds];
    }
}

- (void)setSelfBounds:(CGRect )newSelfBounds {
        for (int i=0;i<rectangles.count;i++) {
        [[rectangles objectAtIndex:i] setViewSize:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        int x = arc4random() % (int)(self.bounds.size.width-30);
        int y = arc4random() % (int)(self.bounds.size.height-30);
        [[rectangles objectAtIndex:i] setRectX:x
                                      setRectY:y];
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];
    UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
    _loc = [touch locationInView:touch.view];
    
     
    //[self setNeedsDisplay];
}

-(void)startTimer
{
    timer=[self createTimer];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor blackColor] CGColor]);
    
    for (int i=0;i<rectangles.count;i++) {
        [[rectangles objectAtIndex:i] draw:context];
        [[rectangles objectAtIndex:i] move];
    }
}


- (NSTimer*)createTimer {
    
    return [NSTimer scheduledTimerWithTimeInterval:0.007 target:self selector:@selector(timerTicked:) userInfo:nil repeats:YES];
}


- (void)timerTicked:(NSTimer*)timer {
       [self setNeedsDisplay];
}

- (void)dealloc {
    [rectangles release];
    [super dealloc];
}

//-removeObserver:forKeyPath:

@end
