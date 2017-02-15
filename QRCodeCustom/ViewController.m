//
//  ViewController.m
//  QRCodeCustom
//
//  Created by admin on 2017/2/10.
//  Copyright © 2017年 Rcfans. All rights reserved.
//

#import "ViewController.h"
#import "CSQRCode.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tfView;
@property (weak, nonatomic) IBOutlet UIImageView *qrImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tfView becomeFirstResponder];
    
}
- (IBAction)createQRCode:(id)sender {
    [self.tfView resignFirstResponder];
    
    /**
     生成二维码
     @ adLogo Logo
     @param image 返回的二维码图片
     */
    [CSQRCode cs_cardImageWithCardContent:self.tfView.text adLogo:[UIImage imageNamed:@"logeDemo"] scale:0.2 completion:^(UIImage *image) {
        self.qrImageView.image = image;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
