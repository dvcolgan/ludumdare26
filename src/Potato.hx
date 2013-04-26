import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxObject;
import nme.Assets;

class Potato extends FlxSprite {
    public var throwSpeed:Float = 200;
    public function new() {
        super(x, y);
        // At some point optimize this
        loadGraphic("assets/images/potato.png");

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

    public function fire(startRow, destRow) {
        x = PlayState.MONSTER_XCOORD + 8;
        y = startRow * PlayState.ROW_HEIGHT + PlayState.TOP_BAR_HEIGHT;
        var xDiff = PlayState.VICTIM_XCOORD - x;
        var yDiff = (destRow * PlayState.ROW_HEIGHT + PlayState.TOP_BAR_HEIGHT) - y;
        var a = Math.atan2(yDiff, xDiff);

        velocity.x = Math.cos(a) * throwSpeed;
        velocity.y = Math.sin(a) * throwSpeed;

        angle = 180 / Math.PI * a;
        angle += 180;
        exists = true;
        throwSpeed++;
    }

    override public function kill() {
        super.kill();
        PlayState.potatoGibEmitter.x = x;
        PlayState.potatoGibEmitter.y = y;
        PlayState.potatoGibEmitter.start(true, 5, 0, 7);
    }
}
