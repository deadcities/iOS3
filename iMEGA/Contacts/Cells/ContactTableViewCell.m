#import "ContactTableViewCell.h"

@implementation ContactTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = UIColor.clearColor;
        view.userInteractionEnabled = NO;
        self.selectedBackgroundView = view;
        
        self.lineView.backgroundColor = UIColor.mnz_grayCCCCCC;
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = UIColor.clearColor;
        self.selectedBackgroundView = view;
        
        self.lineView.backgroundColor = UIColor.mnz_grayCCCCCC;
    }
}

@end
