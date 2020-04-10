//
//  APIRequest.h
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/9/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPMethod.h"
#import "APIResponse.h"

@interface APIRequest : NSObject

@property (nonatomic) HTTPMethod method;
@property (nonatomic, copy) NSURL *url;
@property (nonatomic, copy) NSDictionary *params;
@property (nonatomic, copy) NSDictionary *headers;
@property (nonatomic, copy) NSString *path;
@property (nonatomic) Class<APIResponse> responseClass;

- (id)init;
@end


