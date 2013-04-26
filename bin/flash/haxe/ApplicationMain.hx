#if nme

import Main;
import nme.Assets;
import nme.events.Event;


class ApplicationMain {
	
	static var mPreloader:NMEPreloader;

	public static function main () {
		
		var call_real = true;
		
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		
		nme.Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
		nme.Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		
		if (loaded < total || true) /* Always wait for event */ {
			
			call_real = false;
			mPreloader = new org.flixel.system.FlxPreloader();
			nme.Lib.current.addChild(mPreloader);
			mPreloader.onInit();
			mPreloader.onUpdate(loaded,total);
			nme.Lib.current.addEventListener (nme.events.Event.ENTER_FRAME, onEnter);
			
		}
		
		
		#if !fdb
		haxe.Log.trace = flashTrace;
		#end
		
		if (call_real)
			begin ();
	}

	#if !fdb
	private static function flashTrace( v : Dynamic, ?pos : haxe.PosInfos ) {
		var className = pos.className.substr(pos.className.lastIndexOf('.') + 1);
		var message = className+"::"+pos.methodName+":"+pos.lineNumber+": " + v;
		
        if (flash.external.ExternalInterface.available)
			flash.external.ExternalInterface.call("console.log", message);
		else untyped flash.Boot.__trace(v, pos);
    }
	#end
	
	private static function begin () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(Main, []);
			if (Std.is (instance, nme.display.DisplayObject)) {
				nme.Lib.current.addChild(cast instance);
			}	
		}
		
	}

	static function onEnter (_) {
		
		var loaded = nme.Lib.current.loaderInfo.bytesLoaded;
		var total = nme.Lib.current.loaderInfo.bytesTotal;
		mPreloader.onUpdate(loaded,total);
		
		if (loaded >= total) {
			
			nme.Lib.current.removeEventListener(nme.events.Event.ENTER_FRAME, onEnter);
			mPreloader.addEventListener (Event.COMPLETE, preloader_onComplete);
			mPreloader.onLoaded();
			
		}
		
	}

	public static function getAsset (inName:String):Dynamic {
		
		
		if (inName=="assets/Boogaloo-Regular.ttf")
			 
			 return Assets.getFont ("assets/Boogaloo-Regular.ttf");
		 
		
		if (inName=="assets/data/autotiles.png")
			 
            return Assets.getBitmapData ("assets/data/autotiles.png");
         
		
		if (inName=="assets/data/autotiles_alt.png")
			 
            return Assets.getBitmapData ("assets/data/autotiles_alt.png");
         
		
		if (inName=="assets/data/base.png")
			 
            return Assets.getBitmapData ("assets/data/base.png");
         
		
		if (inName=="assets/data/beep.mp3")
			 
            return Assets.getSound ("assets/data/beep.mp3");
		 
		
		if (inName=="assets/data/beep.wav")
			 
            return Assets.getSound ("assets/data/beep.wav");
         
		
		if (inName=="assets/data/button.png")
			 
            return Assets.getBitmapData ("assets/data/button.png");
         
		
		if (inName=="assets/data/button_a.png")
			 
            return Assets.getBitmapData ("assets/data/button_a.png");
         
		
		if (inName=="assets/data/button_b.png")
			 
            return Assets.getBitmapData ("assets/data/button_b.png");
         
		
		if (inName=="assets/data/button_c.png")
			 
            return Assets.getBitmapData ("assets/data/button_c.png");
         
		
		if (inName=="assets/data/button_down.png")
			 
            return Assets.getBitmapData ("assets/data/button_down.png");
         
		
		if (inName=="assets/data/button_left.png")
			 
            return Assets.getBitmapData ("assets/data/button_left.png");
         
		
		if (inName=="assets/data/button_right.png")
			 
            return Assets.getBitmapData ("assets/data/button_right.png");
         
		
		if (inName=="assets/data/button_up.png")
			 
            return Assets.getBitmapData ("assets/data/button_up.png");
         
		
		if (inName=="assets/data/button_x.png")
			 
            return Assets.getBitmapData ("assets/data/button_x.png");
         
		
		if (inName=="assets/data/button_y.png")
			 
            return Assets.getBitmapData ("assets/data/button_y.png");
         
		
		if (inName=="assets/data/courier.ttf")
			 
			 return Assets.getFont ("assets/data/courier.ttf");
		 
		
		if (inName=="assets/data/cursor.png")
			 
            return Assets.getBitmapData ("assets/data/cursor.png");
         
		
		if (inName=="assets/data/default.png")
			 
            return Assets.getBitmapData ("assets/data/default.png");
         
		
		if (inName=="assets/data/fontData10pt.png")
			 
            return Assets.getBitmapData ("assets/data/fontData10pt.png");
         
		
		if (inName=="assets/data/fontData11pt.png")
			 
            return Assets.getBitmapData ("assets/data/fontData11pt.png");
         
		
		if (inName=="assets/data/handle.png")
			 
            return Assets.getBitmapData ("assets/data/handle.png");
         
		
		if (inName=="assets/data/logo.png")
			 
            return Assets.getBitmapData ("assets/data/logo.png");
         
		
		if (inName=="assets/data/logo_corners.png")
			 
            return Assets.getBitmapData ("assets/data/logo_corners.png");
         
		
		if (inName=="assets/data/logo_light.png")
			 
            return Assets.getBitmapData ("assets/data/logo_light.png");
         
		
		if (inName=="assets/data/nokiafc22.ttf")
			 
			 return Assets.getFont ("assets/data/nokiafc22.ttf");
		 
		
		if (inName=="assets/data/stick.png")
			 
            return Assets.getBitmapData ("assets/data/stick.png");
         
		
		if (inName=="assets/data/vcr/flixel.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/flixel.png");
         
		
		if (inName=="assets/data/vcr/open.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/open.png");
         
		
		if (inName=="assets/data/vcr/pause.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/pause.png");
         
		
		if (inName=="assets/data/vcr/play.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/play.png");
         
		
		if (inName=="assets/data/vcr/record_off.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/record_off.png");
         
		
		if (inName=="assets/data/vcr/record_on.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/record_on.png");
         
		
		if (inName=="assets/data/vcr/restart.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/restart.png");
         
		
		if (inName=="assets/data/vcr/step.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/step.png");
         
		
		if (inName=="assets/data/vcr/stop.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/stop.png");
         
		
		if (inName=="assets/data/vis/bounds.png")
			 
            return Assets.getBitmapData ("assets/data/vis/bounds.png");
         
		
		if (inName=="assets/images/background.pdn")
			 
            return Assets.getBytes ("assets/images/background.pdn");
         
		
		if (inName=="assets/images/background.png")
			 
            return Assets.getBitmapData ("assets/images/background.png");
         
		
		if (inName=="assets/images/burnt-potato.png")
			 
            return Assets.getBitmapData ("assets/images/burnt-potato.png");
         
		
		if (inName=="assets/images/crosshairs.png")
			 
            return Assets.getBitmapData ("assets/images/crosshairs.png");
         
		
		if (inName=="assets/images/fire.png")
			 
            return Assets.getBitmapData ("assets/images/fire.png");
         
		
		if (inName=="assets/images/game-over.pdn")
			 
            return Assets.getBytes ("assets/images/game-over.pdn");
         
		
		if (inName=="assets/images/game-over.png")
			 
            return Assets.getBitmapData ("assets/images/game-over.png");
         
		
		if (inName=="assets/images/inanimate-potato.png")
			 
            return Assets.getBitmapData ("assets/images/inanimate-potato.png");
         
		
		if (inName=="assets/images/katana.png")
			 
            return Assets.getBitmapData ("assets/images/katana.png");
         
		
		if (inName=="assets/images/knife.png")
			 
            return Assets.getBitmapData ("assets/images/knife.png");
         
		
		if (inName=="assets/images/ninja.png")
			 
            return Assets.getBitmapData ("assets/images/ninja.png");
         
		
		if (inName=="assets/images/potato-gibs.png")
			 
            return Assets.getBitmapData ("assets/images/potato-gibs.png");
         
		
		if (inName=="assets/images/potato-monster.png")
			 
            return Assets.getBitmapData ("assets/images/potato-monster.png");
         
		
		if (inName=="assets/images/potato.png")
			 
            return Assets.getBitmapData ("assets/images/potato.png");
         
		
		if (inName=="assets/images/simple-gameover.png")
			 
            return Assets.getBitmapData ("assets/images/simple-gameover.png");
         
		
		if (inName=="assets/images/title-screen.pdn")
			 
            return Assets.getBytes ("assets/images/title-screen.pdn");
         
		
		if (inName=="assets/images/title-screen.png")
			 
            return Assets.getBitmapData ("assets/images/title-screen.png");
         
		
		if (inName=="assets/images/victim0.png")
			 
            return Assets.getBitmapData ("assets/images/victim0.png");
         
		
		if (inName=="assets/images/victim1.png")
			 
            return Assets.getBitmapData ("assets/images/victim1.png");
         
		
		if (inName=="assets/images/victim2.png")
			 
            return Assets.getBitmapData ("assets/images/victim2.png");
         
		
		if (inName=="assets/images/victim3.png")
			 
            return Assets.getBitmapData ("assets/images/victim3.png");
         
		
		if (inName=="assets/images/victim4.png")
			 
            return Assets.getBitmapData ("assets/images/victim4.png");
         
		
		if (inName=="assets/images/victim5.png")
			 
            return Assets.getBitmapData ("assets/images/victim5.png");
         
		
		if (inName=="assets/images/victim6.png")
			 
            return Assets.getBitmapData ("assets/images/victim6.png");
         
		
		if (inName=="assets/images/victim7.png")
			 
            return Assets.getBitmapData ("assets/images/victim7.png");
         
		
		
		return null;
		
	}
	
	
	private static function preloader_onComplete (event:Event):Void {
		
		mPreloader.removeEventListener (Event.COMPLETE, preloader_onComplete);
		
		nme.Lib.current.removeChild(mPreloader);
		mPreloader = null;
		
		begin ();
		
	}
	
}

class NME_assets_boogaloo_regular_ttf extends nme.text.Font { }
class NME_assets_data_autotiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_autotiles_alt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_base_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_beep_mp3 extends nme.media.Sound { }
class NME_assets_data_beep_wav extends nme.media.Sound { }
class NME_assets_data_button_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_a_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_b_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_c_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_left_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_right_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_x_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_y_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_courier_ttf extends nme.text.Font { }
class NME_assets_data_cursor_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_default_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata10pt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata11pt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_handle_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_corners_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_light_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_nokiafc22_ttf extends nme.text.Font { }
class NME_assets_data_stick_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_flixel_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_open_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_pause_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_play_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_off_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_on_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_restart_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_step_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_stop_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vis_bounds_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_background_pdn extends nme.utils.ByteArray { }
class NME_assets_images_background_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_burnt_potato_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_crosshairs_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_fire_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_game_over_pdn extends nme.utils.ByteArray { }
class NME_assets_images_game_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_inanimate_potato_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_katana_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_knife_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_ninja_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_potato_gibs_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_potato_monster_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_potato_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_simple_gameover_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_title_screen_pdn extends nme.utils.ByteArray { }
class NME_assets_images_title_screen_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_victim0_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_victim1_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_victim2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_victim3_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_victim4_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_victim5_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_victim6_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_images_victim7_png extends nme.display.BitmapData { public function new () { super (0, 0); } }


#else

import Main;

class ApplicationMain {
	
	public static function main () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(Main, []);
			if (Std.is (instance, flash.display.DisplayObject)) {
				flash.Lib.current.addChild(cast instance);
			}
		}
		
	}

}

#end
