import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxObject;
import org.flixel.FlxTimer;
import nme.Assets;
import motion.Actuate;

class PotatoMonster extends FlxSprite {
    public var curRow:Int = 0;
    public var destRow:Int = 0; // where the potato is to be thrown
    public var movementDuration:Float = 2.0;
    public var recursionDepth = 0;
    public function new() {
        super(PlayState.MONSTER_XCOORD, 200);
        loadGraphic("assets/images/potato-monster.png", true);
        addAnimation("standing", [0,0,0,0,0,0,0,1], 10);
        play("standing");

        offset.x = 6;
        offset.y = 4;
        width = 18;
        height = 24;

        moveAndThrow();

    }

    public function moveAndThrow() {
        // Make sure we haven't lost
        var allDead = true;
        for (i in 0 ... PlayState.ROW_COUNT) {
            if (!cast(PlayState.victims.members[i], Victim).isDead) {
                allDead = false;
            }
        }
        if (allDead) {
            cast(FlxG.state, PlayState).gameOver();
            return;
        }

        do {
            destRow = Std.random(PlayState.ROW_COUNT);
        } while (cast(PlayState.victims.members[destRow], Victim).isDead);

        curRow = Std.random(PlayState.ROW_COUNT);
        Actuate.tween(this, movementDuration, {
            x: PlayState.MONSTER_XCOORD,
            y: curRow * PlayState.ROW_HEIGHT + PlayState.TOP_BAR_HEIGHT
        }).onComplete(function () {
            PlayState.potatoManager.fire(curRow, destRow);
            recursionDepth++;
            moveAndThrow();
            movementDuration -= 0.01;
        });
    }

    override public function update() {
        //PlayState.potatoManager.fire();

        super.update();
    }
}
