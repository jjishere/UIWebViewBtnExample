//
//  ViewController.m
//  UIWebViewBtnExample
//
//  Created by JJ on 10/5/14.
//  Copyright (c) 2014 appsharenow. All rights reserved.
//  Site: www.appsharenow.com
//

#import "ViewController.h"

NSString *baseUrl;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    baseUrl = @"http://www.appsharenow.com";
    
    /*
     * Start loading the website
     */
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:baseUrl];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    myWebView.delegate = self;
    
    //Load the request in the UIWebView.
    [myWebView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"Start loading the url");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"finish loading the url");
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *clickedUrl = request.URL.absoluteString;
    
    NSLog(@"clicked url: %@", clickedUrl);
  
    /*
     * Click on the menu button on the top left corner
     * A drop down menu will display, contains "Home" and "Contact"
     */
    
    if([clickedUrl containsString:@"/contact"])
    {
        
        /*
         * Returning No will force the user to stay on the same page
         * Returning Yes will navigate the user to the new page
         */
        return NO;
    }
    
    return YES;
}

@end
