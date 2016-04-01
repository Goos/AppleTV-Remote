//
//  VirtualTrackpad.m
//  AppleTVRemote
//
//  Created by Robin Goos on 03/12/15.
//  Copyright © 2015 Robin Goos. All rights reserved.
//

#import "VirtualTrackpad.h"
#import "UIEvent+Emulation.h"
#import "UITouch+Emulation.h"

@interface UIApplication (PrivateAdditions)
- (UIEvent *)_touchesEvent;
@end

@implementation VirtualTrackpad {
    UITouch *_currentTouch;
}

- (instancetype)initWithWindow:(UIWindow *)window
{
    self = [super init];
    if (self) {
        _window = window;
    }
    return self;
}

- (UIEvent *)eventWithTouches:(NSArray *)touches
{
    UIEvent *event = [[UIApplication sharedApplication] _touchesEvent];
    
    [event _clearTouches];
    [event emulateIOHIDEventWithTouches:touches];

    for (UITouch *aTouch in touches) {
        [event _addTouch:aTouch forDelayedDelivery:NO];
    }

    return event;
}

- (UIEvent *)eventWithTouch:(UITouch *)touch;
{
    NSArray *touches = touch ? @[touch] : nil;
    return [self eventWithTouches:touches];
}

- (void)beginTouchAtPoint:(CGPoint)point {
    _currentTouch = [[UITouch alloc] initAtPoint:point inWindow:_window];
    [_currentTouch setPhaseAndUpdateTimestamp:UITouchPhaseBegan];
    
    UIEvent *event = [self eventWithTouch:_currentTouch];
    [[UIApplication sharedApplication] sendEvent:event];
}

- (void)moveTouchToPoint:(CGPoint)point {
    [_currentTouch setPhaseAndUpdateTimestamp:UITouchPhaseMoved];
    
    UIEvent *event = [self eventWithTouch:_currentTouch];
    [[UIApplication sharedApplication] sendEvent:event];
}

- (void)endTouchAtPoint:(CGPoint)point {
    [_currentTouch setPhaseAndUpdateTimestamp:UITouchPhaseEnded];
    
    UIEvent *event = [self eventWithTouch:_currentTouch];
    [[UIApplication sharedApplication] sendEvent:event];
}

- (CGPoint)absolutePointFromRelativePoint:(CGPoint)relativePoint
{
    CGRect bounds = self.window.bounds;
    CGPoint center = self.window.center;
    CGPoint offset = CGPointMake(relativePoint.x * CGRectGetWidth(bounds), relativePoint.y * CGRectGetHeight(bounds));
    return CGPointMake(center.x + offset.x, center.y + offset.y);
}

- (void)beginTouchAtRelativePoint:(CGPoint)point {
    [self beginTouchAtPoint:[self absolutePointFromRelativePoint:point]];
}

- (void)moveTouchToRelativePoint:(CGPoint)point {
    [self moveTouchToPoint:[self absolutePointFromRelativePoint:point]];
}

- (void)endTouchAtRelativePoint:(CGPoint)point {
    [self endTouchAtPoint:[self absolutePointFromRelativePoint:point]];
}

@end