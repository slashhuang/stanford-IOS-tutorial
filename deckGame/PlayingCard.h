//
//  PlayingCard.h
//  deckGame
//
//  Created by slashhuang's mac on 16/2/16.
//  Copyright © 2016年 slashhuang's mac. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;//NSUInteger是unsigned interger 的typedef;相比于c语言的int类型，NSInteger的空间大小更大，所以在整个代码块中尽量保持一致。不然会存在数据截取的风险

+ (NSArray *)validSuits;//make the method public
+ (NSUInteger)maxRank;
@end
