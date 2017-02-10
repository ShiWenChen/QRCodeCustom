//
//  CSQRCode.m
//  QRCodeCustom
//
//  Created by admin on 2017/2/10.
//  Copyright © 2017年 Rcfans. All rights reserved.
//

#import "CSQRCode.h"
#import <CoreImage/CoreImage.h>

@implementation CSQRCode

+(void)cs_cardImageWithCardContent:(NSString *)cardContent adLogo:(UIImage *)logoImage scale:(CGFloat)scale completion:(void (^)(UIImage *))commpletion{
    if (!commpletion) {
        return;
    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        ///创造过滤器
        CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
        ///设为默认
        [filter setDefaults];
        [filter setValue:[cardContent dataUsingEncoding:NSUTF8StringEncoding] forKey:@"inputMessage"];
        CIImage *outputImage = [filter outputImage];
        ///将CIImage转为CGimage
        CGAffineTransform transform = CGAffineTransformMakeScale(10, 10);
        CIImage *transformedImage = [outputImage imageByApplyingTransform:transform];
        
        CIContext *context = [CIContext contextWithOptions:nil];
        CGImageRef cgImage = [context createCGImage:transformedImage fromRect:transformedImage.extent];
        
        UIImage *qrImage = [UIImage imageWithCGImage:cgImage scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
        CGImageRelease(cgImage);
        
        if (logoImage != nil) {
            qrImage = [self qrcodeImage:qrImage addAvatar:logoImage scale:scale];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            commpletion(qrImage);
        
        });
        
    });
    
}


/**
 把logoimage绘画到qrImage上

 @param qrImage 二维码图片
 @param logoImage 标志
 @param scale 标志所占二维码图片的比例
 @return 返回合成后的图片
 */
+ (UIImage *)qrcodeImage:(UIImage *)qrImage addAvatar:(UIImage *)logoImage scale:(CGFloat)scale {
    
    CGFloat screenScale = [UIScreen mainScreen].scale;
    CGRect rect = CGRectMake(0, 0, qrImage.size.width * screenScale, qrImage.size.height * screenScale);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, screenScale);
    
    [qrImage drawInRect:rect];
    
    CGSize avatarSize = CGSizeMake(rect.size.width * scale, rect.size.height * scale);
    CGFloat x = (rect.size.width - avatarSize.width) * 0.5;
    CGFloat y = (rect.size.height - avatarSize.height) * 0.5;
    [logoImage drawInRect:CGRectMake(x, y, avatarSize.width, avatarSize.height)];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return [UIImage imageWithCGImage:result.CGImage scale:screenScale orientation:UIImageOrientationUp];
}
@end
