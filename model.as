package {

	import flash.display.MovieClip; // For being able to control sprites or icons on the screen
	import flash.events.MouseEvent; //For listenting to mouse presses
	import flash.events.Event; // For knowing when time or frames are passing
	import flash.media.Sound; // For playing sound
	import flash.media.SoundChannel; // For stopping sound

	public class model {


		// Prepare the system to play sounds when the right events happen
		var soundChannel1: SoundChannel = new SoundChannel(); // You need a sound channel variable. Create it like this
		var tadaInst: Sound = new tada(); // You need code access to your tada sound asset
		var ohInst: Sound = new oh(); // Same for the "oh" sound

		// Keep an ear on whether sound is playing or not
		var soundPlayingEgg: int = 0;
		var soundPlayingBacon: int = 0;

		// Keep an eye on whether a message has been printed or not

		var ommelleteMsgTracker: int = 0;
		var baconMsgTracker: int = 0;

		public function model() {
			// Nothing to happen here when this class is instantiated

		}

	}

}