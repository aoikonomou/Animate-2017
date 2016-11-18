package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent; //for button events?


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
			
			
		}


		function dragIcon(event: MouseEvent): void {
			event.currentTarget.startDrag();
		}




		function fl_ReleaseToDrop(event: MouseEvent): void {
			event.target.stopDrag();
		}

	}

}




/* Click to Play/Stop Sound
Clicking on the symbol instance plays the specified sound.
Clicking on the symbol instance a second time stops the sound.

Instructions:
1. Replace "http://www.helpexamples.com/flash/sound/song1.mp3" below with the desired URL address of your sound file. Keep the quotation marks ("").
*/

//instance_name_here.addEventListener(MouseEvent.CLICK, fl_ClickToPlayStopSound);

//var fl_SC:SoundChannel;

////This variable keeps track of whether you want to play or stop the sound
//var fl_ToPlay:Boolean = true;

//function fl_ClickToPlayStopSound(evt:MouseEvent):void
//{
//	if(fl_ToPlay)
//	{
//		var s:Sound = new Sound(new URLRequest("http://www.helpexamples.com/flash/sound/song1.mp3"));
//		fl_SC = s.play();
//	}
//	else
//	{
//		fl_SC.stop();
//	}
//	fl_ToPlay = !fl_ToPlay;
//}



