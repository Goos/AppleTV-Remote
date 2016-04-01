//
//  UITouch+Emulation.m
//  AppleTVRemote
//
//  Created by Robin Goos on 03/12/15.
//  Copyright © 2015 Robin Goos. All rights reserved.
//

#import "UIEvent+Emulation.h"
#import "IOHIDEventEmulation.h"

@interface UIEvent (MorePrivateHeaders)
- (void)_setHIDEvent:(IOHIDEventRef)event;
- (void)_setTimestamp:(NSTimeInterval)timestemp;
@end

@implementation UIEvent (Emulation)

- (void)emulateEventWithTouches:(NSArray *)touches
{
    [self emulateIOHIDEventWithTouches:touches];
}

- (void)emulateIOHIDEventWithTouches:(NSArray *)touches
{
    IOHIDEventRef event = IOHIDEventWithTouches(touches);
    [self _setHIDEvent:event];
}

@end