//
//  CardMatchingGame.m [包含所有的游戏逻辑]
//  deckGame
//
//  Created by slashhuang's mac on 16/2/17.
//  Copyright © 2016年 slashhuang's mac. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;//重新扩充类的定义，readwrite是默认，除非在头文件中我们定义了属性为readonly，否则是不需要定义这一步的
@property (strong,nonatomic) NSMutableArray *cards;

@end
@implementation CardMatchingGame
static const int MISMATCH_PENALTY =2;
static const int MATCH_BONUS =4;
static const int COST_TO_CHOOSE=1;

- (NSMutableArray *)cards//lazy instantiation
{
    if(!_cards)_cards = [[NSMutableArray alloc] init];
    return _cards;
}
//designated initialzer,仅当init不同于父类的init的时候使用
-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self=[super init];//NSObject's designated initializer is init
    if(self){
        for(int i=0;i<count;i++){
            Card *card=[deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self= nil;
                break;
            }
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count])?self.cards[index]:nil;
}
-(void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen=NO;
        }else{
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score +=matchScore*MATCH_BONUS;
                        otherCard.matched=YES;
                        card.matched=YES;
            
                    }else{
                        self.score -=MISMATCH_PENALTY;
                        otherCard.chosen=NO;
                    }
                    break;//can only choose 2 cards now
                }
            }
            self.score-=COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}
@end
