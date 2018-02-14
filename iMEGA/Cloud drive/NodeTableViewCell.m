#import "NodeTableViewCell.h"
#import "MEGASdkManager.h"
#import "Helper.h"

@interface NodeTableViewCell () <CustomEditCellAnimations>

@property (nonatomic, getter=isPseudoEditing) BOOL pseudoEdit;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIButton *customEditControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingSpaceMainViewConstraint;

@end

@implementation NodeTableViewCell

#pragma mark - Life Cycle

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if ([self.customEditDelegate isPseudoEditing]) {
        self.pseudoEdit = editing;
        [self setSwipeOffset:0];
        [self beginEditMode];
    } else {
        [self endEditMode];
        [super setEditing:editing animated:animated];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.customEditControl.selected = selected;
}

#pragma mark - CustomEditCellAnimations

- (void)beginEditMode {
    if (!self.isSwiping) {
        self.leadingSpaceMainViewConstraint.constant = self.isPseudoEditing ? 0 : -kCustomEditControlWidth;
    } else {
        self.isSwiping = NO;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.mainView.superview layoutIfNeeded];
    }];
}

- (void)endEditMode {
    self.leadingSpaceMainViewConstraint.constant = -kCustomEditControlWidth;
    self.isSwiping = NO;
}

#pragma mark - Private

- (IBAction)cancelTransfer:(id)sender {
    NSNumber *transferTag = [[Helper downloadingNodes] objectForKey:[MEGASdk base64HandleForHandle:self.nodeHandle]];
    if ([[MEGASdkManager sharedMEGASdk] transferByTag:transferTag.integerValue] != nil) {
        [[MEGASdkManager sharedMEGASdk] cancelTransferByTag:transferTag.integerValue];
    } else {
        if ([[MEGASdkManager sharedMEGASdkFolder] transferByTag:transferTag.integerValue] != nil) {
            [[MEGASdkManager sharedMEGASdkFolder] cancelTransferByTag:transferTag.integerValue];
        }
    }
}

@end
