//
//  CCDirector+ApportableAndroidButtonEvents.m
//
//  Cocos2dApportableExtensions
//
//  Created by Luciano Marisi on 18/04/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "CCDirector+ApportableAndroidButtonEvents.h"

static NSString *const CCBackButtonPressedNotification = @"CCBackButtonPressedNotification";
static NSString *const CCMenuButtonPressedNotification = @"CCMenuButtonPressedNotification";

@implementation CCDirector (ApportableAndroidButtonEvents)

- (void)registerForBackButtonNotificationWithObserver:(id)observer
                                             selector:(SEL)selector
                                               object:(id)object
{
    [[CCDirector sharedDirector] becomeFirstResponder];
    [[NSNotificationCenter defaultCenter] addObserver:observer
                                             selector:selector
                                                 name:CCBackButtonPressedNotification
                                               object:object];
}

- (void)unregisterForBackButtonNotificationWithObserver:(id)observer
                                                 object:(id)object
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer
                                                    name:CCBackButtonPressedNotification
                                                  object:object];
}


- (void)registerForMenuButtonNotificationWithObserver:(id)observer
                                             selector:(SEL)selector
                                               object:(id)object
{
    [[CCDirector sharedDirector] becomeFirstResponder];
    [[NSNotificationCenter defaultCenter] addObserver:observer
                                             selector:selector
                                                 name:CCMenuButtonPressedNotification
                                               object:object];
}

- (void)unregisterForMenuButtonNotificationWithObserver:(id)observer
                                                 object:(id)object
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer
                                                    name:CCMenuButtonPressedNotification
                                                  object:object];
}


#ifdef APPORTABLE
- (void)buttonUpWithEvent:(UIEvent *)event
{
    switch (event.buttonCode)
    {
        case UIEventButtonCodeBack:
            [[NSNotificationCenter defaultCenter] postNotificationName:CCBackButtonPressedNotification
                                                                object:nil];
            break;
            
        case UIEventButtonCodeMenu:
            [[NSNotificationCenter defaultCenter] postNotificationName:CCMenuButtonPressedNotification
                                                                object:nil];
            break;
            
        default:
            break;
    }
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}
#endif

@end