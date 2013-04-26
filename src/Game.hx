package;

import org.flixel.FlxGame;
import nme.Lib;

class Game extends FlxGame {

    public function new() {
        super(Std.int(Lib.current.stage.stageWidth/2), Std.int(Lib.current.stage.stageHeight/2), MenuState, 2);
    }
}
