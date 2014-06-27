//
//  ViewController.m
//  SceneKitExObjC
//
//  Created by yeuchi on 6/27/14.
//  Copyright (c) 2014 yeuchi. All rights reserved.
//

#import "ViewController.h"
#import "FirstSceneView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet FirstSceneView *sceneView;
@property (strong, nonatomic) IBOutlet UIImageView *image;

// http://ronnqvi.st/3d-with-scenekit/ - nice article but not sure how he is rendering in webpage. References missing.
// http://iphonedevelopment.blogspot.com/2012/08/an-introduction-to-scenekit.html - sample code

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   /* CGRect  viewRect = CGRectMake(10, 10, 100, 100);
    FirstSceneView *sceneView = [[FirstSceneView alloc]initWithFrame:viewRect];
    [self.view addSubview:sceneView]; */
    [self.sceneView setup: self.image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
