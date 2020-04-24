//
//  NSURLSession+APIClient.m
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/9/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "NSURLSession+APIClient.h"
#import "Strings.h"

@implementation NSURLSession (APIClient)

- (NSURLSessionDataTask *)dataTaskWithAPIRequest:(APIRequest*)request
                                        completion:(APIClientCompletionBlock)completion;
{
    NSDate *start;
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[request url]];
    [urlRequest setHTTPMethod:HTTPMethodString([request method])];
    if ([request params]) {
        [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];

        NSData *jsonBodyData = [NSJSONSerialization dataWithJSONObject:[request params] options:kNilOptions error:nil];
        [urlRequest setHTTPBody:jsonBodyData];
        start = [NSDate date];

    }
    __block NSURLSessionDataTask *dataTask;
    dataTask = [self dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
          Class responseClass = [request responseClass];
          id<APIResponse> apiResponse = [[responseClass alloc] initWithTask:dataTask response:(NSHTTPURLResponse *)response responseObject:data error:error];
        //need calculate delay
        if (start) {
            NSTimeInterval timeInterval = [start timeIntervalSinceNow];
            NSLog(@"time: %f", (0.5f + timeInterval));
            [NSThread sleepForTimeInterval:(0.5f + timeInterval)];
        }
          dispatch_async(dispatch_get_main_queue(), ^{
              if (completion) { completion(apiResponse); }
          });
    }];
    [dataTask resume];
    return dataTask;
}

@end
