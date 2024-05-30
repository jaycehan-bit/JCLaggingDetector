//
//  JCLaggingViewController.m
//  JCImage
//
//  Created by jaycehan on 2024/1/26.
//

#import "JCComplexTableViewCell.h"
#import "JCComplexTableViewAdapter.h"
#import "JCLaggingViewController.h"

@interface JCLaggingViewController ()

@property (nonatomic, strong) JCComplexTableViewAdapter *dataSource;

@end

@implementation JCLaggingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
}

#pragma mark - DataSource

- (JCComplexTableViewAdapter *)dataSource {
    if (!_dataSource) {
        _dataSource = [[JCComplexTableViewAdapter alloc] init];
    }
    return _dataSource;
}

@end
