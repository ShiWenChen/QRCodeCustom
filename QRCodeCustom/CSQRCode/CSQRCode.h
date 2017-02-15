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

/**
 使用内容、logo、生成二维码，可以自定义logo占二维码的比例

 @param cardContent 二维码内容
 @param logoImage 二维码logo
 @param scale 二维码所占比例
 @param commpletion 生成完成回调
 */
+ (void)cs_cardImageWithCardContent:(NSString *)cardContent adLogo:(UIImage *)logoImage scale:(CGFloat)scale completion:(void (^)(UIImage *image))commpletion;
@end
