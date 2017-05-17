#import <UIKit/UIKit.h>

#import "JSQMessagesLoadEarlierHeaderView.h"

@interface MEGAOpenMessageHeaderView : JSQMessagesLoadEarlierHeaderView

@property (weak, nonatomic) IBOutlet UILabel *conversationWithLabel;
@property (weak, nonatomic) IBOutlet UILabel *introductionLabel;

@property (weak, nonatomic) IBOutlet UILabel *confidentialityLabel;
@property (weak, nonatomic) IBOutlet UILabel *confidentialityExplanationLabel;

@property (weak, nonatomic) IBOutlet UILabel *authenticityLabel;
@property (weak, nonatomic) IBOutlet UILabel *authenticityExplanationLabel;

@end
