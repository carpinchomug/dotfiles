{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "rose_pine"; 

      # editor = {
      #   cursor-shape = {
      #     insert = "bar";
      #     normal = "block";
      #     select = "underline";
      #   };
      # };
    };

    # languages = [
    #   {
    #     name = "name of the language";
    #     # options go here
    #     # https://docs.helix-editor.com/languages.html
    #   }
    # ];
  };
}
