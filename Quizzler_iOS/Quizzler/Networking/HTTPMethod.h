//
//  HTTPMethod.h
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/9/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#ifndef HTTPMETHOD_H
#define HTTPMETHOD_H

#import <Foundation/Foundation.h>

typedef NS_ENUM(int, HTTPMethod) {
    GET,
    POST,
    PUT,
    DELETE,
    HEAD
};

extern NSString *HTTPMethodString(HTTPMethod method);
#endif
