//
// UICollectionView with openFrameworks example.
//  Created by Clay Ewing on 7/28/13.
//
//
#include "testApp.h"

//we'll use this to control what's shown on the screen.  with oF, you can just hide and unhide these views.
collectionViewController *collectionView;

//--------------------------------------------------------------
void testApp::setup(){	
	//iPhoneAlerts will be sent to this.
	ofxiPhoneAlerts.addListener(this);
    
    //we initialize the nib with the file (collectionViewController.xib) sans extension
    collectionView = [[collectionViewController alloc] initWithNibName:@"collectionViewController" bundle:nil];

    //then we add our new view as a subview. i like to think of it like a deck of cards.
    [ofxiPhoneGetGLView() addSubview:collectionView.view];

}

//--------------------------------------------------------------
/*
    we'll call this function inside the collectionViewController.  using c++ and objective c, there can be a lot of back and 
    forth with NS data types and standard. i'm choosing to convert it in testApp to keep the other file more objective c
    oriented.
 
*/
void testApp::changeTrack(NSString *filename) {
    track.loadSound(ofxNSStringToString(filename));
    track.play();
}

//--------------------------------------------------------------
void testApp::update(){
}

//--------------------------------------------------------------
void testApp::draw(){
    //yes, this example is using openframeworks yet doesn't put anything on the screen using oF.
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}
