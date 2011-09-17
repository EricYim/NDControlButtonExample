/*
 * HelloWorldLayer.h
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


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

@class NDControlButton;

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    enum {
        kLabelTag,
        kButton1Tag,
        kOnOffButton,
    }; 
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

- (void)touchDown:(NDControlButton *)sender;
- (void)touchDragInside:(NDControlButton *)sender;
- (void)touchDragOutside:(NDControlButton *)sender;
- (void)touchDragEnter:(NDControlButton *)sender;
- (void)touchDragExit:(NDControlButton *)sender;
- (void)touchUpInside:(NDControlButton *)sender;
- (void)touchUpOutside:(NDControlButton *)sender;
- (void)touchCancel:(NDControlButton *)sender;
- (void)valueChanged:(NDControlButton *)sender;

@end
