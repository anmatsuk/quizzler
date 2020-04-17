//
//  AboutUsControllerViewController.h
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/14/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "ViewController.h"



@interface AboutUsControllerViewController : ViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *aboutTableView;

@property (weak, nonatomic) IBOutlet UILabel *versionLabel;

@property (weak, nonatomic) IBOutlet UILabel *poweredLabel;
@property (weak, nonatomic) IBOutlet UILabel *withLoveLabel;

@end

