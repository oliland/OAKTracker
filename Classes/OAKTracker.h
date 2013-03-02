//
//  OAKTracker.h
//
//  Created by Oli Kingshott on 14/08/2012.
//  Copyright (c) 2012 Oli Kingshott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OAKTracker : UIView

@property (nonatomic, strong, readonly) UISlider *slider;
@property (nonatomic, strong, readonly) UILabel *positionLabel;
@property (nonatomic, strong, readonly) UILabel *durationLabel;
@property (nonatomic) NSTimeInterval position;
@property (nonatomic) NSTimeInterval duration;

@end
