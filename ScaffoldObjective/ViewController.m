//
//  ViewController.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/29/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import "ViewController.h"
#import "SCAFDownloader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SCAFDownloader * sDownloader = [[SCAFDownloader alloc] init];
    [sDownloader login]; //test
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
