{ stdenv, fetchFromGitHub  }:


stdenv.mkDerivation rec {
  name = "antigen-${version}";
  version = "v1.3.1"; 

  src = fetchFromGitHub {
    owner = "zsh-users";
    repo = "antigen";
    rev = "${version}";
    sha256 = "12fvr6fb4irr9aqfx3kyaapzccy0qc0grs7pibqij49h52yzdcd2";
  };

  installPhase = ''
    outdir=$out/share
    mkdir -p $outdir
    cp $src/bin/antigen.zsh $outdir/antigen.zsh
  '';


  meta = with stdenv.lib; {
    description = "A plugin manager for zsh, inspired by oh-my-zsh and vundle.";
    longDescription = "Antigen is a small set of functions that help you easily manage your shell (zsh) plugins, called bundles. The concept is pretty much the same as bundles in a typical vim+pathogen setup. Antigen is to zsh, what Vundle is to vim.";
    homepage = "https://github.com/zsh-users/antigen";
    license = licenses.mit;
    platforms = platforms.all;
  };
}


