//
//  VerticalTextView.m
//  Demo
//
//  Created by lizhao on 16/8/22.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "VerticalTextView.h"

@interface VerticalTextView ()


@end

@implementation VerticalTextView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layoutManager enumerateLineFragmentsForGlyphRange:NSMakeRange(0, self.layoutManager.numberOfGlyphs) usingBlock:^(CGRect lineRect, CGRect usedRect, NSTextContainer * _Nonnull textContainer, NSRange glyphRange, BOOL * _Nonnull stop) {
        CGContextSaveGState(context);
        
        //垂直布局text，从左上到右下
        CGContextScaleCTM(context, -1, 1);
        CGContextRotateCTM(context, M_PI_2);
        
        //翻转行 的x axis
        CGContextTranslateCTM(context, 0, lineRect.origin.y);
        CGContextScaleCTM(context, 1, -1);
        CGContextTranslateCTM(context, 0, -(lineRect.origin.y + lineRect.size.height));
                              
        //draw the line fragment
        [self.layoutManager drawGlyphsForGlyphRange:glyphRange atPoint:CGPointMake(0, 0)];
        
        CGContextRestoreGState(context);
    }];
}

- (NSLayoutManager *)layoutManager {
    if (!_layoutManager) {
        _layoutManager = [[NSLayoutManager alloc] init];
    }
    return _layoutManager;
}

@end
