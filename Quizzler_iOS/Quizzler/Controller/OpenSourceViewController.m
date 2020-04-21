//
//  OpenSourceViewController.m
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/17/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "OpenSourceViewController.h"
#import "Strings.h"

@interface OpenSourceViewController ()

@end

@implementation OpenSourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.openSourceTextView.text = COPYRIGHT;
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClicked)];
    [self.flaLink addGestureRecognizer:gesture];
}

- (void) labelClicked {
    NSURL *URL = [NSURL URLWithString:FLA_LINK];
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [[UIApplication sharedApplication] openURL:URL options:@{}
           completionHandler:^(BOOL success) {
        }];
    }
    
}

@end
