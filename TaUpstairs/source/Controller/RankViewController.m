#import "RankViewController.h"
#import "AWCollectionViewDialLayout.h"
#import "Request.h"
@interface RankViewController ()

@end
static NSString *cellId = @"cellId";
static NSString *cellId2 = @"cellId2";
@implementation RankViewController{

NSMutableDictionary *thumbnailCache;

UILabel *radiusLabel;
UISlider *radiusSlider;
UILabel *angularSpacingLabel;
UISlider *angularSpacingSlider;
UILabel *xOffsetLabel;
UISlider *xOffsetSlider;
UISegmentedControl *exampleSwitch;
AWCollectionViewDialLayout *dialLayout;

int type;
}

@synthesize collectionView, items;
- (void)viewDidLoad
{
    [super viewDidLoad];
    type = 0;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:nil];
    [collectionView registerNib:[UINib nibWithNibName:@"dialCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellId];
    [collectionView registerNib:[UINib nibWithNibName:@"dialCell2" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellId2];
    
    
//    NSError *error;
//    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"players" ofType:@"json"];
//    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:NULL];
//    NSLog(@"jsonString:%@",jsonString);
//    items = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    items = [Request rankList:@"1"];
    
    
    CGFloat radius = radiusSlider.value * 1000;
    CGFloat angularSpacing = angularSpacingSlider.value * 90;
    CGFloat xOffset = xOffsetSlider.value * 320;
    CGFloat cell_width = 240;
    CGFloat cell_height = 100;
    [radiusLabel setText:[NSString stringWithFormat:@"Radius: %i", (int)radius]];
    [angularSpacingLabel setText:[NSString stringWithFormat:@"Angular spacing: %i", (int)angularSpacing]];
    [xOffsetLabel setText:[NSString stringWithFormat:@"X offset: %i", (int)xOffset]];
    
    
    
    dialLayout = [[AWCollectionViewDialLayout alloc] initWithRadius:radius andAngularSpacing:angularSpacing andCellSize:CGSizeMake(cell_width, cell_height) andAlignment:WHEELALIGNMENTCENTER andItemHeight:cell_height andXOffset:xOffset];
    [collectionView setCollectionViewLayout:dialLayout];
    

    
    [self switchExample];
    
}

-(void)switchExample{
    type = (int)exampleSwitch.selectedSegmentIndex;
    CGFloat radius = 0 ,angularSpacing  = 0, xOffset = 0;
    
    if(type == 0){
        [dialLayout setCellSize:CGSizeMake(240, 100)];
        [dialLayout setWheelType:WHEELALIGNMENTLEFT];
        
        radius = 300;
        angularSpacing = 18;
        xOffset = 70;
    }else if(type == 1){
        [dialLayout setCellSize:CGSizeMake(260, 50)];
        [dialLayout setWheelType:WHEELALIGNMENTCENTER];
        
        radius = 320;
        angularSpacing = 5;
        xOffset = 124;
    }
    
    [radiusLabel setText:[NSString stringWithFormat:@"Radius: %i", (int)radius]];
    radiusSlider.value = radius/1000;
    [dialLayout setDialRadius:radius];
    
    [angularSpacingLabel setText:[NSString stringWithFormat:@"Angular spacing: %i", (int)angularSpacing]];
    angularSpacingSlider.value = angularSpacing / 90;
    [dialLayout setAngularSpacing:angularSpacing];
    
    [xOffsetLabel setText:[NSString stringWithFormat:@"X offset: %i", (int)xOffset]];
    xOffsetSlider.value = xOffset/320;
    [dialLayout setXOffset:xOffset];
    
    
    [collectionView reloadData];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.items.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    if(type == 0){
        cell = [cv dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    }else{
        cell = [cv dequeueReusableCellWithReuseIdentifier:cellId2 forIndexPath:indexPath];
    }
    
    NSDictionary *item = [self.items objectAtIndex:indexPath.item];
    
    NSString *playerName = [item valueForKey:@"username"];
    UILabel *nameLabel = (UILabel*)[cell viewWithTag:101];
    [nameLabel setText:playerName];
    

    NSString *pm = [NSString stringWithFormat:@"%@",[item valueForKey:@"pm"]];
    

    UILabel *pmlb = (UILabel*)[cell viewWithTag:99];
    [pmlb setText:pm];
    

        UIView *borderView = [cell viewWithTag:102];
        
        borderView.layer.borderWidth = 1;

        NSString *imgURL = [item valueForKey:@"photo"];
        UIImageView *imgView = (UIImageView*)[cell viewWithTag:100];
        [imgView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://bcs.duapp.com/taupst/photo/%@",imgURL]]];

    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"didEndDisplayingCell:%i", (int)indexPath.item);
}


#pragma mark - UICollectionViewDelegate methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(240, 100);
}


- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0 , 0, 0, 0);
}

- (unsigned int)intFromHexString:(NSString *)hexStr
{
    unsigned int hexInt = 0;
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    return hexInt;
}

-(UIColor*)colorFromHex:(NSString*)hexString{
    unsigned int hexint = [self intFromHexString:hexString];
    
    // Create color object, specifying alpha as well
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:1];
    
    return color;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
