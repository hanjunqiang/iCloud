//
//  ViewController.m
//  iCloud
//
//  Created by Ashish Kumar on 30/01/15.
//  Copyright (c) 2015 Ashish Kumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIDocumentPickerDelegate, UIDocumentInteractionControllerDelegate>

@property (nonatomic, strong) UIDocumentInteractionController *documentInteractionController;
@property (nonatomic, strong) NSURL *documentURL;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (UIDocumentInteractionController *)documentInteractionController {
    if (!_documentInteractionController) {
        _documentInteractionController = [[UIDocumentInteractionController alloc] init];
        _documentInteractionController.delegate = self;
    }
    
    return _documentInteractionController;
}


#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self presentUIDocumentPicker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


#pragma mark - UIDocumentInteractionControllerDelegate

- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller {
    return self;
}


@end
