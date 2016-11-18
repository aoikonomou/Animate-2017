package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent; //for mouse events
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;

	public class HCIPlayground extends MovieClip {

		// Main function and initial Scene

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

				trace("Omellete on its way...");

				// Prepare the system to play sounds when the right events happen
				var soundChannel1: SoundChannel = new SoundChannel(); // You need a sound channel variable. Create it like this
				var tadaInst: Sound = new tada();

				tadaInst.play();

			}

			if (hamsterInst.hitTestObject(fryingPanInst) == true) {

				trace("Bacon on its way...");

				//var soundChannel1: SoundChannel = new SoundChannel(); // You need a sound channel variable. Create it like this
				var ohInst: Sound = new oh();

				ohInst.play();

			}

		}

		function navigateToEndScene(event: MouseEvent): void {

			gotoAndStop(1, "EndScene");

		}

	}

}