//
//  EditProfileTableViewController.m
//  kaopai
//
//  Created by Aoymii on 13/9/58.
//  Copyright (c) พ.ศ. 2558 skycass_may. All rights reserved.
//

#import "EditProfileTableViewController.h"

@interface EditProfileTableViewController ()
{
    NSData * data;
    
    
}

@property (weak, nonatomic) IBOutlet UIImageView *profileView;
@end

@implementation EditProfileTableViewController
@synthesize profileView;


//เรียก fbid แล้วส่งลิ้งไปขอรูปโปรไฟล์จาก Facebook
- (void)setup {
    

    dispatch_async(dispatch_get_global_queue(0,0), ^{
        data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=large",self.fbID]]];
        NSLog(@"data :%@",data);
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            [profileView setImage:[UIImage imageWithData:data]]; //ให้เก็บ image เป็น data
        });
    });
    NSLog(@"data :%@",data);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
    //เปลี่ยนรูปโปรไฟล์เป็นทรงกลม
    self.profileView.layer.cornerRadius = profileView.frame.size.width/ 2.0;
    self.profileView.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
