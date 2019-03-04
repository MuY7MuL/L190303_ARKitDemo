//
//  ShowScnViewController.m
//  L190301_ARKitDemo
//
//  Created by Mumu on 2019/3/4.
//  Copyright © 2019 LinYan. All rights reserved.
//

#import "ShowScnViewController.h"
#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>

@interface ShowScnViewController ()<ARSCNViewDelegate>

@property (strong, nonatomic) IBOutlet ARSCNView *scnSceneView;
@end

@implementation ShowScnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Set the view's delegate
    self.scnSceneView.delegate = self;
    // Show statistics such as fps and timing information
    self.scnSceneView.showsStatistics = YES;
    // Create a new scene
    SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/Stick_Figure_by_Swp_scn.scn"];
    // Set the scene to the view
    self.scnSceneView.scene = scene;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Create a session configuration
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    // Run the view's session
    [self.scnSceneView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // Pause the view's session
    [self.scnSceneView.session pause];
}

@end
