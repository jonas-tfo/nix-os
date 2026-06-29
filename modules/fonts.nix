{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    jetbrains-mono
    font-awesome
    noto-fonts
    noto-fonts-emoji
    terminus_font
    nerd-fonts.anonymice
    nerd-fonts.iosevka-term
    nerd-fonts.fantasque-sans-mono
  ];
}
