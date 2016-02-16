//
//  PlayingCardDeck.m
//  deckGame
//
//  Created by slashhuang's mac on 16/2/16.
//  Copyright © 2016年 slashhuang's mac. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"
@implementation PlayingCardDeck
- (instancetype)init//类似ES6中的class函数语法
{   //标准的面向对象的东西
    self = [super init];//在继承关系中，先调用父类的init方法，因为是实例化依赖于父类
    if(self){
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                //因为我们没有在playingCard中调用init方法，所以init继承自NSObject
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}
@end