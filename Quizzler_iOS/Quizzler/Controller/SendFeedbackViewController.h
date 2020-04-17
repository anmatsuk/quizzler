//
//  SendFeedbackViewController.h
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/16/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "ViewController.h"

@interface SendFeedbackViewController : ViewController<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *sendFeedbackTextView;
@property (weak, nonatomic) IBOutlet UIButton *sendFeedbackButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;

@end
