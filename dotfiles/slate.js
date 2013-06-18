slate.config("windowHintsShowIcons", true);
slate.config("windowHintsSpread", true);
slate.config("windowHintsIgnoreHiddenWindows", false);
slate.config("windowHintsDuration", 5.0);

var fullscreen = slate.operation("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var tophalf = slate.operation("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY/2"
});

var bottomhalf = slate.operation("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY + screenSizeY/2",
  "width" : "screenSizeX",
  "height" : "screenSizeY/2"
});

var lefthalf = slate.operation("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX/2",
  "height" : "screenSizeY"
});

var righthalf = slate.operation("move", {
  "x" : "screenOriginX + screenSizeX/2",
  "y" : "screenOriginY",
  "width" : "screenSizeX/2",
  "height" : "screenSizeY"
});

var grid = slate.operation("grid", {
  "grids" : {
    "1440x900" : {
      "width" : 5,
      "height" : 3
    }
  },
  "padding" : 5
});

slate.bind("esc:alt;ctrl", slate.operation("relaunch"));
slate.bind("esc:cmd", fullscreen);
slate.bind("esc:alt", grid);
slate.bind("esc:ctrl", slate.operation("hint"));

slate.bind("right:ctrl;alt;cmd", slate.operation("focus", { "direction" : "right" }));
slate.bind("left:ctrl;alt;cmd", slate.operation("focus", { "direction" : "left" }));
slate.bind("up:ctrl;alt;cmd", slate.operation("focus", { "direction" : "up" }));
slate.bind("down:ctrl;alt;cmd", slate.operation("focus", { "direction" : "down" }));

slate.bind("j:cmd;alt", lefthalf);
slate.bind("k:cmd;alt", tophalf);
slate.bind("l:cmd;alt", bottomhalf);
slate.bind(";:cmd;alt", righthalf);
