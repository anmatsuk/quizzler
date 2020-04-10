//
//  QuizzlerData.h
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/9/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIResponse.h"

typedef void(^UsersResponseBlock)(SimpleAPIResponse *response);

@interface QuizzlerData : NSObject

+ (NSURLSessionDataTask *)requestQuestionsByID:(UsersResponseBlock)completion;

@end
