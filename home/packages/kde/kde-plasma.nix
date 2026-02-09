{
  config,
  pkgs,
  lib,
  ...
}:

let
  krohnkite-customized = pkgs.kdePackages.krohnkite.overrideAttrs (_old: rec {
    pname = "krohnkite";
    version = "0.9.9.2";

    src = pkgs.fetchFromGitea {
      domain = "codeberg.org";
      owner = "jbeaurivage";
      repo = "Krohnkite";
      rev = "8603cc50aad9c9e0b9e920a7060ad0283960fc0a";
      hash = "sha256-RTilDMHclh4aB7kDXQeXsZ7xJ6PngrTN7lgsRYSsia8=";
    };

    # Here we have to override the npm dependencies hash through the npmDeps variable
    npmDepsHash = "sha256-MCfG0C+h2VC/eKO2Js31vrCt0AXTGrkXptwKjdQzwLQ=";

    npmDeps = pkgs.fetchNpmDeps {
      inherit src;
      name = "${pname}-${version}-npm-deps";
      hash = npmDepsHash;
    };
  });
in
{
  home.packages = [
    krohnkite-customized
  ];

  imports = [
    ./plasma-config.nix
  ];

}
