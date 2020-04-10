//
//  HTTPMethod.m
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/9/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//


#import "HTTPMethod.h"

NSString *HTTPMethodString(HTTPMethod method) {
    switch (method) {
        case GET:       return @"GET";
        case POST:      return @"POST";
        case PUT:       return @"PUT";
        case DELETE:    return @"DELETE";
        case HEAD:      return @"HEAD";
        default:        return nil;
    }
}
