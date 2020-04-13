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

+ (NSURLSessionDataTask *) generateDeviceId:(UsersResponseBlock)completion {
    NSString *urlString = [NSString stringWithFormat:@"%@", DEVICEID_URL];
    
    APIRequest *request = [[APIRequest alloc] init];
    [request setResponseClass:[JSONAPIResponse class]];
    [request setUrl:[NSURL URLWithString:urlString]];
    [request setMethod:GET];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithAPIRequest:request completion:completion];
    [task resume];
    return task;
}


+ (NSURLSessionDataTask *)requestQuestionsByID:(NSString*) quizzId complition:(UsersResponseBlock)completion {
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", ENDPOINT, QUESTIONPATH, quizzId];
    
    APIRequest *request = [[APIRequest alloc] init];
    [request setResponseClass:[JSONAPIResponse class]];
    [request setUrl:[NSURL URLWithString:urlString]];
    [request setMethod:GET];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithAPIRequest:request completion:completion];
    [task resume];
    return task;
}

+ (NSURLSessionDataTask *) sendQuestionResponse: (NSDictionary*) params withComplition: (UsersResponseBlock) completion {
    NSString *urlString = [NSString stringWithFormat:@"%@%@", ENDPOINT, @"/answer"];
    
    APIRequest *request = [[APIRequest alloc] init];
    [request setResponseClass:[JSONAPIResponse class]];
    [request setUrl:[NSURL URLWithString:urlString]];
    [request setMethod:PUT];
    //request.params = params;
    [request setParams:params];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithAPIRequest:request completion:completion];
    [task resume];
    return task;
}

@end
