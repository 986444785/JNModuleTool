//
//  SegmentTitleView.h
//  JNModuleTools
//
//  Created by Evon2019 on 2020/5/20.
//  Copyright © 2020 JN. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, EdgeInsetsStyle) {
    horizontalStyle,  //横的
    verticalStyle, //竖直
};

/// <#Description#>
@interface SegmentTitleView : UIView

@property (nonatomic,assign) CGFloat titleHeight;

@property (nonatomic,assign) CGFloat cornerRadiu; // 是否需要圆角

@property (nonatomic,assign) CGFloat borderWidth; // 是否要边宽度

@property (nonatomic,strong) UIColor * themeColor;

@property (nonatomic,assign) CGFloat mainTitleSpace;//第一个lab的space宽

@property (nonatomic,strong) UIColor * mainTitleColor;

@property (nonatomic,strong) UIColor * subTitleColor;

@property (nonatomic,strong) UIFont * mainTitleFont;

@property (nonatomic,strong) UIFont * subTitleFont;


/// <#Description#>
/// @param titles 数组里默认第一个为main  , 剩余的为sub
/// @param style 横的以每个title的长度为width，  竖直的取title最长的为 width
-(void)segmengWithTitles:(NSArray *)titles style:(EdgeInsetsStyle)style;


 
/// 设置frame  最后设置
/// @param x_x <#x_x description#>
/// @param y_y <#y_y description#>
/// @param view  父view
-(void)setFrameWithX:(CGFloat)x_x  y_y:(CGFloat)y_y SupperView:(id)view;

@end

NS_ASSUME_NONNULL_END
