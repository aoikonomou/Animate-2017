package {

	import flash.display.MovieClip; // For being able to control sprites or icons on the screen
	import flash.events.MouseEvent; //For listenting to mouse presses
	import flash.events.Event; // For knowing when time or frames are passing
	import flash.media.Sound; // For playing sound
	import flash.media.SoundChannel; // For stopping sound
	import model; // Custom class holding all our game's data. Loaded from a file in the same directory

	// The main class of our application or game
	public class HCIPlayground extends MovieClip {

		// The model class that holds the game's data is instantiated
		// Code available in that file is now available to the code of the main class as well
		var modelInst = new model();
		
		// Main function. Every main class must have one. This is where our code sets off from
		// The function of this one is to allow us to navigate from the splash scene to the main scene
		public function HCIPlayground() {

			// We begin by listening to a couple of events
			startButtonInst.addEventListener(MouseEvent.CLICK, navigateToMainScene);
			
		}

		// The code in the main function above points to two other functions. We define those here
		
		// This first function below is called when we click "start"
		function navigateToMainScene(event: MouseEvent): void {

			trace("Mouse clicked"); // Debug message on the console
			gotoAndStop(1, "MainScene"); // Sends the program to frame 1 of the main scene
			
			// Let's listen for MOUSE_DOWNs on those icons on the stage...
			eggInst.addEventListener(MouseEvent.MOUSE_DOWN, dragIcon);
			fryingPanInst.addEventListener(MouseEvent.MOUSE_DOWN, dragIcon);
			hamsterInst.addEventListener(MouseEvent.MOUSE_DOWN, dragIcon);
			
			// Let's also listen for any mouse button releases
			stage.addEventListener(MouseEvent.MOUSE_UP, fl_ReleaseToDrop);
			
			// Also, let's keep an eye out at what's happening in the game world on a moment by moment basis
			stage.addEventListener(Event.ENTER_FRAME, fl_EnterFrameHandler);
			
			// Finally, let's listen for a click on the "next" button
			finishButtonInst.addEventListener(MouseEvent.CLICK, navigateToEndScene);
			
		}

		// If we hear a click on any object lets start dragging it with the mouse
		function dragIcon(event: MouseEvent): void {
			event.currentTarget.startDrag();
		}

		// If we hear a MOUSE_UP let's stop dragging whatever we might be dragging around
		function fl_ReleaseToDrop(event: MouseEvent): void {
			event.target.stopDrag();
		}

		// Now, some logic. Let's check if the icons are colliding with each other....
		function fl_EnterFrameHandler(event: Event): void {

			// If the egg is colliding with the frying pan...
			if (eggInst.hitTestObject(fryingPanInst) == true) {

				// If this is the first time the collision happened say so
				if (modelInst.ommelleteMsgTracker < 1) {
					trace("Omellete on its way...");
					
					// Stop the message from repeating whilst the icons are colliding if you said it once already
					modelInst.ommelleteMsgTracker = 1;
				}
				
				// Now, if the items are colliding you need to play the relevant sound...but only once...
				if (modelInst.soundPlayingEgg == 0) {
					modelInst.tadaInst.play();

					modelInst.soundPlayingEgg = 1;
				}

			// If they are not colliding however make sure you keep track of that...and for the sound...
			} else {

				modelInst.ommelleteMsgTracker = 0;
				modelInst.soundPlayingEgg = 0;

			}

			// If the hamster is colliding with the frying pan...
			if (hamsterInst.hitTestObject(fryingPanInst) == true) {

				if (modelInst.baconMsgTracker < 1) {
					trace("Bacon on its way...");
					modelInst.baconMsgTracker = 1;
				}

				if (modelInst.soundPlayingBacon == 0) {
					modelInst.ohInst.play();

					modelInst.soundPlayingBacon = 1;
				}


			} else {

				modelInst.baconMsgTracker = 0;
				modelInst.soundPlayingBacon = 0;

			}


		}

		
		// Finally, this function reacts to clicking the "End" button
		function navigateToEndScene(event: MouseEvent): void {

			// First, stop listening for mouse clicks cause we have finished
			stage.removeEventListener(Event.ENTER_FRAME,fl_EnterFrameHandler);
			// Then, go to the first frame of the last scene
			gotoAndStop(1, "EndScene");

		}

	}

}