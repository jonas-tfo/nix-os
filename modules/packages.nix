{ pkgs, ... }:
let
  pythonEnv = pkgs.python3.withPackages (ps: with ps; [
    ipython
    pip
  ]);
in
{
  environment.systemPackages = with pkgs; [
    # Core CLI
    git curl wget unzip stow
    ripgrep fd jq
    tmux neovim kitty
    zoxide fzf
    btop htop fastfetch tree
    inotify-tools dos2unix socat ddcutil
    uv nodejs lua luajit
    xdg-utils

    # Wayland / niri
    swww
    grim slurp wl-clipboard
    rofi-wayland
    brightnessctl playerctl
    matugen cliphist
    nwg-look
    qt5.qtwayland qt6.qtwayland
    xwayland-satellite

    # Tray / power / network applets
    pavucontrol
    networkmanagerapplet
    kdePackages.polkit-kde-agent-1

    # Apps
    kdePackages.okular
    zathura
    lazygit
    vscodium
    chromium
    librewolf
    thunderbird
    libreoffice-fresh
    vlc
    sioyek
    obsidian
    ncspot

    # Java + databases
    jdk
    jdk21
    maven
    mariadb

    # Rust / dev tools
    rustup
    typst
    websocat
    yazi
    bluetui

    # Deno / rclone
    deno
    rclone

    # Python tooling
    pythonEnv
    gcalcli
    jupyter

    # Cursor + icon themes
    bibata-cursors
    candy-icons
  ];
}
