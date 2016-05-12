//
//  ViewController.m
//  webserviceCall
//
//  Created by macbook on 06/02/14.
//  Copyright (c) 2014 macbook. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableData *_responseData;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
//    NSURL *url = [NSURL URLWithString:@"http://www.pgbovine.net/photos/json-files/boston.json"];
//    
//    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url];
////    NSURLResponse * response = nil;
////    NSError * error = nil;
//    
//    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, 230, 50, 50)];
//    [activity setBackgroundColor:[UIColor grayColor]];
//    [activity startAnimating];
//    [self.view addSubview:activity];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//    
//        NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//        
//            NSLog(@"Data %@",data);
//            [activity stopAnimating];
//            [activity setHidden:YES];
//        
//        });
//    
//    });
    

    // Send a synchronous request
//    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.11.56:8080/brandtracker/rest/authenticate/app/a/s"]];
//    NSURLResponse * response = nil;
//    NSError * error = nil;
//    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
//                                          returningResponse:&response
//                                                      error:&error];
//    
//    if (error == nil)
//    {
//        // Parse data here
//    }
//    NSLog(@"Response %@",data);
//    
//    NSString *htmlSTR = [[NSString alloc] initWithData:data
//                                              encoding:NSUTF8StringEncoding];
//    NSLog(@"%@" , htmlSTR);
    
    
    
    // Create the request.
    NSURL *url = [NSURL URLWithString:@"http://192.168.11.56:8080/brandtracker/rest/authenticate"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    //initialize a post data
    NSString *postData = @"userName=example&password=example";
    //set request content type we MUST set this value.
    
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //set post data of request
    [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    //initialize a connection from request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    //start the connection
    [connection start];
    
    
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
    NSLog(@"Data %@",_responseData);
    NSString *htmlSTR = [[NSString alloc] initWithData:_responseData  encoding:NSUTF8StringEncoding];
    
    NSLog(@"htstr %@",htmlSTR);
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
