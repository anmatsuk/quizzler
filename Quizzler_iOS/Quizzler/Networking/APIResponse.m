//
//  APIResponse.m
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/9/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#import "APIResponse.h"

@interface SimpleAPIResponse ()

@property (nonatomic, copy) NSURLSessionDataTask *task;
@property (nonatomic, copy) NSURLResponse *response;
@property (nonatomic, copy) NSError *error;
@property (nonatomic, strong) id responseObject;
@property (nonatomic, strong) id processedResponseObject;

@end

@implementation SimpleAPIResponse

- (instancetype)initWithTask:(NSURLSessionDataTask *)task response:(NSURLResponse *)response responseObject:(id)responseObject error:(NSError *)error;
{
    self = [super init];
    if (self) {
        self.task = task;
        self.response = response;
        self.error = error;
        self.responseObject = responseObject;
        
        if (!error) {
            NSError *serializationError;
            self.processedResponseObject = [self processResponseObject:&serializationError];
            if (serializationError) {
                self.error = serializationError;
            }
        }
    }
    return self;
}

- (id)processResponseObject:(NSError *__autoreleasing *)error
{
    return  self.responseObject;
}

@end

@implementation JSONAPIResponse

- (id)processResponseObject:(NSError *__autoreleasing *)error
{
    if ([self.responseObject isKindOfClass:[NSData class]]) {
        NSError *serializationError;
        id processedResponseObject = [NSJSONSerialization JSONObjectWithData:self.responseObject options:0 error:&serializationError];
        if (error) *error = serializationError;
        return processedResponseObject;
    }
    else {
        return nil;
    }
}

- (NSInteger) statusCode {
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)[self response];
    return httpResponse.statusCode;
}
@end
