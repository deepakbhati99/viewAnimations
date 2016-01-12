//
//  DetailViewController.m
//  viewAnimations
//
//  Created by Himanshu Khatri on 1/11/16.
//  Copyright © 2016 bd 001. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController (){
    UIView *CheckerBoardview;
    UIView *containerView;
    
    
    NSMutableArray *lastAnimation;
    
    IBOutlet NSLayoutConstraint *leadingConstraint2;
    IBOutlet NSLayoutConstraint *leadingConstraint3;
    IBOutlet NSLayoutConstraint *leadingConstraint4;
    IBOutlet NSLayoutConstraint *leadingConstraint5;
    IBOutlet NSLayoutConstraint *leadingConstraint6;
    
    
}
@end

static NSString *constantPoppingEffect=@"popping";
static NSString *constantRotationEffect=@"transform.rotation.z";
static NSString *constantHighlighterEffect=@"BorderChanges";
static NSString *constantShakeEffect=@"shakeEffect";

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    lastAnimation=[[NSMutableArray alloc]init];
    [self configureView];
    
    switch (_x) {
        case 0:{
            UIButton *btn=[self.view viewWithTag:101];
            btn.alpha=1;
        }
            break;
        case 1:{
            UIButton *btn=[self.view viewWithTag:102];
            btn.alpha=1;
        }
            break;
        case 2:{
            UIButton *btn=[self.view viewWithTag:103];
            btn.alpha=1;
        }
            break;
        case 3:{
            UIButton *btn=[self.view viewWithTag:104];
            btn.alpha=1;
        }
            break;
        case 4:{
            UIButton *btn=[self.view viewWithTag:105];
            btn.alpha=1;
        }
            break;
        case 5:{
            UIButton *btn=[self.view viewWithTag:106];
            btn.alpha=1;
        }
            break;
            
        default:
            break;
    }

}
-(void)viewDidAppear:(BOOL)animated{
    
    CGFloat screenWidth=CGRectGetWidth(self.view.frame);
    
    CheckerBoardview=[[UIView alloc]initWithFrame:CGRectMake(0, 0,screenWidth ,screenWidth)];
    
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_detailDescriptionLabel.frame)+5,screenWidth ,screenWidth)];
    
    for (int row=0; row<8; row++) {
        
        for (int column=0; column<8; column++) {
            
            UIView *placeBox=[[UIView alloc]init];
            
            placeBox.frame=CGRectMake(column*screenWidth/8, row*screenWidth/8, screenWidth/8, screenWidth/8);
            
            if (row%2) {
                if (column%2) {
                    placeBox.backgroundColor=[UIColor whiteColor];
                }else{
                    placeBox.backgroundColor=[UIColor blackColor];
                }
            }else{
                
                if (column%2) {
                    placeBox.backgroundColor=[UIColor blackColor];
                }else{
                    placeBox.backgroundColor=[UIColor whiteColor];
                }
            }
            
            
            [CheckerBoardview addSubview:placeBox];
        }
        
        
    }
    [containerView addSubview:CheckerBoardview];
    
    [self.view bringSubviewToFront:_detailDescriptionLabel];
    
    
    
    switch (_x) {
        case 0:{
            UIButton *btn=[self.view viewWithTag:101];
            btn.alpha=1;
            [self animationType1:self];
        }
            break;
        case 1:{
            UIButton *btn=[self.view viewWithTag:102];
            btn.alpha=1;
            [self animationType2:self];
        }
            break;
        case 2:{
            UIButton *btn=[self.view viewWithTag:103];
            btn.alpha=1;
            [self animationType3:self];
        }
            break;
        case 3:{
            UIButton *btn=[self.view viewWithTag:104];
            btn.alpha=1;
            [self animationType4:self];
        }
            break;
        case 4:{
            UIButton *btn=[self.view viewWithTag:105];
            btn.alpha=1;
            [self animationType5:self];
        }
            break;
        case 5:{
            UIButton *btn=[self.view viewWithTag:106];
            btn.alpha=1;
            [self animationType6:self];
        }
            break;
            
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)animateTheButtons:(id)sender{
    
    // Get the reference to the current toolbar buttons
    NSMutableArray *rightBarButtons = [self.navigationItem.rightBarButtonItems mutableCopy];
    
    // This is how you remove the button from the toolbar and animate it
    [rightBarButtons removeObject:sender];
    [self.navigationItem setRightBarButtonItems:rightBarButtons animated:YES];
    
    [self.view layoutIfNeeded]; //for updating the frames using constraint with animation
    
    UIButton *btn=[self.view viewWithTag:101]; //we'll get the width of the bottom buttons. these all buttons are of equal widths.
    
    CGFloat xPoint=CGRectGetWidth(btn.frame);

    leadingConstraint2.constant=xPoint;
    leadingConstraint3.constant=xPoint*2;
    leadingConstraint4.constant=xPoint*3;
    leadingConstraint5.constant=xPoint*4;
    leadingConstraint6.constant=xPoint*5;
    

    
    
    switch (_x) {
        case 0:{
            UIButton *btn=[self.view viewWithTag:101];
            [self highlightButton:btn];
        }
            break;
        case 1:{
            UIButton *btn=[self.view viewWithTag:102];
            [self highlightButton:btn];
        }
            break;
        case 2:{
            UIButton *btn=[self.view viewWithTag:103];
            [self highlightButton:btn];
        }
            break;
        case 3:{
            UIButton *btn=[self.view viewWithTag:104];
            [self highlightButton:btn];
        }
            break;
        case 4:{
            UIButton *btn=[self.view viewWithTag:105];
            [self highlightButton:btn];
        }
            break;
        case 5:{
            UIButton *btn=[self.view viewWithTag:106];
            [self highlightButton:btn];
        }
            break;
            
        default:
            break;
    }

   
    //duration:- the time you want your total animation should work.
    //delay:- delay of particular time is added to animation
    //When dampingRatio is 1, the animation will smoothly decelerate to its final model values without oscillating. Damping ratios less than 1 will oscillate more and more before coming to a complete stop
    //initial spring velocity:- velocity at which the animation will start
    
    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.4 options:UIViewAnimationOptionTransitionCurlDown animations:^{
        [self.view layoutIfNeeded];
        
    }completion:^(BOOL finished){
        
    }];
}
- (IBAction)undoView:(id)sender {
    [self.view addSubview:_detailDescriptionLabel];
    int lastAnimationType=[[lastAnimation lastObject] intValue];
    [lastAnimation removeLastObject];
    switch (lastAnimationType) {
        case 1:
        {
            //duration:- the time you want your total animation should work.
            //delay:- delay of particular time is added to animation
            //When dampingRatio is 1, the animation will smoothly decelerate to its final model values without oscillating. Damping ratios less than 1 will oscillate more and more before coming to a complete stop
            //initial spring velocity:- velocity at which the animation will start
            
            [UIView animateWithDuration:2 delay:.1 usingSpringWithDamping:0.4 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
                _detailDescriptionLabel.frame=CGRectMake(20, 95, _detailDescriptionLabel.frame.size.width, _detailDescriptionLabel.frame.size.height);
                _detailDescriptionLabel.alpha=1;
            }completion:^(BOOL finished){
                
            }];
        }
            break;
        case 2:{
            
            //duration:- the time you want your total animation should work.
            //delay:- delay of particular time is added to animation
            //When dampingRatio is 1, the animation will smoothly decelerate to its final model values without oscillating. Damping ratios less than 1 will oscillate more and more before coming to a complete stop
            //initial spring velocity:- velocity at which the animation will start
            [UIView animateWithDuration:2 delay:.1 usingSpringWithDamping:0.4 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
                _detailDescriptionLabel.frame=CGRectMake(20, 95, _detailDescriptionLabel.frame.size.width, _detailDescriptionLabel.frame.size.height);
                _detailDescriptionLabel.alpha=1;
            }completion:^(BOOL finished){
                
            }];
        }
        case 3:{
            [self.view bringSubviewToFront:containerView];
            
            UIView *toView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, containerView.frame.size.width, containerView.frame.size.height)];
            toView.backgroundColor = [[UIColor greenColor]colorWithAlphaComponent:0.5];
            
            [UIView animateWithDuration:0.33 animations:^{
                containerView.alpha=1;
            }completion:^(BOOL finished){
                
                //addingView toView
                
                [UIView transitionFromView:CheckerBoardview toView:toView duration:2 options:UIViewAnimationOptionTransitionCurlDown completion:^(BOOL finished){
                    
                    [UIView animateWithDuration:0.33 animations:^{
                        containerView.alpha=0;
                    }completion:^(BOOL finished){
                        [containerView removeFromSuperview];
                    }];
                    
                }];
                
                
            }];
            break;
        }
        case 4:{
            
            //removing the animation from the layer using its identifier i.e. key.
            
            [_detailDescriptionLabel.layer removeAnimationForKey:constantRotationEffect];
        }
            break;
        case 5:{
            //removing the animation from the layer using its identifier i.e. key.
            [_detailDescriptionLabel.layer removeAnimationForKey:constantShakeEffect];
        }
            break;
        case 6:{
            //removing the animation from the layer using its identifier i.e. key.
            [_detailDescriptionLabel.layer removeAnimationForKey:constantHighlighterEffect];
        }
            break;
        default:
            break;
    }
 
}

- (IBAction)animationType1:(id)sender {
    [lastAnimation addObject:[NSNumber numberWithInt:1]];
    
    [UIView animateWithDuration:2 delay:0.1 usingSpringWithDamping:1 initialSpringVelocity:.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _detailDescriptionLabel.center=self.view.center;
    }completion:^(BOOL finished){
        
    }];
    
}
- (IBAction)animationType2:(id)sender {
    [lastAnimation addObject:[NSNumber numberWithInt:2]];
    
    [UIView animateWithDuration:2 delay:.1 usingSpringWithDamping:0.4
          initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
              _detailDescriptionLabel.center=self.view.center;
          }completion:^(BOOL finished){
              
          }];
    
}

- (IBAction)animationType3:(id)sender {
    
    [lastAnimation addObject:[NSNumber numberWithInt:3]];
    
    [self.view addSubview:containerView];
    
    UIView *fromView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, containerView.frame.size.width, containerView.frame.size.height)];
    fromView.backgroundColor = [[UIColor greenColor]colorWithAlphaComponent:0.5];
    
    [containerView addSubview:fromView];
    
    containerView.alpha=0;
    [UIView animateWithDuration:0.33 animations:^{
        
        containerView.alpha=1;
    }completion:^(BOOL finished){
        
        //removingView :- fromView
        //below options are given
        [UIView transitionFromView:fromView toView:CheckerBoardview duration:2 options:UIViewAnimationOptionTransitionCurlUp completion:^(BOOL finished){
            
        }];
    }];
    
    
    //different UIViewAnimationOptionTransition are there you can use any of them and customize the effect as you requirement.
    
    //    UIViewAnimationOptionTransitionNone
    //    UIViewAnimationOptionTransitionFlipFromLeft
    //    UIViewAnimationOptionTransitionFlipFromRight
    //    UIViewAnimationOptionTransitionCurlUp
    //    UIViewAnimationOptionTransitionCurlDown
    //    UIViewAnimationOptionTransitionCrossDissolve
    //    UIViewAnimationOptionTransitionFlipFromTop
    //    UIViewAnimationOptionTransitionFlipFromBottom
    
}
- (IBAction)animationType4:(id)sender {
    
    [lastAnimation addObject:[NSNumber numberWithInt:4]];
    

    
    
    //creates a frame of animation for the particular property.
    CAKeyframeAnimation* cornerAnimation = [CAKeyframeAnimation animationWithKeyPath:@"cornerRadius"];
    
    //generating an array with increment till the half of it's height
    NSMutableArray *cornerArray=[[NSMutableArray alloc]init];
    for (int i=0; ; i++) {
        if (i<_detailDescriptionLabel.frame.size.height/2) {
            [cornerArray addObject:[NSNumber numberWithInt:i]];
        }else
            break;
    }
    
    //values of animation of particular property is added.
    cornerAnimation.values = cornerArray;
    cornerAnimation.calculationMode = kCAAnimationPaced;

    //creates a frame of animation for the particular property.
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //different values of animation.
    scaleAnimation.duration = 1.0;
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.5];
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = (YES) ? HUGE_VALF : 0;
    
    
    
    //merging the individual animations and adding them
    CAAnimationGroup* groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = [NSArray arrayWithObjects: cornerAnimation,scaleAnimation, nil];
    groupAnimation.duration = 2.0;
    groupAnimation.autoreverses = YES;
    groupAnimation.repeatCount =(YES) ? HUGE_VALF : 0;
    
    // adding the animation  to the layer
    [_detailDescriptionLabel.layer addAnimation:groupAnimation forKey:constantRotationEffect];
}



- (IBAction)animationType5:(id)sender {

    [lastAnimation addObject:[NSNumber numberWithInt:5]];

    //creates a frame of animation for the particular property.
    CAKeyframeAnimation *animationH = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    animationH.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //values of animation of particular property is added.
    animationH.values = @[@(-12), @(12), @(-8), @(8), @(-4), @(4), @(0) ];
    
    //creates a frame of animation for the particular property.
    CAKeyframeAnimation *animationV = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    animationV.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //values of animation of particular property is added.
    animationV.values = @[@(-12), @(12), @(-8), @(8), @(-4), @(4), @(0) ];

    //merging the individual animations and adding them
    CAAnimationGroup* group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:animationH, animationV, nil]; //array of  the animations created.
    group.duration = .5;
    group.autoreverses = NO;
    group.repeatCount = (YES) ? HUGE_VALF : 0;
    
    // adding the animation to the layer
    [_detailDescriptionLabel.layer addAnimation:group forKey:constantShakeEffect];
}


- (IBAction)animationType6:(id)sender {
    
    [lastAnimation addObject:[NSNumber numberWithInt:6]];

    
    //creates a frame of animation for the particular property.
    CAKeyframeAnimation* widthAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderWidth"];
    //values of animation of particular property is added.
    NSArray* widthValues = [NSArray arrayWithObjects:@1.0, @2.0, @8.0, @4.0, @4.5, @9.0, @2.50, @10.0, @5.50,@3.0, @2.0, @8.0, @4.0, @4.5, @9.0, @2.50, @10.0, @5.50, nil];
    widthAnim.values = widthValues;
    widthAnim.calculationMode = kCAAnimationPaced;
    
    // Animation 2
    
    
    //creates a frame of animation for the particular property.
    CAKeyframeAnimation* colorAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderColor"];
    //values of animation of particular property is added.
    NSArray* colorValues = [NSArray arrayWithObjects:(id)[UIColor greenColor].CGColor,
                            (id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor,(id)[UIColor lightGrayColor].CGColor, (id)[UIColor darkGrayColor].CGColor, (id)[UIColor whiteColor].CGColor,(id)[UIColor cyanColor].CGColor,(id)[UIColor magentaColor].CGColor, nil];
    colorAnim.values = colorValues;
    colorAnim.calculationMode = kCAAnimationPaced;
    
    
    // Animation group
    //merging the individual animations and adding them
    CAAnimationGroup* group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:colorAnim, widthAnim, nil];//array of  the animations created.
    group.duration = 2.0;
    group.autoreverses = YES;
    group.repeatCount = (YES) ? HUGE_VALF : 0;
    
    
    // adding the animation to the layer
    [_detailDescriptionLabel.layer addAnimation:group forKey:constantHighlighterEffect];
    
    
    
    
    
}


-(IBAction)highlightButton:(id)sender{
    
    
    // getting all the bottom buttons from there tags.
    // removing the animation from all the buttons.
    UIButton *btn1=[self.view viewWithTag:101];
    [btn1.layer removeAnimationForKey:constantHighlighterEffect];
    UIButton *btn2=[self.view viewWithTag:102];
    [btn2.layer removeAnimationForKey:constantHighlighterEffect];
    UIButton *btn3=[self.view viewWithTag:103];
    [btn3.layer removeAnimationForKey:constantHighlighterEffect];
    UIButton *btn4=[self.view viewWithTag:104];
    [btn4.layer removeAnimationForKey:constantHighlighterEffect];
    UIButton *btn5=[self.view viewWithTag:105];
    [btn5.layer removeAnimationForKey:constantHighlighterEffect];
    UIButton *btn6=[self.view viewWithTag:106];
    [btn6.layer removeAnimationForKey:constantHighlighterEffect];
    
    btn1.alpha=1;
    btn2.alpha=1;
    btn3.alpha=1;
    btn4.alpha=1;
    btn5.alpha=1;
    btn6.alpha=1;
// adding the animation to the button selected.
    
    // Animation 1
    CAKeyframeAnimation* widthAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderWidth"];
    NSArray* widthValues = [NSArray arrayWithObjects:@1.0, @2.0, @2.50,@1.5, @2.50, nil];
    widthAnim.values = widthValues;
    widthAnim.calculationMode = kCAAnimationPaced;
    
    // Animation 2
    CAKeyframeAnimation* colorAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderColor"];
    NSArray* colorValues = [NSArray arrayWithObjects:(id)[UIColor greenColor].CGColor,
                            (id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor,(id)[UIColor lightGrayColor].CGColor, (id)[UIColor darkGrayColor].CGColor, (id)[UIColor whiteColor].CGColor,(id)[UIColor cyanColor].CGColor,(id)[UIColor magentaColor].CGColor, nil];
    colorAnim.values = colorValues;
    colorAnim.calculationMode = kCAAnimationPaced;
    
    
    // Animation group
    CAAnimationGroup* group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:colorAnim, widthAnim, nil];
    group.duration = 2.0;
    group.autoreverses = YES;
    group.repeatCount = (YES) ? HUGE_VALF : 0;
    
    
    
    [[sender layer] addAnimation:group forKey:constantHighlighterEffect];
    
}



@end
