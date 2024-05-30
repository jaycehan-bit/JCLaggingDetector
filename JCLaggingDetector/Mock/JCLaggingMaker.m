//
//  JCLaggingMaker.m
//  JCImage
//
//  Created by jaycehan on 2024/2/1.
//

#import "JCLaggingMaker.h"

static NSTimer *timer = nil;

@implementation JCLaggingMaker

+ (void)laggingWithDegree:(JCLeggingDegree)degree {
    NSTimeInterval interval = 0.0;
    switch (degree) {
        case JCLeggingDegreeMild:
            interval = 0.25;
            break;
        case JCLeggingDegreeModerate:
            interval = 0.125;
            break;
        case JCLeggingDegreeSerious:
            interval = 0.05;
            break;
        default:
            interval = 0.125;
            break;
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:interval repeats:YES block:^(NSTimer * _Nonnull timer) {
        for (NSUInteger index = 0; index < 1000; index ++) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
            [formatter stringFromDate:[NSDate date]];
        }
    }];
}

+ (void)stop {
    [timer invalidate];
    timer = nil;
}
@end
