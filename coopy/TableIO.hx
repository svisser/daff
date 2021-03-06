// -*- mode:java; tab-width:4; c-basic-offset:4; indent-tabs-mode:nil -*-

#if !TOPLEVEL
package coopy;
#end

@:expose
class TableIO {
    public function new() {
    }

    public function getContent(name: String) : String {
#if coopyhx_util
        return sys.io.File.getContent(name);
#else
        return "";
#end
    }

    public function saveContent(name: String, txt: String) : Bool {
#if coopyhx_util
        sys.io.File.saveContent(name,txt);
        return true;
#else
        return false;
#end
    }

    public function args() : Array<String> {
#if coopyhx_util
        return Sys.args();
#else
        return [];
#end
    }

    public function writeStdout(txt: String) : Void {
#if coopyhx_util
        Sys.stdout().writeString(txt);
#end
    }

    public function writeStderr(txt: String) : Void {
#if coopyhx_util
        Sys.stderr().writeString(txt);
#end
    }

    public function command(cmd:String, args:Array<String>) : Int {
#if coopyhx_util
        try {
            return Sys.command(cmd,args);
        } catch (e: Dynamic) {
            return 1;
        }
#else
        return 1;
#end
    }

    public function async() : Bool {
        return false;
    }

    public function exists(path:String) : Bool {
#if coopyhx_util
        return sys.FileSystem.exists(path);
#else
        return false;
#end
    }
}

