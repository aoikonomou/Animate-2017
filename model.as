package {


	import flash.display.MovieClip;
	import flash.events.MouseEvent; //for mouse events
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;

	public class model {


		// Prepare the system to play sounds when the right events happen
		var soundChannel1: SoundChannel = new SoundChannel(); // You need a sound channel variable. Create it like this
		var tadaInst: Sound = new tada();
		var ohInst: Sound = new oh();
		
		// Keep an ear on whether sound is playing or not
		var soundPlayingEgg:int =0;
		var soundPlayingBacon:int =0;
		
		// Keep an eye on whether a message has been printed or not
		
		var ommelleteMsgTracker:int =0;
		var baconMsgTracker:int =0;
		



		public function model() {
			// constructor code




		}

	}

}