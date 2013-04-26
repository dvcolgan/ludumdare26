import org.flixel.FlxGroup;

class PotatoManager extends FlxGroup {
    public static inline var MAX_POTATOES = 100;
    public function new() {
        super(MAX_POTATOES);
        for (i in 0 ... MAX_POTATOES) {
            add(new Potato());
        }
    }

    public function fire(startRow, destRow) {
        if (getFirstAvailable() != null) {
            cast(getFirstAvailable(), Potato).fire(startRow, destRow);
        }
    }
}


