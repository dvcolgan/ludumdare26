import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxObject;
import nme.Assets;

class Player extends FlxSprite {
    public var walkSpeed:Float = 1.2;
    public function new(x:Float, y:Float) {
        super(x, y);
        loadGraphic(Assets.getBitmapData("assets/images/ninja.png"), true, true);
        addAnimation("standing", [0], 10);
        addAnimation("walking", [1,0], 10);
    }

    override public function update() {
        var up = (FlxG.keys.UP || FlxG.keys.W || FlxG.keys.COMMA);
        var left = (FlxG.keys.LEFT || FlxG.keys.A);
        var down = (FlxG.keys.DOWN || FlxG.keys.S || FlxG.keys.O);
        var right = (FlxG.keys.RIGHT || FlxG.keys.D || FlxG.keys.E); 

        if (left) {
            x -= walkSpeed;
            play("walking");
        }
        if (right) {
            x += walkSpeed;
            play("walking");
        }
        if (up) {
            y -= walkSpeed;
            play("walking");
        }
        if (down) {
            y += walkSpeed;
            play("walking");
        }
        if (!left && !right && !up && !down) {
            play("standing");
        }
        if (x < PlayState.LEFT_BURNING_BOUNDARY) x = PlayState.LEFT_BURNING_BOUNDARY;
        if (x > PlayState.RIGHT_BURNING_BOUNDARY) x = PlayState.RIGHT_BURNING_BOUNDARY;
        if (y < PlayState.TOP_BURNING_BOUNDARY) y = PlayState.TOP_BURNING_BOUNDARY;
        if (y > PlayState.BOTTOM_BURNING_BOUNDARY) y = PlayState.BOTTOM_BURNING_BOUNDARY;

        if (FlxG.mouse.justPressed()) {
            PlayState.knifeManager.fire(x, y);
        }

        if (FlxG.mouse.x < x) facing = FlxObject.LEFT;
        if (FlxG.mouse.x > x) facing = FlxObject.RIGHT;

        super.update();
    }
}
