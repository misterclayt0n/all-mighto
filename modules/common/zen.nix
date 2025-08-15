{ ... }: {
  home-manager.sharedModules = [{
    programs.zen-browser = {
      enable = true;

      policies = {
        SearchEngines = {
          Add = [
            {
              Name        = "NixOS Packages";
              Alias       = "np";   # Type: `np <query>`.
              Method      = "GET";
              URLTemplate = "https://search.nixos.org/packages?channel=unstable&sort=relevance&type=packages&query={searchTerms}";
            }
          ];
        };
      };
    };
  }];
}
