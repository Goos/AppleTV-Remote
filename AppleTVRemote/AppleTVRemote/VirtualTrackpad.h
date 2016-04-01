//
//  VirtualTrackpad.h
//  AppleTVRemote
//
//  Created by Robin Goos on 03/12/15.
//  Copyright © 2015 Robin Goos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VirtualTrackpad : NSObject

@property (nonatomic, strong, readonly) UIWindow *window;

- (instancetype)initWithWindow:(UIWindow *)window;

- (void)beginTouchAtPoint:(CGPoint)point;
- (void)moveTouchToPoint:(CGPoint)point;
- (void)endTouchAtPoint:(CGPoint)point;

- (void)beginTouchAtRelativePoint:(CGPoint)point;
- (void)moveTouchToRelativePoint:(CGPoint)point;
- (void)endTouchAtRelativePoint:(CGPoint)point;

@end
