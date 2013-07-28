//
//  collectionViewController.m
//  CollectionViewExample
//
//  Created by Clay Ewing on 7/28/13.
//
//

#import "collectionViewController.h"
testApp *myApp;

@interface collectionViewController ()

@end

@implementation collectionViewController
@synthesize tracks, trackSelection;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //let's get access to what's going on in testApp
    myApp = (testApp*)ofGetAppPtr();
    
    //the cell prototype for the collectionview is in another nib, we have to register it otherwise the gods will be angry
    [trackSelection registerNib:[UINib nibWithNibName:@"collectionCell" bundle:nil] forCellWithReuseIdentifier:@"track"];
    
    //this slice of code gives us all of the caf files in our sandbox.  we'll use it to make an array of sounds we can scroll through and play
    NSString *bundleRoot = [[NSBundle mainBundle] bundlePath];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *dirContents = [fm contentsOfDirectoryAtPath:bundleRoot error:nil];
    NSPredicate *fltr = [NSPredicate predicateWithFormat:@"self ENDSWITH '.caf'"];
    
    //actually assign the contents to the array
    tracks = [[dirContents filteredArrayUsingPredicate:fltr] retain];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //just tell the collection view how many tracks we've got
    return [tracks count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //this is where we say "use that cell as a prototype, and here's the stuff I want to throw in there"
    static NSString *identifier = @"track";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //in the interface builder in the collectionCell.xib, I set the tag value of the label to 100 so I can identify it here
    UILabel *trackLabel = (UILabel *)[cell viewWithTag:100];

    //now that we've found it, I can set the value to the filename of our sound file
    [trackLabel setText:[tracks objectAtIndex:indexPath.row]];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //when we click on the item, we reach into testApp and run the changeTrack function
    myApp->changeTrack([tracks objectAtIndex:indexPath.row]);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTrackSelection:nil];
    [super viewDidUnload];
}
@end
