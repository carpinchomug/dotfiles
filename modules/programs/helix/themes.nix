{ config, pkgs, ... }:

{
  programs.helix.themes = {
    my_theme =
      let
        base = "#191724";
        surface = "#1f1d2e";
        overlay = "#26233a";
        muted = "#6e6a86";
        subtle = "#6e6a86";
        text = "#e0def4";
        love = "#eb6f92";
        gold = "#f6c177";
        rose = "#ebbcba";
        pine = "#31748f";
        foam = "#9ccfd8";
        iris = "#c4a7e7";
        highlight = "#21202e";
        highlightMed = "#403d52";
        highlightHigh = "#524f67";

      in
      {
        "ui.menu" = { fg = text; bg = overlay; };
        "ui.menu.selected" = { fg = iris; bg = surface; };
        "ui.linenr" = { fg = muted; };
        "ui.linenr.selected" = { fg = text; };
        "ui.selection" = { bg = highlightMed; };
        "comment" = subtle;
        "ui.statusline" = { fg = foam; bg = surface; };
        "ui.statusline.inactive" = { fg = iris; bg = surface; };
        "ui.help" = { fg = foam; bg = surface; };
        "ui.cursor" = { modifiers = [ "reversed" ]; };
        "ui.cursor.match" = { bg = subtle; modifiers = [ "underlined" ]; };
        "ui.text" = { fg = text; };
        "ui.text.focus" = { fg = foam; modifiers = [ "bold" ]; };
        "ui.text.info" = { fg = pine; modifiers = [ "bold" ]; };
        "operator" = rose;
        "variable" = text;
        "constant.numeric" = iris;
        "constant" = gold;
        "attributes" = gold;
        "type" = foam;
        "string" = gold;
        "property" = foam;
        "constant.character.escape" = muted;
        "function" = rose;
        "function.builtin" = rose;
        "function.method" = foam;
        "constructor" = gold;
        "special" = gold;
        "keyword" = pine;
        "label" = iris;
        "namespace" = pine;
        "ui.popup" = { bg = surface; };
        "ui.popup.info" = { bg = surface; };
        "ui.window" = { bg = base; };
        "text" = text;
        "diff.plus" = foam;
        "diff.delta" = rose;
        "diff.minus" = love;

        "info" = gold;
        "hint" = gold;
        "debug" = rose;
        "diagnostic" = rose;
        "error" = love;

        "markup.heading.marker" = subtle;
        "markup.heading.1" = { fg = love; modifiers = [ "bold" ]; };
        "markup.heading.2" = { fg = gold; modifiers = [ "bold" ]; };
        "markup.heading.3" = { fg = rose; modifiers = [ "bold" ]; };
        "markup.heading.4" = { fg = pine; modifiers = [ "bold" ]; };
        "markup.heading.5" = { fg = foam; modifiers = [ "bold" ]; };
        "markup.heading.6" = { fg = text; modifiers = [ "bold" ]; };
        "markup.list" = { fg = love; };
        "markup.bold" = { fg = gold; modifiers = [ "bold" ]; };
        "markup.italic" = { fg = iris; modifiers = [ "italic" ]; };
        "markup.link.url" = { fg = pine; modifiers = [ "underlined" ]; };
        "markup.link.text" = { fg = foam; };
        "markup.quote" = { fg = rose; };
        "markup.raw" = { fg = foam; };
      };
  };
}
