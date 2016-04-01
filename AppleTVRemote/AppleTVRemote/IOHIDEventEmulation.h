//
//  IOHIDEventEmulation.h
//  AppleTVRemote
//
//  Created by Robin Goos on 03/12/15.
//  Copyright © 2015 Robin Goos. All rights reserved.
//

typedef struct __IOHIDEvent * IOHIDEventRef;
IOHIDEventRef IOHIDEventWithTouches(NSArray *touches);
