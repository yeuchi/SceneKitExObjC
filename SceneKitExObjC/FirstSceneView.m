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
// excellent article.


-(void)setup: (UIImageView*) image
{
    self.image = image;
    
    self.backgroundColor = [UIColor grayColor];
    
    // Create an empty scene
    SCNScene *scene = [SCNScene scene];
    self.scene = scene;
    
    // Create a camera
    SCNCamera *camera = [SCNCamera camera];
    camera.xFov = 45;   // Degrees, not radians
    camera.yFov = 45;
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = camera;
    cameraNode.position = SCNVector3Make(00, 0, 45);
    [scene.rootNode addChildNode:cameraNode];
    
    
    // Create a torus
    self.torus = [SCNTorus torusWithRingRadius:8 pipeRadius:3];
    self.torusNode = [SCNNode nodeWithGeometry:self.torus];
    double radian = 3.14 / 180.0;
    
    CATransform3D rot = CATransform3DMakeRotation(radian * 45, 1, 0, 0);
    SCNMatrix4 transform = [self ConvertTransform:rot];
    
    self.torusNode.transform = transform;
    [scene.rootNode addChildNode:self.torusNode];
    
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
    
    // Give the Torus an image-based diffuse
    SCNMaterial *material = [SCNMaterial material];
    material.diffuse.contents  = self.image.image;
    material.specular.contents = [UIColor whiteColor];
    material.shininess = 1.0;
    self.torus.materials = @[material];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.values = [NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:CATransform3DRotate(rot, 0 * M_PI / 2, 1.f, 0.5f, 0.f)],
                        [NSValue valueWithCATransform3D:CATransform3DRotate(rot, 1 * M_PI / 2, 1.f, 0.5f, 0.f)],
                        [NSValue valueWithCATransform3D:CATransform3DRotate(rot, 2 * M_PI / 2, 1.f, 0.5f, 0.f)],
                        [NSValue valueWithCATransform3D:CATransform3DRotate(rot, 3 * M_PI / 2, 1.f, 0.5f, 0.f)],
                        [NSValue valueWithCATransform3D:CATransform3DRotate(rot, 4 * M_PI / 2, 1.f, 0.5f, 0.f)],
                        nil];
    animation.duration = 3.f;
    animation.repeatCount = HUGE_VALF;
    
    [self.torusNode addAnimation:animation forKey:@"transform"];
}

-(SCNMatrix4)ConvertTransform: (CATransform3D) rot
{
    SCNMatrix4 transform;
    
    // identity
    transform.m11 = rot.m11;
    transform.m12 = rot.m12;
    transform.m13 = rot.m13;
    transform.m14 = rot.m14;
    
    transform.m21 = rot.m21;
    transform.m22 = rot.m22;
    transform.m23 = rot.m23;
    transform.m24 = rot.m24;
    
    transform.m31 = rot.m31;
    transform.m32 = rot.m32;
    transform.m33 = rot.m33;
    transform.m34 = rot.m34;
    
    transform.m41 = rot.m41;
    transform.m42 = rot.m42;
    transform.m43 = rot.m43;
    transform.m44 = rot.m44;
    
    return transform;
}

-(CATransform3D)ConvertMatrix: (SCNMatrix4) rot
{
    CATransform3D transform;
    
    // identity
    transform.m11 = rot.m11;
    transform.m12 = rot.m12;
    transform.m13 = rot.m13;
    transform.m14 = rot.m14;
    
    transform.m21 = rot.m21;
    transform.m22 = rot.m22;
    transform.m23 = rot.m23;
    transform.m24 = rot.m24;
    
    transform.m31 = rot.m31;
    transform.m32 = rot.m32;
    transform.m33 = rot.m33;
    transform.m34 = rot.m34;
    
    transform.m41 = rot.m41;
    transform.m42 = rot.m42;
    transform.m43 = rot.m43;
    transform.m44 = rot.m44;
    
    return transform;
}

-(id)initWithFrame:(CGRect)frame
{
    return [super initWithFrame:frame];
}


@end
