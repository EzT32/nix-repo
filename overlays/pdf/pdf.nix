_: {
  nixpkgs.overlays = [
    (final: prev: {
      pdf = prev.writeScriptBin "pdf" ''
        HEADER='dark'

        ARGS=()

        while [[ $# -gt 0 ]]; do 
          case "$1" in
            -H|--header)
              HEADER="$2"
              shift 2
              ;;
            --)
              shift
              ARGS+=("$@")
              break
              ;;
            -*)
              echo "unknown flag: $1" >&2
              exit 1
              ;;
            *)
              ARGS+=("$1")
              shift
              ;;
          esac
        done

        eval set -- ''\${ARGS[@]}

        IN=$1
        OUT="''\${2:-''\${IN%.md}.pdf}"

        case "$HEADER" in
          dark) HEADER=${./default-dark.tex} ;;
          light) HEADER=${./default-light.tex} ;;
          # If no template chosen -> use filename
        esac

        ${prev.pandoc}/bin/pandoc "$IN" \
          -o "$OUT" \
          --pdf-engine=xelatex \
          --pdf-engine-opt=-shell-escape \
          -H "$HEADER"
        
        nohup ${prev.firefox}/bin/firefox $OUT >/dev/null 2>&1 &
      '';
    })
  ];
}
