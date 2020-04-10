//
//  NSURLSession+APIClient.m
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/9/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "NSURLSession+APIClient.h"

@implementation NSURLSession (APIClient)

- (NSURLSessionDataTask *)dataTaskWithAPIRequest:(APIRequest*)request
                                        completion:(APIClientCompletionBlock)completion;
{
    //NSURL *requestUrl = [NSURL urlWithString:request.path baseURL:request.url parameters:request.params];
    //NSURLRequest *httpRequest = [NSURLRequest requestWithMethod:request.method url:requestUrl headers:request.headers];
    NSMutableURLRequest *httpRequest = [[NSMutableURLRequest alloc] initWithURL:request.url];
    [httpRequest setHTTPMethod: HTTPMethodString(request.method)];
    [httpRequest setAllHTTPHeaderFields:request.headers];
    
    __block NSURLSessionDataTask *task;
    task = [self dataTaskWithRequest:httpRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        Class responseClass = [request responseClass];
        id<APIResponse> apiResponse = [[responseClass alloc] initWithTask:task response:(NSHTTPURLResponse *)response responseObject:data error:error];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) { completion(apiResponse); }
        });
    }];

    [task resume];
    return task;
}

@end
