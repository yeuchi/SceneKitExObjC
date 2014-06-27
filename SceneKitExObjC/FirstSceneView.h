//
//  FirstSceneView.h
//  SceneKitExObjC
//
//  Created by yeuchi on 6/27/14.
//  Copyright (c) 2014 yeuchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>

@interface FirstSceneView : SCNView


@property(strong, nonatomic) SCNTorus *torus;
@property(strong, nonatomic) SCNNode *torusNode;
@property(weak, nonatomic) UIImageView *image;

-(void)setup: (UIImageView*) image;
@end
