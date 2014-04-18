//
//  ExampleScene.m
//  Cocos2dApportableExtensions
//
//  Created by Luciano Marisi on 18/04/2014.
//  Copyright 2014 TechBrewers LTD. All rights reserved.
//

#import "ExampleScene.h"
#import "CCDirector+ApportableAndroidButtonEvents.h"
#import "cocos2d-ui.h"

@interface ExampleScene ()

@property (nonatomic, strong) CCNodeColor *backButtonPressedNodeColor;

@end

@implementation ExampleScene

- (void)onEnter
{
    [super onEnter];
    
    CCLabelTTF *backButtonPressLabel = [CCLabelTTF labelWithString:@"Press the back button\n on your Android device!"
                                                          fontName:@"Helvetica"
                                                          fontSize:20];
    backButtonPressLabel.horizontalAlignment = CCTextAlignmentCenter;
    backButtonPressLabel.positionType = CCPositionTypeNormalized;
    backButtonPressLabel.position = ccp(0.5, 0.7);
    [self addChild:backButtonPressLabel];
    
    [self addChild:self.backButtonPressedNodeColor];

    CCButton *button = [CCButton buttonWithTitle:@"Back"
                                        fontName:@"Helvetica"
                                        fontSize:20];
    button.block = ^(CCButton *button)
    {
        [self backButtonPressed];
    };
    
    button.positionType = CCPositionTypeNormalized;
    button.position = ccp(0.5, 0.2);
    [self addChild:button];
    
    [[CCDirector sharedDirector] registerForBackButtonNotificationWithObserver:self
                                                                      selector:@selector(backButtonPressed)
                                                                        object:nil];
}

- (void)onExit
{
    [super onExit];
    [[CCDirector sharedDirector] unregisterForBackButtonNotificationWithObserver:self
                                                                          object:nil];
}


- (void)backButtonPressed
{
    CCActionCallBlock *makeNodeGreen = [CCActionCallBlock actionWithBlock:^{
        self.backButtonPressedNodeColor.color = [CCColor greenColor];
    }];
    
    CCActionInterval *actionInverval = [CCActionInterval actionWithDuration:0.2];
    
    CCActionCallBlock *makeNodeRed = [CCActionCallBlock actionWithBlock:^{
        self.backButtonPressedNodeColor.color = [CCColor redColor];
    }];
    
    CCActionSequence *actionSequence = [CCActionSequence actionWithArray:@[makeNodeGreen, actionInverval, makeNodeRed]];
    [self.backButtonPressedNodeColor stopAllActions];
    [self.backButtonPressedNodeColor runAction:actionSequence];
}


- (CCNodeColor *)backButtonPressedNodeColor
{
    if (!_backButtonPressedNodeColor) {
        _backButtonPressedNodeColor = [[CCNodeColor alloc] initWithColor:[CCColor redColor]];
        _backButtonPressedNodeColor.contentSizeType = CCSizeTypeNormalized;
        _backButtonPressedNodeColor.contentSize = CGSizeMake(0.2, 0.2);
        _backButtonPressedNodeColor.positionType = CCPositionTypeNormalized;
        _backButtonPressedNodeColor.position = ccp(0.5, 0.4);
        _backButtonPressedNodeColor.anchorPoint =  ccp(0.5, 0.5);
    }
    return _backButtonPressedNodeColor;
}

@end