package ;

#if !flash
import sys.io.File;
#else
import nme.Assets;
#end
import tjson.TJSON;

class JSONConfig {
    // Don't change the order of the things in this array or it will break save games
    public static var configFiles = [
        "assets/items/axe.json",
        "assets/items/tree.json",
        "assets/items/weed.json",
        "assets/items/wall.json",
        "assets/items/wall-blueprint.json",
        "assets/items/floor-blueprint.json"
    ];

    private static var cache:Hash<Dynamic> = {
        new Hash<Dynamic>();
    };

    private var json:Dynamic;
    private static inline var jsonRoot:String = "../../../../";
    public var configPath:String = "";

    public function new(?jsonPath:String="") {
        if (jsonPath != "") {
            configPath = jsonPath;
            if (cache.exists(jsonPath)) {
                json = cache.get(jsonPath);
            }
            else {
                #if flash
                json = TJSON.parse(Assets.getText(jsonPath));
                #else
                json = TJSON.parse(File.getContent(jsonRoot + jsonPath));
                #end
                cache.set(jsonPath, json);
            }
        }
    }

    public function getInt(field:String):Int { 
        return cast(Reflect.field(json, field), Int);
    }
    public function getBool(field:String):Bool { 
        return cast(Reflect.field(json, field), Bool);
    }
    public function getFloat(field:String):Float {
        return cast(Reflect.field(json, field), Float);
    }
    public function getString(field:String):String {
        return cast(Reflect.field(json, field), String);
    }
    public function getArray(field:String):Array<Dynamic> {
        return cast(Reflect.field(json, field), Array<Dynamic>);
    }
    public function getIntArray(field:String):Array<Int> {
        var arr:Array<Int> = Reflect.field(json, field);
        return arr;
    }
    public function getStringArray(field:String):Array<String> {
        var arr:Array<String> = Reflect.field(json, field);
        return arr;
    }
    public function getObjectArray(field:String):Array<JSONConfig> {
        var arr = new Array<JSONConfig>();
        var oldArr:Array<Dynamic> = Reflect.field(json, field);
        if (oldArr == null) {
            return [];
        }
        for (obj in oldArr) {
            var subObj = new JSONConfig();
            subObj.json = obj;
            arr.push(subObj);
        }
        return arr;
    }

    public function getObject(field:String):JSONConfig {
        var obj = new JSONConfig();
        obj.json = Reflect.field(json, field);
        return obj;
    }
}
