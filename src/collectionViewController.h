//
//  collectionViewController.h
//  CollectionViewExample
//
//  Created by Clay Ewing on 7/28/13.
//
//

#import <UIKit/UIKit.h>

#import "testApp.h"

//we want this file to be the delegate for the UICollectionView, here's how that looks...

@interface collectionViewController : UIViewController <UICollectionViewDelegate> {
}

//create some properties for us to connect within interface builder and access in collectionViewController.mm
@property (retain, nonatomic) IBOutlet UICollectionView *trackSelection;
@property (nonatomic, strong) NSArray *tracks;

@end

