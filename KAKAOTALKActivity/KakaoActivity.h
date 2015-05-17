//
//  ShareActivity.h
//  Mypi
//
//  Created by Sung-Jun on 2015. 5. 17..
//  Copyright (c) 2015년 Lecture. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KakaoOpenSDK/KakaoOpenSDK.h>

@interface KakaoActivity : UIActivity

@property (nonatomic) NSURL *sharedURL;
@property (nonatomic) NSString *sharedText;

@end
