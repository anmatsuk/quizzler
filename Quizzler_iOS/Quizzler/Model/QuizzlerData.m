//
//  QuizzlerData.m
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/9/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "QuizzlerData.h"
#import "APIRequest.h"
#import "APIResponse.h"
#import "NSURLSession+APIClient.h"
#import "Strings.h"



@implementation QuizzlerData

+ (NSURLSessionDataTask *)requestQuestionsByID:(UsersResponseBlock)completion
{
    APIRequest *request = [[APIRequest alloc] init];
    NSURLSession *session = [NSURLSession sharedSession];
    [request setUrl:[NSURL URLWithString:ENDPOINT]];
    [request setPath:QUESTIONPATH];
    NSURLSessionDataTask *task = [session dataTaskWithAPIRequest:request completion:completion];
    [task resume];
    return task;
}


//+ (NSURLSessionDataTask *) requestQuestionsByID: (NSString *) qid {
//    NSURLSession *session = [NSURLSession sharedSession];
//    APIRequest *request = [[APIRequest alloc] init];
//    [request setUrl:[NSURL URLWithString:ENDPOINT]];
//    [request setPath:QUESTIONPATH];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithAPIRequest:request completion:^(id<APIResponse> response) {
//
//    }];
//
//    return dataTask;
//}

@end
