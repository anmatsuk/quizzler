//
//  QuestionViewController.h
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/10/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLAnimatedImageView.h"
#import "AnswerButton.h"

@interface QuestionViewController : UIViewController 
@property (weak, nonatomic) IBOutlet FLAnimatedImageView *gifActivityIndicator;
@property (weak, nonatomic) IBOutlet UIView *gifBackgroudView;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurView;


@property NSArray *questions;

@property NSString* quizzlerId;

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UILabel *questionText;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *progressBarWidth;

//buttons:
@property (weak, nonatomic) IBOutlet AnswerButton *answerButton1;
@property (weak, nonatomic) IBOutlet AnswerButton *answerButton2;
@property (weak, nonatomic) IBOutlet AnswerButton *answerButton3;
@property (weak, nonatomic) IBOutlet AnswerButton *answerButton4;
@property (weak, nonatomic) IBOutlet AnswerButton *doneButton;

@end
