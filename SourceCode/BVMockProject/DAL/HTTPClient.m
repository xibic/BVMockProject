//
//  HTTPClient.m
//  BVMockProject
//
//  Created by xibic on 10/26/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "HTTPClient.h"

@implementation HTTPClient

#pragma mark - Server Request

//Call to server for data
- (void) getRequest:(NSString*)urlString withResponseCallback:(void (^)(NSArray *responseJsonData))callback {
    dispatch_queue_t apiQueue = dispatch_queue_create("API Queue", NULL);
    dispatch_async(apiQueue, ^{
        
        @autoreleasepool {
            //Create Full String - Along with parameters
            NSString *fullURLString = [NSString stringWithFormat:@"%@/%@",SERVER_BASE_URL,urlString];
            //Create HTTP Request
            NSURL *url = [NSURL URLWithString:fullURLString];
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
            request.HTTPMethod = @"POST";
            request.HTTPBody = [fullURLString dataUsingEncoding:NSUTF8StringEncoding];
            
            //Create URL Session
            NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
            sessionConfiguration.timeoutIntervalForResource = 30.0;
            NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
            //Run Request
            NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                if (!error) {
                    NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
                    //NSLog(@"#### %@ ####", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                    if (httpResp.statusCode == 200) {
                        NSError *jsonError;
                        NSArray *jsonData =
                        [NSJSONSerialization JSONObjectWithData:data
                                                        options:NSJSONReadingAllowFragments
                                                          error:&jsonError];
                        if (!jsonError) {
                            //NSLog(@"jsonData # %@ - Data - %@",urlString,jsonData);
                            callback(jsonData);
                        }else{
                            //NSLog(@"JsonError # Error - %@",jsonError);
                            callback(nil);
                        }
                    }
                }else{
                    //NSLog(@"RequestError # Error - %@ \n\n",error);
                    callback(nil);
                }
            }];
            
            [postDataTask resume];
        }
    });
    
    
}



- (id)postRequest:(NSString*)url body:(NSString*)body{
    return nil;
}

- (UIImage*)downloadImage:(NSString*)url{
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    return [UIImage imageWithData:data];
    
}

@end
