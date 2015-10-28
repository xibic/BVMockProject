//
//  HTTPClient.h
//  BVMockProject
//
//  Created by xibic on 10/26/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

@interface HTTPClient : NSObject

#define SERVER_BASE_URL @"http://202.84.35.90:16019/mobile"

- (void)getRequest:(NSString*)urlString withResponseCallback:(void (^)(NSArray *responseJsonData))callback;
- (id)postRequest:(NSString*)url body:(NSString*)body;
- (UIImage*)downloadImage:(NSString*)url;

@end
