import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxObject;
import nme.Assets;

class Victim extends FlxSprite {
    //TODO make everyone do the harlem shake after inputting the konami code
    public var walkSpeed:Float = 1.2;
    public var multiplier:Int = 1;
    public var isDead:Bool = false;
    public var row:Int;
    public function new(row:Int) {
        this.row = row;
        super(PlayState.VICTIM_XCOORD, row * PlayState.ROW_HEIGHT + PlayState.TOP_BAR_HEIGHT);
        loadGraphic("assets/images/victim" + row + ".png", true, true);
        addAnimation("yelling", [0,1], 10);
        addAnimation("dying", [2,3,2,3,2,3,2,3,2,3,2,3], 10, false);
        addAnimation("dead", [4,4,4,4,4,4,4,4,5], 10);
        play("yelling");

        addAnimationCallback(dyingCallback);
    }

    public function dyingCallback (name, frame, index) {
        if (finished && name == "dying") {
            play("dead");
        }
    }

    override public function update() {
        super.update();
        if (x < 0) {
            x = 0;
            acceleration.x = 0;
            velocity.x = 0;
        }
    }

    override public function kill() {
        play("dying");
        multiplier = 0;
        isDead = true;
    }
}
