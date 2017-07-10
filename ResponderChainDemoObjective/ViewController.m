//
//  ViewController.m
//  ResponderChainDemoObjective
//
//  Created by Matthias Ludwig on 10.07.17.
//  Copyright © 2017 Matthias Ludwig. All rights reserved.
//

#import "ViewController.h"
#import "MyProtocol.h"
#import "MyView.h"

@interface ViewController ()<MyProtocol>

@end

@implementation ViewController

#pragma mark - View Lifecycle
- (void)loadView {
    self.view = [[MyView alloc] initWithFrame:CGRectZero];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - MyProtocol
- (void)firstButtonTouchUpInside:(UIButton *)inSender {
    [self showAlertWithMessage:[NSString stringWithFormat:@"%@", NSStringFromSelector(_cmd)]];
}

- (void)secondButtonTouchUpInside:(UIButton *)inSender {
    [self showAlertWithMessage:[NSString stringWithFormat:@"%@", NSStringFromSelector(_cmd)]];
}

#pragma mark - Helper
- (void)showAlertWithMessage:(NSString *)inMessage {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showAlertWithMessage:inMessage];
        });
        return;
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:[NSString stringWithFormat:@"Method: %@", inMessage] preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
