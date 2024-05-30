//
//  ViewController.m
//  JCLaggingDetector
//
//  Created by jaycehan on 2024/5/30.
//

#import "ViewController.h"
#import "JCLaggingMaker.h"

static const CGFloat gButtonWidth = 150;
static const CGFloat gButtonHeight = 65;

@interface ViewController ()

@property (nonatomic, strong) UIButton *mockButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mockButton];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGSize viewSize = self.view.bounds.size;
    self.mockButton.frame = CGRectMake((viewSize.width - gButtonWidth) / 2.0, 200, gButtonWidth, gButtonHeight);
    self.mockButton.layer.cornerRadius = 12;
}

- (void)mockButtonDidClick {
    self.mockButton.selected = !self.mockButton.isSelected;
    if (self.mockButton.state & UIControlStateSelected) {
        [JCLaggingMaker laggingWithDegree:JCLeggingDegreeSerious];
    } else {
        [JCLaggingMaker stop];
    }
}

- (UIButton *)mockButton {
    if (!_mockButton) {
        _mockButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _mockButton.backgroundColor = UIColor.orangeColor;
        [_mockButton setTitle:@"卡顿" forState:UIControlStateNormal];
        [_mockButton setTitle:@"停止" forState:UIControlStateSelected];
        [_mockButton addTarget:self action:@selector(mockButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mockButton;
}

@end
