//
//  UITouch+Emulation.h
//  AppleTVRemote
//
//  Created by Robin Goos on 03/12/15.
//  Copyright © 2015 Robin Goos. All rights reserved.
//

#import <UIKit/UIKit.h>

// Exposes methods of UITouchesEvent so that the compiler doesn't complain
@interface UIEvent (PrivateHeaders)
- (void)_addTouch:(UITouch *)touch forDelayedDelivery:(BOOL)arg2;
- (void)_clearTouches;
@end

@interface UIEvent (Emulation)
- (void)emulateIOHIDEventWithTouches:(NSArray *)touches;
@end