{ config, pkgs, inputs, ... }:

{
  # imports = [./personal/default.nix];  # doesn't exactlty work as intended (WIP)

  # Enable font.fontDir
  fonts.fontDir.enable = true;

  # Running X11 applications or any other program uses Fontconfig.
  # A config file pointing to a set of default fonts
  fonts.fontconfig.enable = true;

  # Enables bitmap support
  fonts.fontconfig.useEmbeddedBitmaps = true;

  # Some "basic" fonts to be installed for reasonable Unicode coverage
  # Enable if you are unsure about what languages you might end up reading
  fonts.enableDefaultPackages = true;
  fonts.fontconfig.defaultFonts = {
      monospace = [
        "JetBrainsMono Nerd Font"
        "Migu"
        "DejaVu Sans Mono"
        "FiraCode Nerd Font Mono"
        "Maple Mono Nerd Font"
        "Noto Color Emoji"
        "Kalpurush"
      ];
      sansSerif = [
        "Lexend"
        "Migu"
        "Jost"
        "DejaVu Sans"
        "SFProDisplay Nerd Font"
        "Noto Sans CJK JP"
        "Font Awesome 6 Pro"
        "IBM Plex Sans"
        "Noto Color Emoji"
        "Kalpurush"
        "Siyam Rupali"
        "SutonnyMj"
        "Himu Unicode"
      ];
      serif = [
        "Lora"
        "Merriweather"
        "MigMix"
        "DejaVu Serif"
        "Font Awesome 6 Pro"
        "IBM Plex Serif"
        "SFProDisplay Nerd Font"
        "Noto Serif CJK JP"
        "Noto Color Emoji"
        "Kalpurush"
        "Siyam Rupali"
        "SutonnyMj"
        "Himu Unicode"
      ];
      emoji = [ "Noto Color Emoji" ];
    };

  fonts.packages = with pkgs; [
    aileron
    alegreya
    alegreya-sans
    barlow
    comic-neue
    comfortaa
    dejavu_fonts
    fragment-mono
    hack-font
    ibm-plex
    inter
    jost
    lato
    lexend
    lora
    merriweather
    noto-fonts
    open-sans
    liberation_ttf
    poppins

    # Icon Fonts
    material-icons
    noto-fonts-color-emoji
    noto-fonts-emoji
    openmoji-color
    twemoji-color-font
    material-design-icons # 7k+ material design icons from the community
    font-awesome
    font-awesome_5
    inter-nerdfont
    (callPackage ./font-awesome {})
    (callPackage ./phospor.nix {})

    # Nerd Fonts
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.zed-mono
    nerd-fonts.victor-mono
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    maple-mono.NF
    udev-gothic-nf	# Programming font with UD Gothic, JBrains and NF
    (callPackage ./personal/caskaydia-cove {})

    # Japanese Fonts
    ipaexfont  # JP font with Mincho and Gothic fonts
    noto-fonts-cjk-sans	# Sans style between modern and traditional Chinese,Japanese,Korean fonts
    noto-fonts-cjk-serif # Serif style between modern and traditional Chinese,Japanese,Korean fonts
    kanji-stroke-order-font	 # Contains diagrams for 6500+ kanjis and more
    migmix  # High Quality JP font based on M+ and IPA fonts
    hachimarupop  # Cute Japanese Font
    migu  # HQ JP font based on modified M+ and IPA fonts
    hanazono  # JP Mincho Typeface Truetype font
    kochi-substitute  # Free replacement for MS Gothic and MS Mincho JP

    # Personal Custom Fonts
    (callPackage ./personal/kalpurush {})  
    (callPackage ./personal/sutonnymj {})  
    (callPackage ./personal/siyamrupali {})  
    (callPackage ./personal/shonar-bangla {})  
    (callPackage ./personal/apona-lohit {})  
    (callPackage ./personal/himu {})  
    (callPackage ./personal/nikosh {})  
    (callPackage ./proxima-nova {})
    (callPackage ./helvetica-neue {})
    (callPackage ./code-pro {})
    (callPackage ./gabriel-sans {})
    (callPackage ./solomon-sans {})
    (callPackage ./intro {})
    (callPackage ./avenir {})
    (callPackage ./garamond {})
    (callPackage ./pf-encore-sans {})

  ];

  # Ensure the Fontconfig cache is updated after the fonts are installed
  systemd.services.update-font-cache = {
    description = "Update Fontconfig cache";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.fontconfig}/bin/fc-cache -f -v";
    };
    wantedBy = [ "multi-user.target" ];
  };

}
