import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxObject;
import nme.Assets;

class Crosshairs extends FlxSprite {
    public var walkSpeed:Float = 2;
    public function new(x:Float, y:Float) {
        super(x, y);
        loadGraphic(Assets.getBitmapData("assets/images/crosshairs.png"), true);
        addAnimation("cursor", [0,0,0,0,0,0,0,0,0,1], 10);
        play("cursor");
        offset.x = 4;
        offset.y = 4;
    }

    override public function update() {
        x = FlxG.mouse.x;
        y = FlxG.mouse.y;
    }
}

