//
//  APIHelper.m
//  Medirect Patient
//
//  Created by mobtecnica on 14/09/15.
//  Copyright (c) 2015 mobtecnica. All rights reserved.
//

#import "APIHelper.h"
#import "AFNetworking.h"

@implementation APIHelper
+(void)initServerCallWithURL:(NSURL *)url
               requestMethod:(TRequestMethod)method
            requestSerialize:(BOOL)isSerialize
                     headers:(NSDictionary *)headers
                   imageData:(NSData *)imageData
               imageDataName:(NSString *)dataName
                  parameters:(NSDictionary *)parameters
                     success:(TSucessBlock)onSuccess
                     failure:(TFailureBlock)onfailure
{
    
    __block NSDictionary* responseData;
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.allowInvalidCertificates = YES;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setSecurityPolicy:securityPolicy];
    
    if (isSerialize) {
        [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    }
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", nil];
    
    
    
     NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url];
    
    
    for (NSHTTPCookie *cookie in cookies){
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
    
    
    for (id key in headers) {
        [manager.requestSerializer setValue:[headers valueForKey:key] forHTTPHeaderField:key];
    }
    
    switch (method) {
            
        case TRequestMethodGET:{
            
            [manager GET:[url absoluteString]  parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
                NSLog(@"JSON: %@", responseObject);
                onSuccess(responseObject);
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                NSLog(@"Error: %@", error);
                onfailure(error);
            }];
            
            
            //            [manager GET:[url absoluteString] parameters:parameters success:^(NSURLSessionTask *operation, id responseObject) {
            //                //    (isJSONStringEnabled) ?  NSLog(@" JSON -- \n %@",[TUtilities printJson:(NSDictionary *)responseObject]) : nil;
            //                onSuccess(responseObject);
            //
            //            } failure:^(NSURLSessionTask *operation, NSError *error) {
            //
            //            }];
            
        }
            break;
        case TRequestMethodPOST:{
            
            
            [manager POST:[url absoluteString] parameters:parameters constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                onSuccess(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                onfailure( error);
            }];
            
            //
            //            [manager POST:[url absoluteString] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //
            //                //   (isJSONStringEnabled) ?   NSLog(@" JSON -- \n %@",[TUtilities printJson:(NSDictionary *)responseObject]) : nil;
            //                onSuccess(responseObject);
            //
            //            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //
            //                onfailure([operation responseObject]);
            //            }];
            
        }
            break;
        case TRequestMethodDELETE:{
            //            [manager DELETE:[url absoluteString] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //                onSuccess(responseObject);
            //            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //                onfailure([operation responseObject]);
            //            }];
            
            [manager DELETE:[url absoluteString]  parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                onSuccess(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                onfailure(error);
            }];
        }
            
            break;
        case TRequestMethodPUT:{
            //            [manager PUT:[url absoluteString] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //                responseData = (NSDictionary*)responseObject;
            //                onSuccess(responseData);
            //            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //                onfailure([operation responseObject]);
            //            }];
            
            [manager PUT:[url absoluteString] parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                onSuccess(responseData);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                onfailure(error);
            }];
            
        }
            
            break;
            
        case TRequestMethodPOSTIMAGE:{
            
            //            [manager POST:[url absoluteString] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            //                if (imageData!=nil){
            //                    [formData appendPartWithFileData:imageData
            //                                                name:@"file"
            //                                            fileName:dataName mimeType:@"image/jpeg"];
            //                }
            //            } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //                onSuccess(responseObject);
            //            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //                onfailure([operation responseObject]);
            //            }];
            
            
            [manager POST:[url absoluteString] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                
                if (imageData!=nil){
                    [formData appendPartWithFileData:imageData
                                                name:@"file"
                                            fileName:dataName mimeType:@"image/jpeg"];
                }
                
            } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                onSuccess(responseObject);
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                onfailure(error);
            }];
        }
            break;
            
        default:
            break;
    }
}

@end
