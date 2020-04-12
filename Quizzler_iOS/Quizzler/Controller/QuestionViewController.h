//
//  QuestionViewController.h
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/10/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController 

@property NSArray *questions;

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UILabel *questionText;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *progressBarWidth;


@property (weak, nonatomic) IBOutlet UIButton *answerButton1;
@property (weak, nonatomic) IBOutlet UIButton *answerButton2;
@property (weak, nonatomic) IBOutlet UIButton *answerButton3;
@property (weak, nonatomic) IBOutlet UIButton *answerButton4;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end
