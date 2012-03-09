  //
//  LRMimicTests.m
//  LRMimicTests
//
//  Created by Luke Redpath on 08/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "SpecHelper.h"
#import "LRMimic.h"

SpecBegin(MimicSpecs)

describe(@"LRMimic", ^{
  __block LRMimic *mimic;
  __block NSURL *serverURL;

  beforeAll(^{
    serverURL = [NSURL URLWithString:@"http://localhost:11988"];
    mimic = [LRMimic mimicOnHost:@"localhost" port:11988];
  });
  
  beforeEach(^{
    [mimic reset];
  });
  
  it(@"stubs GET requests to return a fixed response", ^{
    [mimic respondTo:^(LRMimicStub *stub) {
      [stub get:@"/example" itReturns:^(LRMimicStubResponse *response) {
        [response setStatus:200];
        [response setBody:@"This is my response"];
        [response setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
      }];
    }];
    
    performRequest(serverURL, @"GET", @"/example", ^(NSHTTPURLResponse *response, NSString *responseBody) {
      expect(response.statusCode).toEqual(200);
      expect(responseBody).toEqual(@"This is my response");
      expect([[response allHeaderFields] objectForKey:@"Content-Type"]).toEqual(@"text/plain");
    });
	});
  
  it(@"stubs POST requests to return a fixed response", ^{
    [mimic respondTo:^(LRMimicStub *stub) {
      [stub post:@"/example" itReturns:^(LRMimicStubResponse *response) {
        [response setStatus:201];
        [response setBody:@"This is my response"];
        [response setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
      }];
    }];
    
    performRequest(serverURL, @"POST", @"/example", ^(NSHTTPURLResponse *response, NSString *responseBody) {
      expect(response.statusCode).toEqual(201);
      expect(responseBody).toEqual(@"This is my response");
      expect([[response allHeaderFields] objectForKey:@"Content-Type"]).toEqual(@"text/plain");
    });
	});
  
  it(@"stubs PUT requests to return a fixed response", ^{
    [mimic respondTo:^(LRMimicStub *stub) {
      [stub put:@"/example" itReturns:^(LRMimicStubResponse *response) {
        [response setStatus:200];
        [response setBody:@"This is my response"];
        [response setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
      }];
    }];
    
    performRequest(serverURL, @"PUT", @"/example", ^(NSHTTPURLResponse *response, NSString *responseBody) {
      expect(response.statusCode).toEqual(200);
      expect(responseBody).toEqual(@"This is my response");
      expect([[response allHeaderFields] objectForKey:@"Content-Type"]).toEqual(@"text/plain");
    });
	});
  
  it(@"stubs DELETE requests to return a fixed response", ^{
    [mimic respondTo:^(LRMimicStub *stub) {
      [stub delete:@"/example" itReturns:^(LRMimicStubResponse *response) {
        [response setStatus:200];
        [response setBody:@"This is my response"];
        [response setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
      }];
    }];
    
    performRequest(serverURL, @"DELETE", @"/example", ^(NSHTTPURLResponse *response, NSString *responseBody) {
      expect(response.statusCode).toEqual(200);
      expect(responseBody).toEqual(@"This is my response");
      expect([[response allHeaderFields] objectForKey:@"Content-Type"]).toEqual(@"text/plain");
    });

	});

});

SpecEnd