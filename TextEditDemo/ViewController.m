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
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 2;
    paragraph.paragraphSpacing = 5;
    
    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor lightGrayColor],
                          NSFontAttributeName:[UIFont systemFontOfSize:18],
                          NSParagraphStyleAttributeName:paragraph};
    
    YKTextView *textView = [[YKTextView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-200)];
    NSString *str = @"    She had been shopping with her Mom in Wal-Mart. She must have been 6 years old, this beautiful brown haired, freckle-faced image of innocence. It was pouring outside. The kind of rain that gushes over the top of rain gutters, so much in a hurry to hit the Earth, it has no time to flow down the spout.\n"
    "   她和妈妈刚在沃尔玛结束购物。这个天真的小女孩应该6岁大了，头发是美丽的棕色，脸上有雀斑。外面下着倾盆大雨。雨水溢满了檐槽，来不及排走，就迫不及待地涌涨上地面。\n"
    "   We all stood there under the awning and just inside the door of the Wal-Mart. We all waited, some patiently, others irritated, because nature messed up their hurried day. I am always mesmerized by rainfall. I get lost in the sound and sight of the heavens washing away the dirt and dust of the world. Memories of running, splashing so carefree as a child come pouring in as a welcome reprieve from the worries of my day.\n"
   "    我们都站在沃尔玛门口的遮篷下。大家都在等待，有人很耐心，有人很烦躁，因为老天在给他们本已忙碌的一天添乱。雨天总引起我的遐思。我出神地听着、看着老天冲刷洗涤这世界的污垢和尘埃，孩时无忧无虑地在雨中奔跑玩水的记忆汹涌而至，暂时缓解了我一天的焦虑。\n"
   "    Her voice was so sweet as it broke the hypnotic trance we were all caught in, “Mom, let's run through the rain.\" she said.";
    

    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];
    textView.attributedText = attributeStr;
    [self.view addSubview:textView];

    UITextView *textView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-100, 200, 100)];
    textView1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:textView1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
