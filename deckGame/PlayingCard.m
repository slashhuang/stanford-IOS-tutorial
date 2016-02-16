//
//  PlayingCard.m
//  deckGame
//
//  Created by slashhuang's mac on 16/2/16.
//  Copyright © 2016年 slashhuang's mac. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard


- (NSString *)contents//覆盖父类接口中的contents的getter方法，同时所有的声明只是继承自父类而已
{
    
//  所有这些语法会被编译器转化成常规的消息传递形式
//  例如, @[ ... ]等价于[[NSArray alloc] initWithObjects:...]
//  ￼￼￼￼￼￼￼￼￼rankStrings[self.rank]是[rankStrings objectAtIndexedSubscript:self.rank]
    NSArray *rankStrings=[PlayingCard rankStrings];//并不需要预先定义方法，类似JS
    //省略了部分值
    //@[]语法用于创建一个数组
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
   // 调用属性就是调用getter
}
@synthesize suit = _suit; // 当自己同时提供setter和getter方法的时候，编译器不会帮你
//自动添加synthesize指令!!!前者是属性；后者是实例变量.这边比较容易搞混

+ (NSArray *)validSuits//类方法，非实例方法。由于类方法并不会传递到实例，因此代码块
//中无法引用我们的property
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}
+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"10",@"J",@"Q",@"K"];
}
+ (NSUInteger)maxRank {
    return [[self rankStrings] count]-1;
}

- (void)setSuit:(NSString *)suit//只允许直接调用实例变量
{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}
- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

-(NSString *)suit//覆盖编译器对属性自动去做的getter方法
{
    return _suit ? _suit:@"?";
}

@end