//
//  Friend_SchoolmateTitleView.m
//  X.Friend
//
//  Created by admin on 2017/12/8.
//  Copyright © 2017年 YinGu. All rights reserved.
//

#import "Friend_SchoolmateTitleView.h"
#import "UIView+Extension.h"

@interface Friend_SchoolmateTitleView(){
    
    CGFloat _gradeViewHeight;
    CGFloat _genderViewHeight;

}

@end
@implementation Friend_SchoolmateTitleView

- (void)initContentView{
    
//    self.clipsToBounds = YES;
    
    NSArray *title_array = @[@"年级",@"性别"];
    for (NSInteger i=0; i < 2; i++) {
        
        CGRect rect = CGRectMake((KScreenWidth/2)*i, 0, KScreenWidth/2, 40);
        UIButton *button = [UIButton addButtonWithFrame:rect title:title_array[i] font:FONT(14) textColor:kTextBlackColor image:[UIImage imageNamed:@"Friend_arrow"] backgroundColor:KClearColor Target:self action:@selector(titleSelect:)];
        button.tag = i;
        [self addSubview:button];
        
        if (i == 0) {
            self.gradeBtn = button;
        }else{
            self.genderBtn = button;
        }
    }
    
    UIView *spaceLine = [UIView getGrayLine];
    spaceLine.frame = CGRectMake(0, 39.5, KScreenWidth, 0.5);
    [self addSubview:spaceLine];

    
    UIView *bottomView = [UIView new];
    bottomView.frame = CGRectMake(0, 40, KScreenWidth, kContentHeight - 40);
    bottomView.backgroundColor = KBlackColor;
    bottomView.alpha = 0.1f;
    [self addSubview:bottomView];
    
    
    //********************************  创建筛选项  *************************************************
    
    /** 年级筛选*/
    
    CGFloat gradeLine_x = 14;
//    CGFloat gradeLine_y = 40;
    CGFloat gradeLine_width = 122;
    CGFloat gradeLine_height = 0.5;
    
    CGFloat gradeView_itemHeight = 42;
    CGFloat gradeViewWidth = 150;
    NSArray *grade_array = @[@"大一",@"大二",@"大三",@"大四",@"大学毕业"];
//    CGFloat gradeViewHeight = gradeView_itemHeight*grade_array.count;
    _gradeViewHeight = gradeView_itemHeight*grade_array.count;


    CGFloat gradeView_x = KScreenWidth/4 - gradeViewWidth/2;
    UIView *gradeView = [UIView new];
    gradeView.frame = CGRectMake(gradeView_x, 40, gradeViewWidth, 0);
    gradeView.backgroundColor = kRandomColor;
//    [self addSubview:gradeView];
//    [bottomView addSubview:gradeView];
    [self addSubview:gradeView];
    gradeView.clipsToBounds = YES;

    self.gradeView = gradeView;

//    gradeView.sd_layout
//    .centerXEqualToView(self.gradeBtn)
////    .topEqualToView(self.gradeBtn)
//    .topSpaceToView(self, 40)
//    .widthIs(gradeViewWidth)
//    .heightIs(0);

    
    for (NSInteger i=0; i < grade_array.count; i++) {
        CGRect rect = CGRectMake(0, gradeView_itemHeight*i, gradeViewWidth, gradeView_itemHeight);
        
        UIButton *button = [UIButton addButtonWithFrame:rect title:grade_array[i] backgroundColor:KClearColor titleColor:kTextBlackColor font:FONT(15) Target:self action:@selector(selectGrade:)];
        button.tag = i;
        [gradeView addSubview:button];
        
        if (i < grade_array.count && i > 0) {
           
            UIView *line = [UIView getGrayLine];
            line.frame = CGRectMake(gradeLine_x, gradeView_itemHeight*i, gradeLine_width, gradeLine_height);
            [gradeView addSubview:line];
        }

    }
    
    /** 性别筛选*/
    
    CGFloat genderLine_x = 23;
    CGFloat genderLine_width = 68;
    CGFloat genderLine_height = 0.5;
    
    CGFloat genderView_itemHeight = 30;
    CGFloat genderViewWidth = 114;
    NSArray *gender_array = @[@"男",@"女"];
    _genderViewHeight = genderView_itemHeight*gender_array.count;

    CGFloat genderView_x = 3*KScreenWidth/4 - genderViewWidth/2;

    UIView *genderView = [UIView new];
    genderView.frame = CGRectMake(genderView_x, 40, genderViewWidth, 0);
    genderView.backgroundColor = kRandomColor;
//    [self addSubview:genderView];
//    [bottomView addSubview:genderView];
    [self addSubview:genderView];
    self.genderView = genderView;
    genderView.clipsToBounds = YES;

    
//    genderView.sd_layout
//    .centerXEqualToView(self.genderBtn)
////    .topEqualToView(self.genderBtn)
//    .topSpaceToView(self, 40)
//    .widthIs(genderViewWidth)
//    .heightIs(0);

    
    for (NSInteger i=0; i < gender_array.count; i++) {
        CGRect rect = CGRectMake(0, genderView_itemHeight*i, genderViewWidth, genderView_itemHeight);
        
        UIButton *button = [UIButton addButtonWithFrame:rect title:gender_array[i] backgroundColor:KClearColor titleColor:kTextBlackColor font:FONT(15) Target:self action:@selector(selectgender:)];
        button.tag = i;
        [genderView addSubview:button];
        
        if (i < grade_array.count && i > 0) {
            
            UIView *line = [UIView getGrayLine];
            line.frame = CGRectMake(genderLine_x, genderView_itemHeight*i, genderLine_width, genderLine_height);
            [genderView addSubview:line];
        }
        
    }
    
}

- (void)titleSelect:(UIButton *)button{
    
    if (button.tag == 0) {
        
        CGFloat grade_height = self.gradeView.frame.size.height;

        [UIView animateWithDuration:0.1f animations:^{
            
            CGRect gradeView_rect = self.gradeView.frame;
            CGFloat grade_changeHeight;
            
            if (grade_height > 0) {

                grade_changeHeight = 0;
            }else{

                grade_changeHeight = _gradeViewHeight;
            }
//            grade_changeHeight = _gradeViewHeight;

            gradeView_rect.size.height = grade_changeHeight;
            self.gradeView.frame = gradeView_rect;
            
            
        } completion:^(BOOL finished) {
            
            CGFloat heig = grade_height;
            CGFloat grade_height2 = self.gradeView.frame.size.height;

//            if (grade_height > 0) {
//
//                [self.gradeView removeFromSuperview];
//
//            }else{
//
//            }
        }];
        
    }else{
        
        
    }
}

- (void)selectGrade:(UIButton *)button{

    if (self.selectGradeBlock) {
        
        self.selectGradeBlock(button.tag);
    }
    
}

- (void)addAnimationForGradeView{
    
    [UIView animateWithDuration:1.0f animations:^{
        
    } completion:^(BOOL finished) {
        
        
    }];
    
}


- (void)selectgender:(UIButton *)button{
    
    if (self.selectGenderBlock) {
        
        self.selectGenderBlock(button.tag);
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
