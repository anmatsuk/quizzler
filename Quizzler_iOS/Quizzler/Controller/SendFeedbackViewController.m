//
//  SendFeedbackViewController.m
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/16/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "SendFeedbackViewController.h"
#import "Strings.h"
#import "QuizzlerData.h"

@interface SendFeedbackViewController ()

@end

@implementation SendFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //To make the border look very close to a UITextField
    [self.sendFeedbackTextView.layer setBorderColor:[[[UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:1.0f] colorWithAlphaComponent:0.9] CGColor]];
    [self.sendFeedbackTextView.layer setBorderWidth:1.0];
    self.sendFeedbackButton.layer.cornerRadius = 6;
    self.feedbackInfoLabel.text = FEEDBACK_TEXT;
    
    //The rounded corner part, where you specify your view's corner radius:
    self.sendFeedbackTextView.layer.cornerRadius = 5;
    self.sendFeedbackTextView.text = ENTER_YOUR_FEEDBACK_TEXT;
    self.sendFeedbackTextView.textColor = [UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:1.0f];
}
- (IBAction)sendFeedbackButtonAction:(id)sender {
    //send feedback
    NSString *email = _emailTextField.text;
    NSString *feedback = _sendFeedbackTextView.text;
    if ([feedback isEqualToString:ENTER_YOUR_FEEDBACK_TEXT]) {
        [self showAlertMessageWithTitle:@"Error" withMessage:EMPTY_FEEDBACK];
        return;
    }
    [self.sendFeedbackButton setTitle:@"Sending..." forState:UIControlStateNormal];
    [QuizzlerData sendFeedback:feedback forEmail:email  complition:^(SimpleAPIResponse *response) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (response) {
                if (response.error) {
                    [self showAlertMessageWithTitle:ERROR withMessage:ERROR_CONNECTION];
                }
                else {
                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;                    
                    if(httpResponse.statusCode == 200) {
                        NSLog(@"%@", @"Feedback sent");
                        [self.navigationController popViewControllerAnimated:YES];
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
#pragma mark: UITextView

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([self.sendFeedbackTextView.text isEqualToString: ENTER_YOUR_FEEDBACK_TEXT])
    {
        self.sendFeedbackTextView.text = @"";
        self.sendFeedbackTextView.textColor = [UIColor blackColor];
    }
    [self.sendFeedbackTextView becomeFirstResponder]; //Optional
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([self.sendFeedbackTextView.text isEqualToString:@""]) {
        self.sendFeedbackTextView.text = ENTER_YOUR_FEEDBACK_TEXT;
        self.sendFeedbackTextView.textColor = [UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:1.0f];
    }
    [self.sendFeedbackTextView resignFirstResponder];
}

- (void) showAlertMessageWithTitle:(NSString *) title withMessage:(NSString *) message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                   message:message
                                   preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
    }];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:^(){
        [self.sendFeedbackButton setTitle:SEND_TEXT forState:UIControlStateNormal];
    }];
}

@end
