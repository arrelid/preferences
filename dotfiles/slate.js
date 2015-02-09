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
    // MacBook Pro Retina 13"
    "1280x800" : {
      "width" : 4,
      "height" : 2
    },
    // MacBook Pro Retina 15"
    "1440x900" : {
      "width" : 6,
      "height" : 2
    },
    // iMac
    "2560x1440" : {
      "width" : 8,
      "height" : 4
    }
  },
  "padding" : 5
});

slate.bind("esc:alt;ctrl", slate.operation("relaunch"));
slate.bind("esc:cmd", fullscreen);
slate.bind("esc:ctrl", grid);
slate.bind("esc:alt", slate.operation("hint"));

slate.bind("down:ctrl;alt;cmd", slate.operation("throw", {
  "screen" : "next",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
}));

slate.bind("j:cmd;alt", lefthalf);
slate.bind("k:cmd;alt", tophalf);
slate.bind("l:cmd;alt", bottomhalf);
slate.bind(";:cmd;alt", righthalf);
