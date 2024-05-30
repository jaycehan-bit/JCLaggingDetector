//
//  JCLaggingMaker.h
//  JCImage
//
//  Created by jaycehan on 2024/2/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JCLeggingDegree) {
    JCLeggingDegreeMild,
    JCLeggingDegreeModerate,
    JCLeggingDegreeSerious,
};

@interface JCLaggingMaker : NSObject

+ (void)laggingWithDegree:(JCLeggingDegree)degree;

+ (void)stop;

@end

NS_ASSUME_NONNULL_END
