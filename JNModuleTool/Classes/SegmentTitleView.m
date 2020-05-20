//
//  SegmentTitleView.m
//  JNModuleTools
//
//  Created by Evon2019 on 2020/5/20.
//  Copyright © 2020 JN. All rights reserved.
//

#import "SegmentTitleView.h"

@implementation SegmentTitleView

/// <#Description#>
/// @param titles 数组里默认第一个为main  , 剩余的为sub
/// @param style 横的以每个title的长度为width，  竖直的取title最长的为 width
-(void)segmengWithTitles:(NSArray *)titles style:(EdgeInsetsStyle)style{
    
    if (titles == nil || titles.count == 0) {
        return;
    }
    NSMutableArray * widths = [self titleWidthTitles:titles];
    
    CGFloat width = 0;
    if (style == verticalStyle) {
        width = [[widths valueForKeyPath:@"@max.floatValue"] floatValue];
    }
    UILabel * lastLab = nil;
    for (int i=0; i<titles.count; i++) {
        
        if (style == horizontalStyle) {
            width = [widths[i] floatValue];
        }
        
        UILabel * lab = [UILabel new];
        lab.text = titles[i];
        if (i == 0) {
            lab.font = self.mainTitleFont;
            lab.textColor = self.mainTitleColor;
            lab.backgroundColor = self.themeColor;
            lab.frame = CGRectMake(0, 0, width, self.titleHeight);
            
        }else{
            
            lab.font = self.subTitleFont;
            NSLog(@"");
            lab.textColor = self.subTitleColor;

          
            
            if (style == horizontalStyle) {
                lab.frame = CGRectMake(lastLab.frame.origin.x + lastLab.frame.size.width, 0, width, self.titleHeight);
            }else{
                lab.frame = CGRectMake(0, lastLab.frame.origin.y + lastLab.frame.size.height, width, self.titleHeight);
            }
        }
        
        lab.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:lab];
        
        lastLab = lab;
    }
    
    
    //计算总的frame
    CGRect rect  =  CGRectMake(0, 0, 0, 0); //nil; //CGRectMake(0, 0, width, self.titleHeight);
    if (style == horizontalStyle) {
        rect = CGRectMake(0, 0, lastLab.frame.origin.x + lastLab.frame.size.width  + 2, self.titleHeight);
    }else{
        rect = CGRectMake(0, 0, width, self.titleHeight * titles.count );
    }
    self.frame = rect;
    
    if (self.cornerRadiu > 0) {
        self.cornerRadiu = self.cornerRadiu > self.titleHeight/2.00 ? self.titleHeight/2.00 : self.cornerRadiu;
        self.layer.cornerRadius = self.cornerRadiu;
        self.layer.masksToBounds = YES;
        
    }
    if (self.borderWidth > 0) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = self.themeColor.CGColor;
    }
    
    
}

-(void)setFrameWithX:(CGFloat)x_x y_y:(CGFloat)y_y SupperView:(id)view{
    self.frame = CGRectMake(x_x, y_y, self.frame.size.width, self.frame.size.height);
    
    [view addSubview:self];
}


-(NSMutableArray *)titleWidthTitles:(NSArray *)titles{
    
    NSMutableArray * widths = [NSMutableArray array];
    
    for (int i = 0 ; i< titles.count; i++) {
        NSString * text = titles[i];
        if ( i != 0) {
            CGSize size = [text sizeWithAttributes:@{NSFontAttributeName : self.subTitleFont}];
            [widths addObject: [NSNumber numberWithFloat:size.width + 10] ];
        }else{
            
            self.mainTitleSpace = self.mainTitleSpace > 0 ? self.mainTitleSpace : 10;
            
            CGSize size = [text sizeWithAttributes:@{NSFontAttributeName : self.mainTitleFont}];
            [widths addObject: [NSNumber numberWithFloat:size.width + self.mainTitleSpace] ];
        }
    }
    return widths;
}
 

-(CGFloat)titleHeight{
    if (_titleHeight <= 0) {
        _titleHeight = 22;
    }
    return _titleHeight;
}

-(UIColor *)themeColor{
    if (!_themeColor) {
        _themeColor = UIColor.redColor;
    }
    return _themeColor;;
}

-(UIColor *)mainTitleColor{
    if (!_mainTitleColor) {
        _mainTitleColor = UIColor.blackColor;
    }
    return _mainTitleColor;;
}

-(UIColor *)subTitleColor{
    if (!_subTitleColor) {
        _subTitleColor = UIColor.blackColor;
    }
    return _subTitleColor;;
}

-(UIFont*)mainTitleFont{
    if (!_mainTitleFont) {
        _mainTitleFont = [UIFont systemFontOfSize:17];
    }
    return _mainTitleFont;
}

-(UIFont*)subTitleFont{
    if (!_subTitleFont) {
        _subTitleFont = [UIFont systemFontOfSize:14];
    }
    return _subTitleFont;
}



@end
