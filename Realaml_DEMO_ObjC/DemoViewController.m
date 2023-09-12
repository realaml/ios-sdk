//
//  ViewController.m
//  Realaml_DEMO_ObjC
//
//  Copyright © 2023 Realaml. All rights reserved.
//

#import "DemoViewController.h"
#import <Realaml/Realaml.h>

@interface DemoViewController ()<KYCViewControllerDelegate>

@property (nonatomic, strong) NSString *signKey;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"KYC SDK Demo Objective-C";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle: @"Start KYC" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(startAct:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;

    self.signKey = @"YOUR_SIGNATURE_KEY";
}

- (IBAction)startAct:(id)sender {

    KYCViewController *kycViewController = [[KYCViewController alloc] initWithEnvironment:RealamlEnvironmentStaging signatureKey:self.signKey];
    kycViewController.delegate = self;
    [self presentViewController:kycViewController animated:YES completion:nil];
}

-(void)kycViewController:(KYCViewController *)controller didFinishWith:(nullable NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:^{
        if (error != nil) {
            UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Error!" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            [controller addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:controller animated:YES completion:nil];
        } else {
            UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Success!" message:@"KYC Completed successfully" preferredStyle:UIAlertControllerStyleAlert];
            [controller addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }];
}

-(void)kycViewControllerDidCancelled:(KYCViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
