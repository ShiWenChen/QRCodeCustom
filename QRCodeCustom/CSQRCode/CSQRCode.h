//
//  CSQRCode.h
//  QRCodeCustom
//
//  Created by admin on 2017/2/10.
//  Copyright © 2017年 Rcfans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CSQRCode : NSObject
/// 使用 名片字符串 / 头像 异步生成二维码图像，并且指定头像占二维码图像的比例
///
/// @param cardName     名片字符串
/// @param avatar     头像图像
/// @param scale      头像占二维码图像的比例
/// @param completion 完成回调
//+ (void)cardImageWithCardName:(NSString *)cardName avatar:(UIImage *)avatar scale:(CGFloat)scale completion:(void (^)(UIImage *image))completion;

/**
 使用内容、logo、生成二维码，可以自定义logo占二维码的比例

 @param cardContent 二维码内容
 @param logoImage 二维码logo
 @param scale 二维码所占比例
 @param commpletion 生成完成回调
 */
+ (void)cs_cardImageWithCardContent:(NSString *)cardContent adLogo:(UIImage *)logoImage scale:(CGFloat)scale completion:(void (^)(UIImage *image))commpletion;
@end
