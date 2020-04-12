//
//  QuestionViewController.m
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/10/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "QuestionViewController.h"
#import "Strings.h"

@interface QuestionViewController () {
    int questionIndex;
    int questionCount;
    NSArray *buttons;
}

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.questionText.text = @"1";
    self.questionText.text = [[self.questions objectAtIndex:0] valueForKey:@"text"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
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
    self.progressBarWidth.constant = 0;
    questionIndex = 0;
    questionCount = (int)([_questions count]);
    buttons = [[self.questions objectAtIndex:questionIndex] valueForKey:@"buttons"];
    [self showButtons];
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
    }
    else {
        self.answerButton3.hidden = YES;
        self.answerButton4.hidden = YES;
    }
}

- (void) updateUI {
    questionIndex += 1;
    self.progressBarWidth.constant = (self.view.frame.size.width / ([_questions count])) * (questionIndex);
    if (questionIndex == questionCount) {
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
    [self showButtons];
    
}

#pragma mark -
#pragma mark - Button

- (IBAction)answerButtonAction:(id)sender {
    //need to send answer to server
    NSInteger value = [sender tag];
    switch (value) {
        case 5: {
            [self.navigationController popViewControllerAnimated:YES];
            return;
        }
            
            break;
            
        default:
            break;
    }
    
    [self updateUI];
}

@end
