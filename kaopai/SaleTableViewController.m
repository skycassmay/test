//
//  SaleTableViewController.m
//  kapai
//
//  Created by komsit on 8/30/2558 BE.
//  Copyright (c) 2558 Komsit. All rights reserved.
//

#import "SaleTableViewController.h"


@interface SaleTableViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    NSMutableArray *imageData;
    NSNull *myNull;
    NSInteger  currentIndex;
}
@property (strong, nonatomic) IBOutlet UICollectionView *_collectionView;


@property (weak, nonatomic) IBOutlet UITextField *product_nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *cat_idTextField;
@property (weak, nonatomic) IBOutlet UITextView *product_detailTextFiedl;


@property (weak, nonatomic) IBOutlet UITextField *product_priceTextField;

@end

@implementation SaleTableViewController
- (void)setup {
    [self.navigationController.navigationBar setHidden:NO];
}



- (IBAction)Saleproduct:(id)sender
{
    
    [self.view endEditing:YES];
    Product *products = [[Product alloc]init];
    [products Saleproduct:[self.product_nameTextField text]product_detail:[self.product_nameTextField text] product_price:[self.product_priceTextField text] cat_id:[self.cat_idTextField text] completion:^(id success ){
        [self comletionSale:success];
     }];
}
-(void)comletionSale:(id)success{
    NSLog(@"saleproduct:%@",success);
    
    if(success!=nil){
        if ([success[@"status"]isEqualToString:@"true"]) {
            [self performSegueWithIdentifier:@"SaleviewToLoginView" sender:self];
        }else{
            [self alertViewTile:@""withMSG:@"กรุณากรอกข้อมูลให้ครบ"];
        }
    }

}
-(void)alertViewTile:(NSString *)tile withMSG:(NSString *)msg{
    UIAlertView *alerView =[[UIAlertView alloc]initWithTitle:tile
                                                     message:msg
                                                    delegate:self
                                           cancelButtonTitle:@"ตกลง"
                                           otherButtonTitles: nil];
    [alerView show];
}


- (void)setArray {
    myNull = [NSNull null];
    imageData = [[NSMutableArray alloc] init];
    for (int idx = 0; 6 > idx; idx++) {
        [imageData addObject:myNull];
    }
    
    NSLog(@"imageData :%@",imageData);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self setArray];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//เปลี่ยนสี navigation bar , สี back(tin) กลับ
-(void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.243 green:0.189 blue:0.306 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
 }

//เปลี่ยนรูปแบบของ color,font  ของ section
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    
    header.textLabel.textColor = [UIColor blackColor];
    header.textLabel.font = [UIFont boldSystemFontOfSize:13];
    CGRect headerFrame = header.frame;
    header.textLabel.frame = headerFrame;
    header.textLabel.textAlignment = NSTextAlignmentLeft;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [imageData count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    UIImageView *image = (UIImageView *)[cell viewWithTag:11101];
    if (![imageData[indexPath.row] isEqual:myNull]) {
        [image setImage:imageData[indexPath.row]];
    } else {
        [image setImage:[UIImage imageNamed:@"putimage.png"]];
    }
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    currentIndex = indexPath.row;
    [self photoLibrary];
}

- (void)photoLibrary {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [imageData replaceObjectAtIndex:currentIndex withObject:chosenImage];
    [self._collectionView reloadData];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


@end
