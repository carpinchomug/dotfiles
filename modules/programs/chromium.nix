{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;

    extensions = [
      # bitwarden
      { id = "nngceckbapebfimnlniiiahkandclblb"; }

      # line
      { id = "ophjlpahpchlmihnnnihgmmeilfjmjjc"; }

      # vimium
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; }
    ];
  };
}
