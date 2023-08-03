{
  inputs,
  self,
  ...
}: {
  perSystem = {
    self',
    system,
    pkgs,
    ...
  }: {
    checks = {
      pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
        src = self;
        hooks = {
          markdownlint.enable = true;

          alejandra.enable = true;
          deadnix.enable = true;
          nil.enable = true;
        };
      };
    };

    devShells.default = pkgs.mkShell {
      inherit (self'.checks.pre-commit-check) shellHook;
    };

    formatter = pkgs.alejandra;
  };
}
