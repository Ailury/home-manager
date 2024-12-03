{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    shellAliases = {
        ls = "ls --color=always";
        ll = "ls -l";
        updatehm = "home-manager switch --flake /home/m/git/home-manager/";
        cd = "z";
        v = "nvim";
        vim = "vim";
        nvim = "nvim";
        gs = "git status";
        gc = "git commit -m";
        gca = "git commit -a -m";
        gp = "git push origin HEAD";
        gpu = "git pull origin";
        gst = "git status";
        glog = "git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit";
        gdiff = "git diff";
        gco = "git checkout";
        gb = "git branch";
        gba = "git branch -a";
        gadd = "git add";
        ga = "git add -p";
        gcoall = "git checkout -- .";
        gr = "git remote";
        gre = "git reset";
        dco = "docker compose";
        dps = "docker ps";
        dpa = "docker ps -a";
        dl = "docker ps -l -q";
        dx = "docker exec -it";
    };
    
    history = {
        size = 10000;
        ignoreDups = true;
        ignoreSpace = true;
        ignoreAllDups = true;
        share = true;
    };
    
    historySubstringSearch = {
      searchDownKey = "^p";
      searchUpKey = "^n";
    };

    initExtra = ''
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
    '';
    plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    ]; 
  };
}
