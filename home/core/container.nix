{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    docker-compose
    kubectl
  ];

  programs = {
    k9s = {
      enable = true;
      # https://k9scli.io/topics/aliases/
      # aliases = {};
      settings = {
        skin = "catppuccino-mocha";
      };
    };
  };
}
