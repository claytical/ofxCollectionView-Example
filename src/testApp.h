#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"

//example specific header includes
#include "ofxOpenALSoundPlayer.h"
#include "collectionViewController.h"

class testApp : public ofxiPhoneApp {
	
    public:
        void setup();
        void update();
        void draw();
        void exit();

        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs &touch);
		
        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
		
    //example specific declarations
        void changeTrack(NSString *filename);
        ofxOpenALSoundPlayer track;
 	
};
