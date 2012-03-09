//
//  LRMimic.h
//  LRMimic
//
//  Created by Luke Redpath on 08/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LRMimicStub;

typedef void (^LRMimicRespondToBlock)(LRMimicStub *);

@interface LRMimic : NSObject

+ (id)mimicOnHost:(NSString *)host port:(NSUInteger)port;
- (id)initWithServerURL:(NSURL *)serverURL;
- (void)respondTo:(LRMimicRespondToBlock)respondToBlock;
- (void)reset;

@end

@class LRMimicStubResponse;

typedef void (^LRMimicStubResponseBlock)(LRMimicStubResponse *);

@interface LRMimicStub : NSObject

- (void)get:(NSString *)path itReturns:(LRMimicStubResponseBlock)responseBlock;
- (void)post:(NSString *)path itReturns:(LRMimicStubResponseBlock)responseBlock;
- (void)put:(NSString *)path itReturns:(LRMimicStubResponseBlock)responseBlock;
- (void)delete:(NSString *)path itReturns:(LRMimicStubResponseBlock)responseBlock;

- (NSArray *)arrayValue;

@end

@interface LRMimicStubResponse : NSObject

- (id)initWithMethod:(NSString *)HTTPMethod path:(NSString *)path;
- (void)setStatus:(NSUInteger)status;
- (void)setBody:(NSString *)body;
- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;
- (NSDictionary *)dictionaryValue;

@end
