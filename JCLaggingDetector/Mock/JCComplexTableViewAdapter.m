//
//  JCComplexTableViewAdapter.m
//  JCImage
//
//  Created by jaycehan on 2024/1/29.
//

#import "JCComplexTableViewCell.h"
#import "JCComplexTableViewAdapter.h"
#import "JCComplexTableViewCellModel.h"

static NSString * const JCComplexTableViewCellIdentifier = @"JCComplexTableViewCellIdentifier";
static NSString * const JCComplexString = @"✨哈🤪哈🫥哈🎃哈💤哈🌦️";

@interface JCComplexTableViewAdapter ()

@property (nonatomic, strong) NSMutableArray<JCComplexTableViewCellModel *> *dataList;

@end

@implementation JCComplexTableViewAdapter

- (instancetype)init {
    self = [super init];
    if (self) {
        [self mockCellData];
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCComplexTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JCComplexTableViewCellIdentifier];
    if (!cell) {
        cell = [[JCComplexTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:JCComplexTableViewCellIdentifier];
    }
    [cell bindViewModel:self.dataList[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.class timeConsumingMethod];
    return [JCComplexTableViewCell heightForViewModel:self.dataList[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.class timeConsumingMethod];
}

#pragma mark - Mock

- (void)mockCellData {
    for (NSUInteger index = 0; index < 50; index ++) {
        JCComplexTableViewCellModel *viewModel = [self.class generateRandomViewModel];
        [self.dataList addObject:viewModel];
    }
}

+ (JCComplexTableViewCellModel *)generateRandomViewModel {
    static NSArray *imageList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imageList = @[@"Riven.jpg",  @"Seraphine.jpg", @"Akali.jpg", @"Teemo.png", @"Katarina.jpg"];
    });
    NSString *text = @"";
    for (NSUInteger i = 0; i < (arc4random() % 10) + 2; i ++) {
        text = [text stringByAppendingString:JCComplexString];
    }
    UIImage *image = nil;
    if (arc4random() % 2) {
        image = [UIImage imageNamed:imageList[(arc4random() % imageList.count)]];
    }
    return [[JCComplexTableViewCellModel alloc] initWithTitle:text image:image];
}

- (NSMutableArray *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

+ (void)timeConsumingMethod {
    for (NSUInteger index = 0; index < 2000; index ++) {
        @autoreleasepool {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
            [formatter stringFromDate:[NSDate date]];
        }
    }
}

@end
