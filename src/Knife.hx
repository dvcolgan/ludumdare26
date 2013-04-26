import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxObject;
import nme.Assets;

class Knife extends FlxSprite {
    public var throwSpeed:Float = 200;
    public function new() {
        super(x, y);
        // At some point optimize this
        loadGraphic("assets/images/knife.png");

        exists = false;
    }

    override public function update() {
        super.update();

        if (exists) {
            if (x < -width || y < -height || x > FlxG.width || y > FlxG.height) {
                exists = false;
            }
        }
    }

    public function fire(spawnX, spawnY) {
        x = spawnX;
        y = spawnY;
        var xDiff = FlxG.mouse.x - x;
        var yDiff = FlxG.mouse.y - y;
        var a = Math.atan2(yDiff, xDiff);

        velocity.x = Math.cos(a) * throwSpeed;
        velocity.y = Math.sin(a) * throwSpeed;

        angle = 180 / Math.PI * a;
        exists = true;
    }
}
