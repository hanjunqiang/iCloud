//
//  ViewController.m
//  iCloud
//
//  Created by Ashish Kumar on 30/01/15.
//  Copyright (c) 2015 Ashish Kumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIDocumentPickerDelegate, UIDocumentInteractionControllerDelegate, QLPreviewControllerDelegate, QLPreviewControllerDataSource>

@property (nonatomic, strong) NSURL *documentURL;
@property (nonatomic, strong) NSArray *documentTypes;

@end


@implementation ViewController

- (NSArray *)documentTypes {
    if (!_documentTypes) {
        _documentTypes = @[@"kUTTypeText", @"kUTTypeSourceCode", @"kUTTypeImage", @"kUTTypeAudioVisual​Content", @"kUTTypePDF"];
    }
    
    return _documentTypes;
}


#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.documentURL) {
        [self presentDocumentPicker];
    }
}


#pragma mark - Actions

- (IBAction)documentPickerPressed:(UIBarButtonItem *)sender {
    [self presentDocumentPicker];
}


#pragma mark - Private

- (void)presentDocumentPicker {
    UIDocumentPickerViewController *documentPickerViewController = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:self.documentTypes
                                                                                                                          inMode:UIDocumentPickerModeOpen];
    documentPickerViewController.delegate = self;
    [self presentViewController:documentPickerViewController animated:YES completion:nil];
}


#pragma mark - UIDocumentPickerDelegate

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url {
    self.documentURL = url;
    
    QLPreviewController *previewController = [[QLPreviewController alloc] init];
    previewController.delegate = self;
    previewController.dataSource = self;
    
    [self.navigationController pushViewController:previewController animated:YES];
}


#pragma mark - UIDocumentInteractionControllerDelegate

- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller {
    return self;
}


#pragma mark - QLPreviewControllerDataSource

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    return self.documentURL;
}

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return 1;
}


@end
