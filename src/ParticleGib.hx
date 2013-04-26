import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxObject;
import org.flixel.FlxParticle;
import nme.Assets;

class ParticleGib extends FlxParticle {
    public function new() {
        super();
        loadGraphic(Assets.getBitmapData("assets/images/gibs.png"), true);
        addAnimation("gib", [0,1,2,3,4,5,6], 0);
        frame = Std.random(7);

        exists = false;
    }
}
