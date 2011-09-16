/*
 * HelloWorldLayer.m
 * 
 * Copyright 2011 Eric Yim.
 * Created by Eric Yim on 11-09-12.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to 
 * deal in the Software without restriction, including without limitation the 
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
 * IN THE SOFTWARE.
 *
 */


// Import the interfaces
#import "HelloWorldLayer.h"
#import "NDControlButton.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"No Event" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label z:1 tag:kLabelTag];
        
        CCSprite *normal = [CCSprite spriteWithFile:@"Icon-Small.png"];
        CCSprite *selected = [CCSprite spriteWithFile:@"Icon-Small.png"];
        selected.opacity = 180;
        // create first button with above sprites
        NDControlButton *button1 = [NDControlButton buttonWithNormalSprite:normal 
                                                           selectedSprite:selected];
        // position button
        button1.position = ccp(0.2 * size.width, 100.0f);
        // add button to layer
        [self addChild:button1 z:1 tag:kButton1Tag];
        
        // setup event handlers
        [button1 addTarget:self action:@selector(touchDown:) forControlEvents:CCControlEventTouchDown];
        [button1 addTarget:self action:@selector(touchDragInside:) forControlEvents:CCControlEventTouchDragInside];
        [button1 addTarget:self action:@selector(touchDragOutside:) forControlEvents:CCControlEventTouchDragOutside];
        [button1 addTarget:self action:@selector(touchDragEnter:) forControlEvents:CCControlEventTouchDragEnter];
        [button1 addTarget:self action:@selector(touchDragExit:) forControlEvents:CCControlEventTouchDragExit];
        [button1 addTarget:self action:@selector(touchUpInside:) forControlEvents:CCControlEventTouchUpInside];
        [button1 addTarget:self action:@selector(touchUpOutside:) forControlEvents:CCControlEventTouchUpOutside];
        [button1 addTarget:self action:@selector(touchCancel:) forControlEvents:CCControlEventTouchCancel];
        // NDControlButton doesn't support value changed events
        [button1 addTarget:self action:@selector(valueChanged:) forControlEvents:CCControlEventValueChanged];
        button1.enabled = NO;
        
        normal = [CCSprite spriteWithFile:@"Icon-Small.png"];
        selected = [CCSprite spriteWithFile:@"Icon-Small.png"];
        // create second button with above sprites
        // button2 toggles button1 on and off
        NDControlButton *button2 = [NDControlButton buttonWithNormalSprite:normal 
                                                            selectedSprite:selected];
        // position button
        button2.position = ccp(0.8 * size.width, 100.0f);
        // add button to layer
        [self addChild:button2 z:1 tag:kButton2Tag];
        
        // setup event handlers
        [button2 addTarget:self action:@selector(touchUpInside:) forControlEvents:CCControlEventTouchUpInside];

	}
	return self;
}

#pragma Event Handlers

- (void)touchDown:(NDControlButton *)sender {
    CCLabelTTF *label = (CCLabelTTF *)[self getChildByTag:kLabelTag];
    label.string = [NSString stringWithFormat:@"Touch down!"];
}

- (void)touchDragInside:(NDControlButton *)sender {
    CCLabelTTF *label = (CCLabelTTF *)[self getChildByTag:kLabelTag];
    label.string = [NSString stringWithFormat:@"Drag inside."];
}

- (void)touchDragOutside:(NDControlButton *)sender {
    CCLabelTTF *label = (CCLabelTTF *)[self getChildByTag:kLabelTag];
    label.string = [NSString stringWithFormat:@"Drag outside."];
}

- (void)touchDragEnter:(NDControlButton *)sender {
    CCLabelTTF *label = (CCLabelTTF *)[self getChildByTag:kLabelTag];
    label.string = [NSString stringWithFormat:@"Drag enter."];
}

- (void)touchDragExit:(NDControlButton *)sender {
    CCLabelTTF *label = (CCLabelTTF *)[self getChildByTag:kLabelTag];
    label.string = [NSString stringWithFormat:@"Drag exit."];
}

- (void)touchUpInside:(NDControlButton *)sender {
    NDControlButton *button2 = (NDControlButton *)[self getChildByTag:kButton2Tag];
    if ([sender isEqual:button2]) {
        NDControlButton *button1 = (NDControlButton *)[self getChildByTag:kButton1Tag];
        button1.enabled = !button1.enabled;
    }
    else {
        CCLabelTTF *label = (CCLabelTTF *)[self getChildByTag:kLabelTag];
        label.string = [NSString stringWithFormat:@"Touch up inside."];
    }
}

- (void)touchUpOutside:(NDControlButton *)sender {
    CCLabelTTF *label = (CCLabelTTF *)[self getChildByTag:kLabelTag];
    label.string = [NSString stringWithFormat:@"Touch up outside."];
}

- (void)touchCancel:(NDControlButton *)sender {
    CCLabelTTF *label = (CCLabelTTF *)[self getChildByTag:kLabelTag];
    label.string = [NSString stringWithFormat:@"Touch cancelled."];
}

- (void)valueChanged:(NDControlButton *)sender {
    CCLabelTTF *label = (CCLabelTTF *)[self getChildByTag:kLabelTag];
    label.string = [NSString stringWithFormat:@"Value changed?"];
}

@end