package;

import nme.Assets;
import nme.Lib;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import nme.display.BitmapData;

import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;
import org.flixel.FlxAssets;
import org.flixel.FlxTilemap;
import org.flixel.FlxGroup;
import org.flixel.FlxObject;
import org.flixel.FlxRect;
import org.flixel.FlxPoint;
import org.flixel.FlxBasic;
import org.flixel.FlxSave;
import org.flixel.system.input.FlxMouse;
import org.flixel.FlxEmitter;

import motion.Actuate;
import motion.easing.Quad;

class PlayState extends FlxState {

	override public function create() {
        //var cursor:BitmapData = new BitmapData(2, 2, FlxG.RED);
        //FlxG.mouse.show(cursor);

        var background = new FlxSprite(0, 0);
        background.loadGraphic("assets/images/background.png");
        add(background);

        scoreDisplay = new FlxText(4, 0, 400, "Score: 0");
        scoreDisplay.setFormat("assets/font.ttf", 16, 0x222222, "left");
        add(scoreDisplay);

        burningPotatoesTop = new FlxGroup();
        add(burningPotatoesTop);

        player = new Player(200, 125);
        add(player);

        burningPotatoesRest = new FlxGroup();
        add(burningPotatoesRest);

        gibEmitter = new FlxEmitter(0, 0, 100);
        for (i in 0 ... MAX_GIBS) {
            gibEmitter.add(new Gib());
        }
        add(gibEmitter);

        bulletManager = new BulletManager();
        add(bulletManager);

        var crosshairs = new Crosshairs(FlxG.mouse.x, FlxG.mouse.y);
        add(crosshairs);
	}

	override public function destroy():Void {
		super.destroy();
	}


    override public function update():Void {
        scoreDisplay.text = "Score: " + score;

        super.update();
    }
}
