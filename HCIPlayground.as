package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent; //for button events?


	public class HCIPlayground extends MovieClip {


		public function HCIPlayground() {
			// constructor code

			startButton.addEventListener(MouseEvent.CLICK, fl_MouseClickHandler);


		}



		function fl_MouseClickHandler(event: MouseEvent): void {
			// Start your custom code
			// This example code displays the words "Mouse clicked" in the Output panel.
			trace("Mouse clicked");
			gotoAndStop(1, "MainScene");
			// End your custom code
		}


	}

}