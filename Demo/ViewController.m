//
//  ViewController.m
//  Demo
//
//  Created by lizhao on 16/8/22.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "ViewController.h"

#import "VerticalTextView.h"
#import "VerticalTextContainer.h"


@interface ViewController ()

@property (nonatomic, strong) UITextView *tv;
@property (nonatomic, strong) VerticalTextView *verticalTV;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (IBAction)demo:(id)sender {
    NSLog(@"demo");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadSubViews];
    VerticalTextContainer *container = [[VerticalTextContainer alloc] initWithSize:self.verticalTV.bounds.size];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [layoutManager addTextContainer:container];
    layoutManager.textStorage = _tv.textStorage;
    _verticalTV.layoutManager = layoutManager;
    NSInteger length = [layoutManager numberOfGlyphs];
    CGRect rect = [layoutManager boundingRectForGlyphRange:NSMakeRange(0, length-1) inTextContainer:container];
    CGRect origin = self.verticalTV.frame;
    self.verticalTV.frame = CGRectMake(origin.origin.x, origin.origin.y, rect.size.height, origin.size.height);
    self.scrollView.contentSize = CGSizeMake(rect.size.height, self.scrollView.bounds.size.height);

}

- (void)loadSubViews {
    [self.view addSubview:self.tv];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.verticalTV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITextView *)tv {
    if (!_tv) {
        _tv = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/2)];
        _tv.text = @"A Demonstration of the Cocoa Text System\
        This is a demonstration of some of the capabilities of the Cocoa text system, including character and paragraph styles.  It is fully Unicode-based, so it readily supports text in any number of writing systems.  A single text storage can be connected to multiple layout managers, each of which can be in turn supplied with any number of text container/text view pairs, representing visible regions of text such as pages or columns.  A standard text container is rectangular, but a custom text container may have any shape.\
        นาคีมีพิษม์เพี้ยง	  สุริโย   เลี้อยบ่อฬาเคโช   แช่มข้า\
        This is a demonstration of some of the capabilities of the Cocoa text system, including character and paragraph styles.  It is fully Unicode-based, so it readily supports text in any number of writing systems.  A single text storage can be connected to multiple layout managers, each of which can be in turn supplied with any number of text container/text view pairs, representing visible regions of text such as pages or columns.  A standard text container is rectangular, but a custom text container may have any shape.  This is a demonstration of some of the capabilities of the Cocoa text system, including character and paragraph styles.  It is fully Unicode-based, so it readily supports text in any number of writing systems.  A single text storage can be connected to multiple layout managers, each of which can be in turn supplied with any number of text container/text view pairs, representing visible regions of text such as pages or columns.  A standard text container is rectangular, but a custom text container may have any shape.This is a demonstration of some of the capabilities of the Cocoa text system, including character and paragraph styles.  It is fully Unicode-based, so it readily supports text in any number of writing systems.  A single text storage can be connected to multiple layout managers, each of which can be in turn supplied with any number of text container/text view pairs, representing visible regions of text such as pages or columns.  A standard text container is rectangular, but a custom text container may have any shape.  This is a demonstration of some of the capabilities of the Cocoa text system, including character and paragraph styles.  It is fully Unicode-based, so it readily supports text ";
    }
    return _tv;
}

- (VerticalTextView *)verticalTV {
    if (!_verticalTV) {
        _verticalTV = [[VerticalTextView alloc] initWithFrame:CGRectMake(0, 0, self.tv.bounds.size.width, self.tv.bounds.size.height)];
        _verticalTV.backgroundColor = [UIColor redColor];
        
    }
    return _verticalTV;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.tv.frame.size.height, self.tv.bounds.size.width, self.tv.bounds.size.height)];
        _scrollView.backgroundColor = [UIColor blueColor];
    }
    return _scrollView;
}


@end
