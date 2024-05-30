//
//  JCLaggingDetectorX.h
//  JCImage
//
//  Created by jaycehan on 2024/1/31.
//

#import <Foundation/Foundation.h>
#import "JCLaggingModule.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCLaggingDetectorX : NSObject <JCLaggingModule>

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
