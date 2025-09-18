_: {
  nixpkgs.overlays = [
    (final: prev: {
      pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
        (python-final: python-prev: {
          pygments = python-prev.pygments.overridePythonAttrs (old: {
            postInstall = (old.postInstall or "") + ''
              cp -r ${./styles} $out/${python-final.python.sitePackages}/pygments/styles/custom
            '';
          });
        })
      ];
    })
  ];
}
