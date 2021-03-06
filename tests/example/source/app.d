import djson;
import std.stdio;
static import file = std.file;

void main(){
  enum json = import("in.json");
  enum compileTimeSource = generateTypeFromJSON(json);

  static assert(is(typeof(mixin("{"~compileTimeSource~"}"))));

  string runtimeSource = generateTypeFromJSON(json);

  file.write("out.d", runtimeSource);

  file.write("out.json", serializeToJSON(Json.init, true));
}

mixin(generateTypeFromJSON(import("in.json"), "Json"));