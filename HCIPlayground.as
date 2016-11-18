package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent; //for mouse events
	import flash.events.Event;


	public class HCIPlayground extends MovieClip {


		public function HCIPlayground() {

			startButton.addEventListener(MouseEvent.CLICK, navigateToMainScene);
			stage.addEventListener(MouseEvent.MOUSE_UP, fl_ReleaseToDrop);


		}


		function navigateToMainScene(event: MouseEvent): void {

			trace("Mouse clicked");
			gotoAndStop(1, "MainScene");
			eggInst.addEventListener(MouseEvent.MOUSE_DOWN, dragIcon);
			fryingPanInst.addEventListener(MouseEvent.MOUSE_DOWN, dragIcon);
			hamsterInst.addEventListener(MouseEvent.MOUSE_DOWN, dragIcon);
			stage.addEventListener(Event.ENTER_FRAME, fl_EnterFrameHandler);
			
			


		}


		function dragIcon(event: MouseEvent): void {
			event.currentTarget.startDrag();
		}


		function fl_ReleaseToDrop(event: MouseEvent): void {
			event.target.stopDrag();
		}


		function fl_EnterFrameHandler(event: Event): void {
			
			//trace("Entered frame");
			
			if(eggInst.hitTestObject(fryingPanInst)==true){
				
				trace("Omellete on its way...");
				
				}
				
				if(hamsterInst.hitTestObject(fryingPanInst)==true){
				
				trace("Bacon on its way...");
				
				}
			
		}


	}

}


