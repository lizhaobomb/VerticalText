//
//  VerticalTextContainer.m
//  Demo
//
//  Created by lizhao on 16/8/22.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "VerticalTextContainer.h"

@implementation VerticalTextContainer

- (CGRect)lineFragmentRectForProposedRect:(CGRect)proposedRect atIndex:(NSUInteger)characterIndex writingDirection:(NSWritingDirection)baseWritingDirection remainingRect:(CGRect *)remainingRect {
    *remainingRect = CGRectZero;
    return CGRectMake(0, proposedRect.origin.y, self.size.height, proposedRect.size.height);
}

@end
