//
//  ShareActivity.m
//  Mypi
//
//  Created by Sung-Jun on 2015. 5. 17..
//  Copyright (c) 2015년 Lecture. All rights reserved.
//

#import "KakaoActivity.h"

@implementation KakaoActivity

- (NSString *)activityType {
    return NSStringFromClass([self class]);
}

- (NSString *)activityTitle {
    NSString *defaultString = [[NSBundle mainBundle] localizedStringForKey:@"Share with KakaoTalk" value:@"Share with KakaoTalk" table:@"KakaoActivity"];
    
    return [[NSBundle mainBundle] localizedStringForKey:@"Share with KakaoTalk" value:defaultString table:nil];
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"KakaoActivity" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:nil];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:[NSString class]] || ([activityItem isKindOfClass:[NSURL class]] && [[UIApplication sharedApplication] canOpenURL:activityItem])) {
            return YES;
        }
    }
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    for (id activityItem in activityItems) {
        if([activityItem isKindOfClass:[NSURL class]]) {
            self.sharedURL = activityItem;
        } else if([activityItem isKindOfClass:[NSString class]]) {
            self.sharedText = activityItem;
        }
    }
}

- (void)performActivity {
    KakaoTalkLinkObject *kakaoLink = [KakaoTalkLinkObject createWebLink: self.sharedText url:[self.sharedURL absoluteString]];
    [KOAppCall openKakaoTalkAppLink:@[kakaoLink]];
}
@end
