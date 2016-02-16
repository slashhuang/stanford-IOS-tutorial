//
//  ViewController.m
//  deckGame
//
//  Created by slashhuang's mac on 16/2/15.
//  Copyright © 2016年 slashhuang's mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;//与view强相关，所以weak足矣
@property (nonatomic) int flipCount;
@end

@implementation ViewController

//- (Deck *)deck{
//    if(!_deck) _deck= [self createDeck];
//    return _deck;
//}

//- (Deck *)createDeck{
//    return [[playingCardDeck alloc] init];
//}
- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    NSLog(@"flip is now %d",self.flipCount);
}
- (IBAction)touchCard:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"A"]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardBack"]
                          forState:UIControlStateNormal];
        //        sender.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [sender setTitle:@"B"
                forState:UIControlStateNormal];
    }else{
//        Card *card = [self.deck.drawRandomCard];
        [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"]
                          forState:UIControlStateNormal];
        //        sender.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [sender setTitle:@"A" forState:UIControlStateNormal];
    }
    self.flipCount++;
}

@end
