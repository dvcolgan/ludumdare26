import org.flixel.FlxGroup;

class KnifeManager extends FlxGroup {
    public static inline var MAX_KNIVES = 40;
    public function new() {
        super(MAX_KNIVES);
        for (i in 0 ... MAX_KNIVES) {
            add(new Knife());
        }
    }

    public function fire(spawnX, spawnY) {
        if (getFirstAvailable() != null) {
            cast(getFirstAvailable(), Knife).fire(spawnX, spawnY);
        }
    }
}

