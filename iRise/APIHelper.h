//
//  APIHelper.h
//  Medirect Patient
//
//  Created by mobtecnica on 14/09/15.
//  Copyright (c) 2015 mobtecnica. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define APIURL @"http://52.77.252.180/irise/web/index.php?r=api/"
//#define APIURL @"http://jotun.hostonserver.net/web/index.php?r=api/"
//#define APIURL @"http://qa.mobtecnica.com/irise/web/index.php?r=api/"
//#define APIURL @"http://idesign.hostonserver.net/web/index.php?r=api/"

///
#define APIURL @"http://idesign.hostonserver.net/web/index.php?r=api/"
////

#import "AFHTTPSessionManager.h"

typedef enum {
    TRequestMethodGET,
    TRequestMethodPOST,
    TRequestMethodPUT,
    TRequestMethodDELETE,
    TRequestMethodPOSTIMAGE,
} TRequestMethod;



@interface APIHelper : AFHTTPSessionManager

typedef void(^TSucessBlock)(id object);
typedef void(^TFailureBlock)(id object);
typedef void(^TSucessBlockUploadImage)(NSDictionary* succes);
typedef void(^TFailureBlockUploadImage)(NSString *failureMessage);

+(void)initServerCallWithURL:(NSURL *)url
               requestMethod:(TRequestMethod)method
            requestSerialize:(BOOL)isSerialize
                     headers:(NSDictionary *)headers
                   imageData:(NSData *)imageData
               imageDataName:(NSString *)dataName
                  parameters:(NSDictionary *)parameters
                     success:(TSucessBlock)onSuccess
                     failure:(TFailureBlock)onfailure;

@end
