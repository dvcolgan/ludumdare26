package;

import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxSprite;

class MenuState extends FlxState 
{
    override public function create():Void 
    {
        var overlay = new FlxSprite(0, 0);
        overlay.loadGraphic("assets/images/title-screen.png");
        add(overlay);
    }

    override public function update():Void 
    {
        super.update();

        if (FlxG.keys.ENTER || FlxG.keys.SPACE) 
        {
            FlxG.switchState(new PlayState());
        }
    }

    override public function destroy():Void 
    {
        super.destroy();
    }
}
