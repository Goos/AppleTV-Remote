//
//  UITouch+Emulation.m
//  AppleTVRemote
//
//  Created by Robin Goos on 03/12/15.
//  Copyright © 2015 Robin Goos. All rights reserved.
//

#import "UITouch+Emulation.h"

@interface UITouch (Emulation)

- (id)initAtPoint:(CGPoint)point inWindow:(UIWindow *)window;
- (id)initInView:(UIView *)view;
- (id)initAtPoint:(CGPoint)point inView:(UIView *)view;

- (void)setLocationInWindow:(CGPoint)location;
- (void)setPhaseAndUpdateTimestamp:(UITouchPhase)phase;

@end