{ pkgs, ... }:
{
  programs.niri.enable = true;

  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;          # runs DMS as a user service, tied to the graphical session
      # niri.includes = {               # writes the niri integration files + an include into config.kdl
      #   filesToInclude = [ "binds" "colors" "layout" "outputs" ];
      # };
  };

  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.plasma-login-manager.enable = true;
  
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };
}
