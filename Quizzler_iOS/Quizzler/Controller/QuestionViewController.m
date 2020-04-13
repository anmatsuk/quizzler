//
//  QuestionViewController.m
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/10/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "QuestionViewController.h"
#import "QuizzlerData.h"
#import "Strings.h"

@interface QuestionViewController () {
    int questionIndex;
    int questionCount;
    NSArray *buttons;
    NSMutableDictionary *params;
    
}

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    params = [[NSMutableDictionary alloc] init];
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    [params setValue:[defaults objectForKey:@"deviceId"] forKey:@"deviceId"];
    
    questionCount = (int)([_questions count]);
    buttons = [[self.questions objectAtIndex:questionIndex] valueForKey:@"buttons"];
    [params setValue:[[_questions objectAtIndex:questionIndex] valueForKey: @"questionId"] forKey:@"questionId"];
    [self showButtons];
    if (![defaults objectForKey:_quizzlerId]) {
        questionIndex = 0;
        self.questionText.text = [[self.questions objectAtIndex:questionIndex] valueForKey:@"text"];
        self.progressBarWidth.constant = 0;
    }
    else {
        questionIndex = (int)[[defaults objectForKey:_quizzlerId] integerValue];
         [self updateUI];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
       addObserver:self selector:@selector(orientationChanged:)
       name:UIDeviceOrientationDidChangeNotification
       object:[UIDevice currentDevice]];
    
    UIInterfaceOrientation orientation = [[[[[UIApplication sharedApplication] windows] firstObject] windowScene] interfaceOrientation];

    if(orientation == UIInterfaceOrientationLandscapeLeft) {
        self.questionTextBottomConstraint.constant = -75;
    }
    else if(orientation == UIInterfaceOrientationLandscapeRight) {
        self.questionTextBottomConstraint.constant = -75;
    }

    //Buttons:
    self.answerButton1.layer.borderWidth = 1.0f;
    self.answerButton1.layer.cornerRadius = 6;
    self.answerButton1.layer.borderColor = [[UIColor colorWithRed: 21.0 / 255.0 green: 127.0 / 255.0 blue: 251.0 / 255.0 alpha:1.0]CGColor];
    
    self.answerButton2.layer.borderWidth = 1.0f;
    self.answerButton2.layer.cornerRadius = 6;
    self.answerButton2.layer.borderColor = [[UIColor colorWithRed: 21.0 / 255.0 green: 127.0 / 255.0 blue: 251.0 / 255.0 alpha:1.0]CGColor];
    
    self.answerButton3.layer.borderWidth = 1.0f;
    self.answerButton3.layer.cornerRadius = 6;
    self.answerButton3.layer.borderColor = [[UIColor colorWithRed: 21.0 / 255.0 green: 127.0 / 255.0 blue: 251.0 / 255.0 alpha:1.0]CGColor];
    
    self.answerButton4.layer.borderWidth = 1.0f;
    self.answerButton4.layer.cornerRadius = 6;
    self.answerButton4.layer.borderColor = [[UIColor colorWithRed: 21.0 / 255.0 green: 127.0 / 255.0 blue: 251.0 / 255.0 alpha:1.0]CGColor];
    
    self.doneButton.layer.borderWidth = 1.0f;
    self.doneButton.layer.cornerRadius = 6;
    self.doneButton.layer.borderColor = [[UIColor colorWithRed: 21.0 / 255.0 green: 127.0 / 255.0 blue: 251.0 / 255.0 alpha:1.0]CGColor];
    
    
    self.navigationController.navigationBar.topItem.backBarButtonItem = [[UIBarButtonItem alloc]
    initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void) orientationChanged:(NSNotification *)note
{
   UIDevice * device = note.object;
   switch(device.orientation)
   {
       case UIDeviceOrientationPortrait:
       case UIDeviceOrientationPortraitUpsideDown:
           self.questionTextBottomConstraint.constant = -20;
       break;

       default:
           self.questionTextBottomConstraint.constant = -75;
       break;
   };
}

- (void) showButtons {
    NSInteger count = [buttons count];
    [self.answerButton1 setTitle:[[buttons objectAtIndex:0] valueForKey:@"label"] forState:UIControlStateNormal];
    [self.answerButton2 setTitle:[[buttons objectAtIndex:1] valueForKey:@"label"] forState:UIControlStateNormal];
    self.answerButton3.hidden = YES;
    self.answerButton4.hidden = YES;
    if (count == 3) {
        self.answerButton3.hidden = NO;
        self.answerButton4.hidden = YES;
        [self.answerButton3 setTitle:[[buttons objectAtIndex:2] valueForKey:@"label"] forState:UIControlStateNormal];
    }
    else if (count == 4) {
        self.answerButton4.hidden = NO;
        [self.answerButton4 setTitle:[[buttons objectAtIndex:3] valueForKey:@"label"] forState:UIControlStateNormal];
        self.answerButton3.hidden = NO;
        [self.answerButton3 setTitle:[[buttons objectAtIndex:2] valueForKey:@"label"] forState:UIControlStateNormal];
    }
    else {
        self.answerButton3.hidden = YES;
        self.answerButton4.hidden = YES;
    }
}

- (void) updateUI {
    questionIndex += 1;
    self.progressBarWidth.constant = (self.view.frame.size.width / ([_questions count])) * (questionIndex);
    if (questionIndex >= questionCount) {
        self.questionText.text = FINISH_MESSAGE;
        self.answerButton1.hidden = YES;
        self.answerButton2.hidden = YES;
        self.answerButton3.hidden = YES;
        self.answerButton4.hidden = YES;
        self.doneButton.hidden = NO;
        return;
    }
    self.questionText.text = [[self.questions objectAtIndex:questionIndex] valueForKey:@"text"];
    buttons = [[self.questions objectAtIndex:questionIndex] valueForKey:@"buttons"];
    [params setValue:[[_questions objectAtIndex:questionIndex] valueForKey: @"questionId"] forKey:@"questionId"];
    [self showButtons];
    
}

#pragma mark -
#pragma mark - Button

- (IBAction)answerButtonAction:(id)sender {
    NSInteger value = [sender tag];
    switch (value) {
        case 5: {
            params = nil;
            buttons = nil;
            [self.navigationController popViewControllerAnimated:YES];
            return;
        }
            break;
            
        case 1:
        case 2:
        case 3:
        case 4: {
            [self.activityIndicator startAnimating];
            [params setValue:[[buttons objectAtIndex:(value - 1)] objectForKey:@"label"] forKey:@"buttonLabel"];
            [params setValue:[[buttons objectAtIndex:(value - 1)] objectForKey:@"weight"] forKey:@"buttonWeight"];
            [QuizzlerData sendQuestionResponse:params withComplition:^(id<APIResponse> response) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self->_activityIndicator stopAnimating];
                    if (response) {
                        if (response.error) {
                            [self showAlertMessageWithTitle:ERROR withMessage:ERROR_CONNECTION];
                        }
                        else {
                            
                            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                            if(httpResponse.statusCode == 200) {
                                NSLog(@"%@", @"Saved!");
                                NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
                                [defaults setObject:[NSString stringWithFormat:@"%d", self->questionIndex] forKey:self->_quizzlerId];
                                [self updateUI];
                            }
                            else {
                                [self showAlertMessageWithTitle:ERROR withMessage:ERROR_CONNECTION];
                            }
                        }
                    }
                });
            }];
        }
            break;
        default: {

        }
            break;
    }
}


#pragma mark -
#pragma mark: Alert

- (void) showAlertMessageWithTitle:(NSString *) title withMessage:(NSString *) message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                   message:message
                                   preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
