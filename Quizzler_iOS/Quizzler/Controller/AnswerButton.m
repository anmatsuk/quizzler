//
//  AnswerButton.m
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/14/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "AnswerButton.h"

@implementation AnswerButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];

    if (highlighted) {
        self.backgroundColor = [UIColor colorWithRed: 21.0 / 255.0 green: 127.0 / 255.0 blue: 251.0 / 255.0 alpha:1.0];
    }
    else {
        self.backgroundColor = [UIColor whiteColor];
    }
}

@end
