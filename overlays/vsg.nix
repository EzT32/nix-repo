_: {
  nixpkgs.overlays = [
    (final: prev: {
      vsg = prev.python3Packages.buildPythonPackage {
        pname = "vsg";
        version = "3.35.0";
        format = "pyproject";

        src = prev.fetchFromGitHub {
          owner = "jeremiah-c-leary";
          repo = "vhdl-style-guide";
          rev = "v3.35.0";
          sha256 = "sha256-032swgp7f1q4mgwg1gzaj516s98giil3i24ms64in4x83a2g6z8k=";
        };

        nativeBuildInputs = with prev.python3Packages; [ flit-core ];

        propagatedBuildInputs = with prev.python3Packages; [
          click
          pyparsing
          pyyaml
        ];

        doCheck = false;

        meta = {
          description = "VHDL Style Guide formatter";
          homepage = "https://github.com/jeremiah-c-leary/vhdl-style-guide";
          license = prev.lib.licenses.mit;
        };
      };
    })
  ];
}
