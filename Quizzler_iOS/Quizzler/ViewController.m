//
//  ViewController.m
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/9/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "ViewController.h"
#import "QuizzlerData.h"

@interface ViewController () {
    NSMutableArray *questions;
    NSString *qid;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [QuizzlerData requestQuestionsByID:^(SimpleAPIResponse *response) {
        
    }];
    // Do any additional setup after loading the view.
}


@end
