//
//  GameScene.m
//  cropTest
//
//  Created by Robert Linnemann on 10/17/14.
//  Copyright (c) 2014 Robert Linnemann. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
//    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//    
//    myLabel.text = @"Hello, World!";
//    myLabel.fontSize = 65;
//    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                   CGRectGetMidY(self.frame));
//    
//    [self addChild:myLabel];
//
    self.cropped = NO;
    

}



- (void) cropNodeDown
{
    //crop from bottom up.
    //
    //
    //
    //    ------       ^
    //                 |
    //                 |
    //   |      |
    //    ------
    //
    //
    //   |      |      ^
    //   |      |      |
    //    ------       |
    //
    //
    //    ______
    //   |      |
    //   |      |
    //   L------
    
    // the part I want to run action on
    SKSpriteNode *pic = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    pic.name = @"PictureNode";
    pic.position = CGPointMake(0,pic.size.height/2);
    CGFloat properWidth = pic.size.width;

    SKSpriteNode *mask = [SKSpriteNode spriteNodeWithColor:[SKColor blackColor] size:CGSizeMake(properWidth, 0)];

    SKCropNode *cropNode = [SKCropNode node];

    cropNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/4);
    [cropNode addChild:pic];
    [cropNode setMaskNode:mask];
    [self addChild:cropNode];
    
    SKAction *resizeY = [SKAction resizeToHeight:pic.size.height*2 duration:0.5];
    [mask runAction:resizeY];
            self.cropped = YES;
}

- (void) cropNodeUp
{
    //crop from bottom up.
    //
    //
    //
    //    ------       ↓
    //                 ↓
    //                 ↓
    //   |      |
    //    ------
    //
    //
    //   |      |
    //   |      |
    //    ------
    //
    //
    //    ______
    //   |      |
    //   |      |
    //   L------
    
    // the part I want to run action on
    SKSpriteNode *pic = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    pic.name = @"PictureNode";
    pic.position = CGPointMake(0,-pic.size.height/2);
    CGFloat properWidth = pic.size.width;
    
    SKSpriteNode *mask = [SKSpriteNode spriteNodeWithColor:[SKColor blackColor] size:CGSizeMake(properWidth, 0)];
    
    SKCropNode *cropNode = [SKCropNode node];
    
    cropNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/4);
    [cropNode addChild:pic];
    [cropNode setMaskNode:mask];
    [self addChild:cropNode];
    
    SKAction *resizeY = [SKAction resizeToHeight:pic.size.height*2 duration:0.5];
    [mask runAction:resizeY];
    self.cropped = YES;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if(self.cropped){
        [self removeAllChildren];
        [self cropNodeUp];
    } else {
        [self cropNodeUp];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
