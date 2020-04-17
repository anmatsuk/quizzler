//
//  AboutUsControllerViewController.m
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/14/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "AboutUsControllerViewController.h"
#import "Strings.h"

@interface AboutUsControllerViewController ()

@end

@implementation AboutUsControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSBundle mainBundle] infoDictionary];
    NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString* version = [infoDict objectForKey:@"CFBundleVersion"];
    NSString* bVersion = [infoDict objectForKey:@"CFBundleShortVersionString"];
    self.versionLabel.text = [NSString stringWithFormat:@"%@ %@ (%@)", VERSION_TEXT, bVersion, version];
    self.poweredLabel.text = [NSString stringWithFormat:@"%@ %@", POWERED_BY_TEXT, GO_QUIZZY_LAB];
    self.withLoveLabel.text = [NSString stringWithFormat:@"Made with 🐭 in San Jose"];
    // Do any additional setup after loading the view.
}

#pragma mark -
#pragma mark: TableViewMethods

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                          reuseIdentifier:cellIdentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.textLabel.text = PRIVACY_POLICY_TEXT;
    }
    else if (indexPath.row == 1){
        cell.textLabel.text = OPEN_SOURCE_TEXT;
    }
    else {
        cell.textLabel.text = SEND_FEEDBACK_TEXT;
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) { //Privacy Policy
        NSURL *URL = [NSURL URLWithString:POLICY_LINK];
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            [[UIApplication sharedApplication] openURL:URL options:@{}
               completionHandler:^(BOOL success) {
            }];
        }
    }
    else if (indexPath.row == 1) { //push open source libs
        
    }
    else if (indexPath.row == 2) { //send feedback
        [self performSegueWithIdentifier:@"sendFeedbackSegue" sender:self];
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0f;
}


#pragma mark -
#pragma mark: Functions







@end
