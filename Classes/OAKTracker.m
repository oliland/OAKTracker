//
//  OAKTracker.m
//
//  Created by Oli Kingshott on 14/08/2012.
//  Copyright (c) 2012 Oli Kingshott. All rights reserved.
//

#import "OAKTracker.h"

static CGFloat kLabelWidth = 44;

@implementation OAKTracker

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    _slider = [[UISlider alloc] initWithFrame:CGRectZero];
    _slider.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    [_slider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    _positionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _positionLabel.backgroundColor = [UIColor clearColor];
    _positionLabel.textAlignment = UITextAlignmentCenter;
    _positionLabel.textColor = [UIColor whiteColor];
    _positionLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    _positionLabel.text = [self formattedTimeFromSeconds:0];
    
    _durationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _durationLabel.backgroundColor = [UIColor clearColor];
    _durationLabel.textAlignment = UITextAlignmentCenter;
    _durationLabel.textColor = [UIColor whiteColor];
    _durationLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    _durationLabel.text = [self formattedTimeFromSeconds:0];
    
    _durationLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    
    [self addSubview:_slider];
    [self addSubview:_positionLabel];
    [self addSubview:_durationLabel];
}

- (void)layoutSubviews
{
    self.slider.frame = CGRectMake(kLabelWidth, 0, self.bounds.size.width - (2 * kLabelWidth), self.bounds.size.height);
    self.positionLabel.frame = CGRectMake(0, 0, kLabelWidth, self.bounds.size.height);
    self.durationLabel.frame = CGRectMake(self.bounds.size.width - kLabelWidth, 0, kLabelWidth, self.bounds.size.height);
}

- (void)setPosition:(NSTimeInterval)position
{
    _position = position;
    [self.slider setValue:position animated:YES]; // This does not fire UIControlEventValueDidChange
    self.positionLabel.text = [self formattedTimeFromSeconds:position];
}

- (void)setDuration:(NSTimeInterval)duration
{
    _duration = duration;
    self.slider.maximumValue = duration;
    self.durationLabel.text = [self formattedTimeFromSeconds:duration];
}

- (void)sliderValueDidChange:(UISlider *)sender
{
    self.positionLabel.text = [self formattedTimeFromSeconds:sender.value];
}

- (NSString *)formattedTimeFromSeconds:(NSTimeInterval)seconds
{
    int roundedSeconds = (int)floor(seconds);
    int totalSeconds = roundedSeconds % 60;
    int totalMinutes = (roundedSeconds / 60) % 60;
    int totalHours = roundedSeconds / 3600;
    
    if (totalHours > 0) {
        return [NSString stringWithFormat:@"%d:%02d:%02d", totalHours, totalMinutes, totalSeconds];
    } else {
        return [NSString stringWithFormat:@"%d:%02d", totalMinutes, totalSeconds];
    }
}

@end
