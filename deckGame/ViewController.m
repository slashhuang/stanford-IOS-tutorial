//
//  ViewController.m
//  deckGame
//
//  Created by slashhuang's mac on 16/2/15.
//  Copyright © 2016年 slashhuang's mac. All rights reserved.
//

#import "ViewController.h"
//<>和""引入模块的区别在于，寻址方式是在当前项目下，还是系统(框架)配置的头文件寻找
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong,nonatomic)CardMatchingGame *game;//新增数据逻辑
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButttons;//outletCollection的每一项都是个button实例
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController

-(CardMatchingGame *)game
{
    if(!_game) _game=[[CardMatchingGame alloc] initWithCardCount:[self.cardButttons count] usingDeck:[self createDeck]];
    return _game;
}

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}
- (IBAction)touchCard:(UIButton *)sender {
    //所有的数据逻辑都在model里面
    int buttonChosenIndex = [self.cardButttons indexOfObject:sender];
    [self.game chooseCardAtIndex:buttonChosenIndex];
    [self updateUI];
}
-(void)updateUI{
    for (UIButton *cardButton in self.cardButttons ) {
        int cardButtonIndex = [self.cardButttons indexOfObject:cardButton];
        Card *card =[self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"score:%d",self.game.score];
    }
}
-(NSString *)titleForCard:(Card *)card
{
    return card.isChosen?card.contents:@"";
}
-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen?@"cardFront":@"cardBack"];
}

@end
