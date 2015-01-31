//
//  ViewController.m
//  iCloud
//
//  Created by Ashish Kumar on 30/01/15.
//  Copyright (c) 2015 Ashish Kumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIDocumentPickerDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end


@implementation ViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self presentUIDocumentPicker];
}


#pragma mark - Private

- (void)presentUIDocumentPicker {
    UIDocumentPickerViewController *documentPickerViewController = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:@[@"com.adobe.pdf"]
                                                                                                                          inMode:UIDocumentPickerModeOpen];
    documentPickerViewController.delegate = self;
    [self presentViewController:documentPickerViewController animated:YES completion:nil];
}


#pragma mark - UIDocumentPickerDelegate

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url {
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}


@end
