package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent; //for mouse events
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import model;

	public class HCIPlayground extends MovieClip {

		var modelInst = new model(); // The model class that holds the game's data is instantiated
		// Main function

		public function HCIPlayground() {


			startButton.addEventListener(MouseEvent.CLICK, navigateToMainScene);
			stage.addEventListener(MouseEvent.MOUSE_UP, fl_ReleaseToDrop);

		}

		// Main scene and associated interaction setup code

		function navigateToMainScene(event: MouseEvent): void {

			trace("Mouse clicked");
			gotoAndStop(1, "MainScene");
			eggInst.addEventListener(MouseEvent.MOUSE_DOWN, dragIcon);
			fryingPanInst.addEventListener(MouseEvent.MOUSE_DOWN, dragIcon);
			hamsterInst.addEventListener(MouseEvent.MOUSE_DOWN, dragIcon);
			stage.addEventListener(Event.ENTER_FRAME, fl_EnterFrameHandler);

			finishButtonInst.addEventListener(MouseEvent.CLICK, navigateToEndScene);


		}

		// Code relating to main Scene

		function dragIcon(event: MouseEvent): void {
			event.currentTarget.startDrag();
		}


		function fl_ReleaseToDrop(event: MouseEvent): void {
			event.target.stopDrag();
		}


		function fl_EnterFrameHandler(event: Event): void {

			//trace("Entered frame");

			if (eggInst.hitTestObject(fryingPanInst) == true) {

				if (modelInst.ommelleteMsgTracker < 1) {
					trace("Omellete on its way...");
					modelInst.ommelleteMsgTracker = 1;
				}

				if (modelInst.soundPlayingEgg == 0) {
					modelInst.tadaInst.play();

					modelInst.soundPlayingEgg = 1;
				}

			
			} else {

				modelInst.ommelleteMsgTracker = 0;
				modelInst.soundPlayingEgg = 0;

			}

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

		function soundComplete(): void {
			modelInst.soundPlaying = 0;

		}

		function navigateToEndScene(event: MouseEvent): void {

			stage.removeEventListener(Event.ENTER_FRAME,fl_EnterFrameHandler);
			gotoAndStop(1, "EndScene");

		}

	}

}