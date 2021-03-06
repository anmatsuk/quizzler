//
//  ViewController.m
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/9/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "ViewController.h"
#import "QuestionViewController.h"
#import "QuizzlerData.h"
#import "Strings.h"

@interface ViewController () {
    UIGestureRecognizer *tapper;
    NSArray *questions;
    NSString *quizzlerId;
    NSNumber *width;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.goQuizzlyButton.layer.cornerRadius = 6;
    self.quizzCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];

//    Set tab bar item image
    UIImage *img = [UIImage imageNamed:@"home"];
    self.tabBarController.tabBar.items.firstObject.image = img;
    self.tabBarController.tabBar.items.lastObject.image = [UIImage imageNamed:@"about"];;

    
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.quizzCodeTextField.text = @"";
    [self.goQuizzlyButton setTitle:GO_QUIZZ_BUTTON_TITLE forState:UIControlStateNormal];
    questions = nil;
}

- (IBAction)nextButtonAction:(id)sender {
    [self.goQuizzlyButton setTitle:@"Loading..." forState:UIControlStateNormal];
    quizzlerId = [self.quizzCodeTextField text];
    if (quizzlerId == nil || quizzlerId.length == 0) {
        [self showAlertMessageWithTitle:ERROR withMessage:ERROR_CODE_EMPTY];
        return;
    }
    [self startQuestions];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
/* for backspace */
    if([string length]==0) {
       return YES;
    }

    NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    for (int i = 0; i < [string length]; i++) {
       unichar c = [string characterAtIndex:i];
       if ([myCharSet characterIsMember:c]) {
          return YES;
      }
    }

    return NO;
}

// Dissmiss Keyboard
- (void)handleSingleTap:(UITapGestureRecognizer *) sender {
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark: Segue

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showQuestionViewController"]) {
        QuestionViewController *vc = [segue destinationViewController];
        [vc setQuestions:questions];
        [vc setQuizzlerId:quizzlerId];
    }
}

#pragma mark -
#pragma mark: Functions

- (void) startQuestions{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"deviceId"]) {
        NSLog(@"%@", @"Need add device_id to user defaults");
        [QuizzlerData generateDeviceId:^(SimpleAPIResponse *response) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (response) {
                    if (response.error) {
                        [self showAlertMessageWithTitle:ERROR withMessage:ERROR_CONNECTION];
                    }
                    NSError *parseError = nil;
                    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:[response responseObject] options:0 error:&parseError];
                    NSLog(@"Deviceid: %@", [responseDictionary valueForKey:@"deviceId"]);
                    [defaults setObject:[responseDictionary valueForKey:@"deviceId"] forKey:@"deviceId"];
                    [self getQuestionsForId];
                }
            });
        }];
    }
    else {
        NSLog(@"DeviceId exists : %@", [defaults objectForKey:@"deviceId"]);
        [self getQuestionsForId];
    }
}

- (void) getQuestionsForId {
    NSLog(@"Fetching questions for: %@", quizzlerId);
    [QuizzlerData requestQuestionsByID:quizzlerId complition:^(SimpleAPIResponse *response) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (response) {
                if (response.error) {
                    [self showAlertMessageWithTitle:ERROR withMessage:ERROR_CONNECTION];
                    //[self.goQuizzlyButton setTitle:GO_QUIZZ_BUTTON_TITLE forState:UIControlStateNormal];
                }
                else {
                    
                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                    
                    if(httpResponse.statusCode == 200) {
                        NSLog(@"%@", @"We got question list keep moving to the nex screen");
                        NSError *parseError = nil;
                        self->questions = [NSJSONSerialization JSONObjectWithData:[response responseObject] options:0 error:&parseError];
                        [self performSegueWithIdentifier:@"showQuestionViewController" sender:self];
                    }
                    else {
                        [self showAlertMessageWithTitle:ERROR withMessage:ERROR_CODE_NOT_EXISTS];
                    }
                }
            }
        });
    }];
}

#pragma mark -
#pragma mark: Alert

- (void) showAlertMessageWithTitle:(NSString *) title withMessage:(NSString *) message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                   message:message
                                   preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
    }];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:^(){
        [self.goQuizzlyButton setTitle:GO_QUIZZ_BUTTON_TITLE forState:UIControlStateNormal];
    }];
}

@end
