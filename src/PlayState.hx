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
    public static inline var LEFT_BURNING_BOUNDARY:Int = 100;
    public static inline var RIGHT_BURNING_BOUNDARY:Int = 300;
    public static inline var TOP_BURNING_BOUNDARY:Int = 25;
    public static inline var BOTTOM_BURNING_BOUNDARY:Int = 200;
    public static inline var ROW_HEIGHT:Int = 25;
    public static inline var TOP_BAR_HEIGHT:Int = 25;
    public static inline var VICTIM_XCOORD:Float = 25;
    public static inline var MONSTER_XCOORD:Float = 375;
    public static inline var MAX_POTATO_GIBS:Float = 100;
    public static inline var ROW_COUNT:Int = 8;
    public static var knifeManager:KnifeManager;
    public static var potatoManager:PotatoManager;
    public static var potatoMonster:PotatoMonster;
    public static var burningPotatoesTop:FlxGroup;
    public static var burningPotatoesRest:FlxGroup;
    public static var player:Player;
    public static var scoreDisplay:FlxText;
    public static var score:Int = 0;
    public static var potatoGibEmitter:FlxEmitter;


    public static var victims:FlxGroup;

	override public function create() {
        var cursor:BitmapData = new BitmapData(2, 2, FlxG.RED);
        FlxG.mouse.show(cursor);

        var background = new FlxSprite(0, 0);
        background.loadGraphic("assets/images/background.png");
        add(background);

        scoreDisplay = new FlxText(4, 0, 400, "Score: 0");
        scoreDisplay.setFormat("assets/Boogaloo-Regular.ttf", 16, 0x222222, "left");
        add(scoreDisplay);

        burningPotatoesTop = new FlxGroup();
        add(burningPotatoesTop);

        player = new Player(200, 125);
        add(player);

        burningPotatoesRest = new FlxGroup();
        add(burningPotatoesRest);

        createBurningRingOfPotatoMadness();

        victims = new FlxGroup();
        add(victims);
        for (i in 0 ... ROW_COUNT) {
            var victim = new Victim(i);
            victims.add(victim);
        }

        potatoMonster = new PotatoMonster();
        add(potatoMonster);

        potatoManager = new PotatoManager();
        add(potatoManager);

        potatoGibEmitter = new FlxEmitter(0, 0, 100);
        for (i in 0 ... MAX_POTATO_GIBS) {
            potatoGibEmitter.add(new PotatoGib());
        }
        add(potatoGibEmitter);

        knifeManager = new KnifeManager();
        add(knifeManager);

        var crosshairs = new Crosshairs(FlxG.mouse.x, FlxG.mouse.y);
        add(crosshairs);
	}

    public function createBurningRingOfPotatoMadness() {
        var xPos:Float;
        var yPos:Float;
        var potatoSpacing = 26;

        // top row
        xPos = LEFT_BURNING_BOUNDARY + 20;
        while (xPos < RIGHT_BURNING_BOUNDARY - 20) {
            burningPotatoesTop.add(new BurningPotato(xPos, TOP_BURNING_BOUNDARY - player.height/4));
            xPos += potatoSpacing;
        }
        // bottom row
        xPos = LEFT_BURNING_BOUNDARY + 20;
        while (xPos < RIGHT_BURNING_BOUNDARY - 20) {
            burningPotatoesRest.add(new BurningPotato(xPos, BOTTOM_BURNING_BOUNDARY + player.height));
            xPos += potatoSpacing;
        }
        // left row
        yPos = TOP_BURNING_BOUNDARY + 20;
        while (yPos < BOTTOM_BURNING_BOUNDARY - 20) {
            burningPotatoesRest.add(new BurningPotato(LEFT_BURNING_BOUNDARY - player.width, yPos));
            yPos += potatoSpacing;
        }
        // right row
        yPos = TOP_BURNING_BOUNDARY + 20;
        while (yPos < BOTTOM_BURNING_BOUNDARY - 20) {
            burningPotatoesRest.add(new BurningPotato(RIGHT_BURNING_BOUNDARY + player.width, yPos));
            yPos += potatoSpacing;
        }
    }

	override public function destroy():Void {
		super.destroy();
	}


    override public function update():Void {
        FlxG.collide(knifeManager, potatoManager, function(knife:FlxBasic, potato:FlxBasic) {
            knife.kill();
            potato.kill();
        });
        FlxG.collide(potatoManager, victims, function(potato:FlxBasic, victim:FlxBasic) {
            potato.kill();
            victim.kill();
        });

        var multiplier = 0;
        for (i in 0 ... ROW_COUNT) {
            var victim = cast(victims.members[i], Victim);
            if (victim.multiplier > 0) {
                if (Std.random(16) == 0) {
                    multiplier += victim.multiplier;
                }
            }
        }

        if (FlxG.keys.justPressed("ESCAPE")) {
            gameOver();
        }

        score += multiplier;
        scoreDisplay.text = "Score: " + score;

        super.update();
    }

    public function gameOver() {
        var overlay = new FlxSprite(0, 0);
        overlay.loadGraphic("assets/images/simple-gameover.png");
        overlay.alpha = 0.0;
        add(overlay);
        Actuate.tween(overlay, 4, { alpha: 1.0 }).ease(Quad.easeIn);
        makeFlamingPotatoesAttack(burningPotatoesTop);
        makeFlamingPotatoesAttack(burningPotatoesRest);
    }

    public function makeFlamingPotatoesAttack(potatoGroup:FlxGroup) {
        for (i in 0 ... potatoGroup.length) {
            Actuate.tween(potatoGroup.members[i], Math.random() + 3, { x: player.x, y: player.y }).ease(Quad.easeIn);
        }
    }
}
