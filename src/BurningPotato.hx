import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxObject;
import nme.Assets;

class BurningPotato extends FlxGroup {
    public var x(get_x, set_x):Float;
    public var y(get_y, set_y):Float;
    public function get_x() { return potato.x; }
    public function get_y() { return potato.y; }
    public function set_x(x) { setAll("x", x); return potato.x; }
    public function set_y(y) { setAll("y", y); return potato.y; }

    public var potato:FlxSprite;

    public function new(x:Float, y:Float) {
        super();
        // At some point optimize this
        potato = new FlxSprite(x, y);
        x += Std.random(6)-3;
        y += Std.random(6)-3;
        potato.loadGraphic("assets/images/burnt-potato.png");
        add(potato);

        var fire1 = new FlxSprite(x + (2 + (Std.random(6)-3)), y - (10 - (Std.random(4))));
        fire1.loadGraphic("assets/images/fire.png", true);
        fire1.addAnimation("burn", [0,1,0,2], 10);
        fire1.play("burn");
        add(fire1);
        var fire2 = new FlxSprite(x + (10 + (Std.random(6)-3)), y - (10 - (Std.random(4))));
        fire2.loadGraphic("assets/images/fire.png", true);
        fire2.addAnimation("burn", [0,1,0,2], 10);
        fire2.play("burn");
        add(fire2);
    }
}
