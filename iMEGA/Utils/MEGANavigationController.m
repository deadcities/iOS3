/**
 * @file MEGANavigationController.m
 * @brief The UINavigationController of the app.
 *
 * (c) 2013-2015 by Mega Limited, Auckland, New Zealand
 *
 * This file is part of the MEGA SDK - Client Access Engine.
 *
 * Applications using the MEGA API must present a valid application key
 * and comply with the the rules set forth in the Terms of Service.
 *
 * The MEGA SDK is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * @copyright Simplified (2-clause) BSD License.
 *
 * You should have received a copy of the license along with this
 * program.
 */

#import "Helper.h"

#import "MEGANavigationController.h"

@implementation MEGANavigationController

#pragma mark - Lifecycle

- (BOOL)shouldAutorotate {
    if ([self.topViewController respondsToSelector:@selector(shouldAutorotate)]) {
        return [self.topViewController shouldAutorotate];
    } else {
        return YES;
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] iPhone4X] || [[UIDevice currentDevice] iPhone5X]) {
        return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
    }
    
    if([self.topViewController respondsToSelector:@selector(supportedInterfaceOrientations)]) {
        return [self.topViewController supportedInterfaceOrientations];
    }
    
    return UIInterfaceOrientationMaskAll;
}

//TODO: LANDSCAPE: Delete it or not?
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    if ([self.topViewController respondsToSelector:@selector(supportedInterfaceOrientations)]) {
//        return [self.topViewController preferredInterfaceOrientationForPresentation];
//    }
//    return UIInterfaceOrientationPortrait;
//}

@end
