//
//  NSURLSession+APIClient.h
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/9/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIResponse.h"
#import "APIRequest.h"

typedef void(^APIClientCompletionBlock)(id<APIResponse> response);

@protocol APIClient <NSObject>

- (NSURLSessionDataTask *)dataTaskWithAPIRequest:(APIRequest*)request
                                        completion:(APIClientCompletionBlock)completion;

@end

@interface NSURLSession (APIClient)<APIClient>

@end

