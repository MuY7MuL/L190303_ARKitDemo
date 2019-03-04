//
//  ShowDaeViewController.m
//  L190301_ARKitDemo
//
//  Created by Mumu on 2019/3/1.
//  Copyright © 2019 LinYan. All rights reserved.
//

#import "ShowObjViewController.h"
#import <ARKit/ARKit.h>
#import <SceneKit/SceneKit.h>


@interface ShowObjViewController () <ARSCNViewDelegate>
 @property (strong, nonatomic) IBOutlet ARSCNView *sceneView;


@end

@implementation ShowObjViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取文件url
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Stick_Figure_by_Swp" withExtension:@"obj"];
    // new SCNReferenceNode 是用来从场景文件中加载node
    SCNReferenceNode * cunstomNode = [SCNReferenceNode referenceNodeWithURL:url];
    [cunstomNode load];
    //new 需要显示的元素
    SCNNode *scnNode = [[SCNNode alloc] init];
    [scnNode addChildNode:cunstomNode];
    //设置 node的scale
    [scnNode setScale: SCNVector3Make(0.05,0.05,0.05)];
    //设置delegate
    self.sceneView.delegate = self;
    //设置显示控制台
    self.sceneView.showsStatistics = YES;
    // 场景添加显示节点
    [self.sceneView.scene.rootNode addChildNode:scnNode];
}

-(void)viewWillAppear:(BOOL)animated{
        [super viewWillAppear:animated];
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    [self.sceneView.session runWithConfiguration:configuration];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.sceneView.session pause];
}


@end
