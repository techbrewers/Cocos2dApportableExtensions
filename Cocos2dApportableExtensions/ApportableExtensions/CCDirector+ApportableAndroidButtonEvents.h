//
//  CCDirector+ApportableAndroidButtonEvents.h
//  Cocos2dApportableExtensions
//
//  Created by Luciano Marisi on 18/04/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "CCDirector.h"

@interface CCDirector (ApportableAndroidButtonEvents)

- (void)registerForBackButtonNotificationWithObserver:(id)observer
                                             selector:(SEL)selector
                                               object:(id)object;

- (void)unregisterForBackButtonNotificationWithObserver:(id)observer
                                                 object:(id)object;

- (void)registerForMenuButtonNotificationWithObserver:(id)observer
                                             selector:(SEL)selector
                                               object:(id)object;

- (void)unregisterForMenuButtonNotificationWithObserver:(id)observer
                                                 object:(id)object;

@end
