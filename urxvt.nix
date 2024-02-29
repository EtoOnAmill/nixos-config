{
  enable = true;
  scroll = {
    bar = {
      enable = false;
      # style = "plain";
      # position = "right";
    };
    scrollOnKeystroke = false;
  };
  iso14755 = false;
  extraConfig = {
    "urgentOnBell" = "false";
    "visualBell" = "true";
    "foreground" = "#E5E9F0";
    "background" = "#1E2430";
    "cursorColor" = "#FFFFFF";
  };
  /*
  font stress test

abcdefghijklmnopqrstuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ
`[]+',.-#~@\
{}*?;:_°^¸/()|$%&=!"°
(=)[=]{=}<=>
-+*~
-=> 
1234567890
oO0Q
iI1Ll|!
9q

  */
  fonts = [
    "xft:LilexExtraThickNerdFont-Regular:size=17"

    "xft:HurmitNerdFontMono-Bold:size=17"
    "xft:CaskaydiaCoveNerdFontMono-Bold:size=18"
    "xft:BlexMonoNerdFont-Text:size=18"
    "xft:GeistMonoNerdFontMono:size=17"

    "xft:MartianMonoNerdFontMono-Regular:size=17"
    "xft:MonoidNerdFont-Regular:size=17"

    "xft:AnonymiceProNerdFontMono-Bold:size=20"
    "xft:DaddyTimeMonoNerdFontMono-Regular:size=17"
  ];
}
