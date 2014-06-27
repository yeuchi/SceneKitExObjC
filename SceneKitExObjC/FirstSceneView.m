//
//  FirstSceneView.m
//  SceneKitExObjC
//
//  Created by yeuchi on 6/27/14.
//  Copyright (c) 2014 yeuchi. All rights reserved.
//

#import "FirstSceneView.h"

@implementation FirstSceneView

//https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SceneKit_Framework/SceneKit_Framework.pdf

// demo shapes
//https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNPlane_Class/index.html#//apple_ref/occ/cl/SCNPlane
-(void)setup
{
    self.backgroundColor = [UIColor grayColor];
    
    // Create an empty scene
    SCNScene *scene = [SCNScene scene];
    self.scene = scene;
    
    // Create a camera
    SCNCamera *camera = [SCNCamera camera];
    camera.xFov = 45;   // Degrees, not radians
    camera.yFov = 80;
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = camera;
    cameraNode.position = SCNVector3Make(00, 50, 90);
    [scene.rootNode addChildNode:cameraNode];
    
    
    // Create a torus
    SCNTorus *torus = [SCNTorus torusWithRingRadius:8 pipeRadius:3];
    SCNNode *torusNode = [SCNNode nodeWithGeometry:torus];
    double radian = 3.14 / 180.0;
    //CATransform3D rot = CATransform3DMakeRotation(radian * 45.0, 1, 0, 0);
    SCNMatrix4 transform;
    // identity
    transform.m11 = 1;
    transform.m21 = 0;
    transform.m22 = 1;
    transform.m33 = 1;
    
    //torusNode.transform = transform;
    [scene.rootNode addChildNode:torusNode];
    
    // Create ambient light
    SCNLight *ambientLight = [SCNLight light];
    SCNNode *ambientLightNode = [SCNNode node];
    ambientLight.type = SCNLightTypeAmbient;
    ambientLight.color = [UIColor redColor];
    ambientLightNode.light = ambientLight;
    [scene.rootNode addChildNode:ambientLightNode];
    
    // Create a diffuse light
    SCNLight *diffuseLight = [SCNLight light];
    SCNNode *diffuseLightNode = [SCNNode node];
    diffuseLight.type = SCNLightTypeOmni;
    diffuseLightNode.light = diffuseLight;
    diffuseLightNode.position = SCNVector3Make(-30, 30, 50);
    [scene.rootNode addChildNode:diffuseLightNode];
}

-(id)initWithFrame:(CGRect)frame
{
    return [super initWithFrame:frame];
}

@end
