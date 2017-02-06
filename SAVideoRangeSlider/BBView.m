//
//  BBView.m
//  SAVideoRangeSliderExample
//
//  Created by lixiaohu on 17/2/6.
//  Copyright © 2017年 Andrei Solovjev. All rights reserved.
//

#import "BBView.h"

@implementation BBView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //设置 背景为clear
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
    }
    return self;}
-(void)drawRect:(CGRect)rect
{
//    //中间镂空的矩形框
//    CGRect myRect = self.contentFrame;
//    //背景
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:0];
//    //镂空
//    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:myRect];
//    [path appendPath:circlePath];
//    [path setUsesEvenOddFillRule:YES];
//    
//    CAShapeLayer *fillLayer = [CAShapeLayer layer];
//    fillLayer.path = path.CGPath;
//    fillLayer.fillRule = kCAFillRuleEvenOdd;//中间镂空的关键点 填充规则
//    fillLayer.fillColor = [UIColor redColor].CGColor;
//    fillLayer.opacity = 0.2;
//    [self.layer addSublayer:fillLayer];
    
    [[UIColor colorWithWhite:0 alpha:0.5] setFill];
    //半透明区域
    UIRectFill(rect);
    
    //透明的区域
    CGRect holeRection = self.contentFrame;
    /** union: 并集
     CGRect CGRectUnion(CGRect r1, CGRect r2)
     返回并集部分rect
     */
    
    /** Intersection: 交集
     CGRect CGRectIntersection(CGRect r1, CGRect r2)
     返回交集部分rect
     */
    CGRect holeiInterSection = CGRectIntersection(holeRection, rect);
    [[UIColor clearColor] setFill];
    
    //CGContextClearRect(ctx, <#CGRect rect#>)
    //绘制
    //CGContextDrawPath(ctx, kCGPathFillStroke);
    UIRectFill(holeiInterSection);

}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return self.superview;
}


- (void)setContentFrame:(CGRect)contentFrame{
    _contentFrame = contentFrame;
    
    [self setNeedsDisplay];
}
@end
