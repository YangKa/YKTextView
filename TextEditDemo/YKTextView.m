//
//  YKTextView.m
//  TextEditDemo
//
//  Created by qianzhan on 16/1/13.
//  Copyright © 2016年 qianzhan. All rights reserved.
//

#import "YKTextView.h"

@interface YKTextView ()
@property (nonatomic, strong) UIView *backView;
@end

@implementation YKTextView

- (id)initWithFrame:(CGRect)frame{
   self = [super initWithFrame:frame];
    if (self) {
         self.editable = NO;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenDetailView) name:UIMenuControllerWillShowMenuNotification object:nil];

    }
    return self;
}

- (void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIMenuControllerWillShowMenuNotification object:nil];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];

    [self singleTapAtPoint:point];
}

- (void)hiddenDetailView{
    [_backView removeFromSuperview];
    [self defaultAttributeText];
}

- (void)singleTapAtPoint:(CGPoint)point{
  
    point.y = point.y-10;
    
    CGFloat fraction = 0;
    NSInteger characterIndex = [self.layoutManager characterIndexForPoint:point inTextContainer:self.textContainer fractionOfDistanceBetweenInsertionPoints:&fraction];
    
    [self hiddenDetailView];
    
    if (fraction > 0 && fraction < 1) {
        
        if (characterIndex < self.textStorage.length) {
            
            NSRange range = NSMakeRange(characterIndex, 1);
            NSString *character = [self.text substringWithRange:range];
            
            if (![self IsChinese:character]) {
                
                if (![character isEqualToString:@" "]  && ![character isEqualToString:@","] && ![character isEqualToString:@"."]) {
            
                    [self printStrWithCharatcterIndex:characterIndex atPoint:point];
                    
                }
                
            }
            
        }
    }

}

-(BOOL)IsChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
        
    }
    return NO;
    
}

- (void)printStrWithCharatcterIndex:(NSInteger)characterIndex atPoint:(CGPoint)point{
    
    NSInteger startIndex = [self getStartIndexWithIndex:characterIndex];
    NSInteger endIndex = [self getEndIndexWithIndex:characterIndex];
    
    NSInteger length = endIndex - startIndex +1;
    if (length< self.textStorage.length) {
        NSRange range = NSMakeRange(startIndex, length);
        NSString *value = [self.text substringWithRange:range];
        
        [self renderSelectStringColor:range];
        [self createDetailView:point value:value];
    }
}


- (void)createDetailView:(CGPoint)point value:(NSString*)value{
    
    _backView = [[UIView alloc] init];
    _backView.frame = [self showFrameAtPoint:point];
    _backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    _backView.layer.cornerRadius = 15;
    _backView.layer.masksToBounds = YES;
    //_backView.alpha = 0;
    [self addSubview:_backView];
    
    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.frame = CGRectMake(0, 5, _backView.frame.size.width, 15);
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.text = @"详细";
    titleLable.textColor = [UIColor whiteColor];
    [_backView addSubview:titleLable];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 25, _backView.frame.size.width, _backView.frame.size.height-25);
    label.textAlignment = NSTextAlignmentCenter;
    label.text =[self filterString:value];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:20];
    [_backView addSubview:label];
    
    [UIView animateWithDuration:0.3 animations:^{
        _backView.alpha = 1.0;
    }];
}


- (NSString*)filterString:(NSString*)str{
    if (str.length >0) {
        
        NSString *first = [str substringToIndex:1];
        NSString *end = [str substringFromIndex:str.length-1];
        
        if ([first isEqualToString:@","] || [first isEqualToString:@"."]) {
            str = [str substringFromIndex:1];
        }
        
        if ([end isEqualToString:@","] || [end isEqualToString:@"."]) {
            str = [str substringToIndex:str.length-1];
        }
    }
    
    return str;
}


- (void)renderSelectStringColor:(NSRange)range{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    self.attributedText = str;
}


- (void)defaultAttributeText{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, str.length)];
    self.attributedText = str;
}

- (CGRect)showFrameAtPoint:(CGPoint)point{
    CGFloat width = 200;
    CGFloat height = 60;

    CGFloat x;

    if (point.x + width/2 > self.frame.size.width) {
        x = point.x-width;
    }else if (point.x - width/2 < 0){
        x = point.x;
    }else{
        x = point.x-width/2;
    }
    
    CGFloat y;
    
    CGFloat contentY = self.contentOffset.y;
    if (point.y-contentY < height) {
        y = point.y+30;
    }else{
        y = point.y - height-10;
    }
    
    return CGRectMake(x, y, width, height);
}

- (NSInteger)getStartIndexWithIndex:(NSInteger)characterIndex{
    
    NSInteger startIndex = characterIndex;
    while (startIndex--) {
        NSRange range = NSMakeRange(startIndex, 1);
        if ([[self.text substringWithRange:range] isEqualToString:@" "]) {
            startIndex++;
            break;
        }
    }
    
    if (startIndex < 0) {
        startIndex = 0;
    }
    
    return startIndex;
}

- (NSInteger)getEndIndexWithIndex:(NSInteger)characterIndex{
    NSInteger endIndex = characterIndex ;
    while(endIndex++){
        
        if (endIndex != self.textStorage.length) {
            NSRange range = NSMakeRange(endIndex, 1);
            if ([[self.text substringWithRange:range] isEqualToString:@" "]) {
                endIndex--;
                break;
            }
        }else{
            endIndex--;
            break;
        }
    }
    return endIndex;
}

@end
