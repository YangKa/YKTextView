//
//  ViewController.m
//  TextEditDemo
//
//  Created by qianzhan on 16/1/7.
//  Copyright © 2016年 qianzhan. All rights reserved.
//

#import "ViewController.h"
#import "YKTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];

    YKTextView *textView = [[YKTextView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    [self.view addSubview:textView];
    
    
    NSString *str = @"  Defence officials from South Korea and China will meet on Thursday (Jan 14) to discuss North Korea’s latest nuclear test, the Yonhap news agency reported, after the South and the United States put pressure on China to rein in its neighbour.\n"
    "   据韩国联合通讯社报道，中韩国防官员将在周四就朝鲜最近的核试验展开会谈。此前，韩国和美国相继对中国施压，要求中国管教近邻朝鲜。\n"
    "   The North’s nuclear test last Wednesday (Jan 6) angered both China and the United States and again raised questions about what can be done to stop its development of nuclear weapons.\n"
    "   上周三，朝鲜的核试验激怒了中国和美国，同时如何阻止朝鲜发展核武器的问题又显现出来。\n"
    "   Senior defence officials of South Korea and China will meet in Seoul in an annual forum and discuss a joint response to the test, the South Korean news agency reported.\n"
    "   韩国新闻媒体报道，中国和韩国的高级国防官员将在首尔的年度论坛中会面，共同讨论联合应对朝鲜核试验。\n"
    "   A South Korean Defence Ministry official could not immediately confirm the report.\n"
    "   一名韩国国防部的官员没有直接确认该报道。\n"
    "   North Korea said last week that it successfully tested a hydrogen bomb, but the United States and experts questioned the claim saying the recorded blast was too small for it to have been such a device.\n"
    "   上周朝鲜宣布成功试验，但美国和一些专家质疑该声明，称检测到的爆炸威力对于来说太小了。\n"
    "   South Korean President Park Geun Hye called on China on Wednesday to use its influence over North Korea to press it to end its nuclear programme, adding it could use its permanent seat on the UN Security Council to help draw up effective sanctions.\n"
    "   周三，韩国总统朴槿惠呼吁中国利用在朝鲜的影响力停止其核计划，同时还称中国要利用其联合国安理会常任理事国的身份帮助通过有效的制裁措施。\n"
    "\" I believe the Chinese government will not allow the situation on the Korean peninsula to deteriorate further,\" Ms Park told a news conference.\n"
    "   朴槿惠在新闻发布会上称：“我认为中国政府不会允许朝鲜半岛的形势继续恶化。” \n"
    "   China is the North’s main ally and trade partner but it opposes its bombs, while China’s ties with US ally South Korea have grown closer in recent years.\n"
    "   中国虽然是朝鲜的主要盟国，但反对其发展核武器，反而是近年来同美国的盟友韩国关系密切。\n"
    "   The US special envoy for North Korea, Mr Sung Kim, met his South Korean and Japanese counterparts in Seoul on Wednesday and said they had agreed that a \"meaningful\" new sanctions resolution was needed from the Security Council.\n"
    "   周三，美国朝鲜问题特使金成与驻韩国和日本的同事举行会谈，称他们就安理会的需要和目的达成了新的制裁协议。\n"
    "\" I hope the Chinese authorities agree with us that we simply cannot take a business as usual approach to this latest provocation,\" he said. \n"
    "   金成说道：“我希望中国政府能够支持我们的议案，不能对此次挑衅善罢甘休。\n";
    
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 2;
    paragraph.paragraphSpacing = 10;
    
    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor lightGrayColor],
                          NSFontAttributeName:[UIFont systemFontOfSize:16],
                          NSParagraphStyleAttributeName:paragraph};

    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];
    textView.attributedText = attributeStr;
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"attachment.jpg"];
    attachment.bounds = CGRectMake(0, -5, 40, 40);
    NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:attachment];
    [textView.textStorage insertAttributedString:imageStr atIndex:53];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
