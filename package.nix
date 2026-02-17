{
  lib,
  stdenv,
  fetchFromGitHub,
  zig,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "nanobrew";
  version = "0.1.067";

  src = fetchFromGitHub {
    owner = "justrach";
    repo = "nanobrew";
    tag = "v${finalAttrs.version}";
    hash = "sha256-G/jBXeVEhcvnXGDvHqRF9ERlAckeRwIm7Jl7ODs0Aj4=";
  };

  nativeBuildInputs = [
    zig.hook
  ];

  meta = {
    description = "The fastest macOS package manager — single static Zig binary, 3ms warm installs";
    homepage = "https://github.com/justrach/nanobrew";
    license = lib.licenses.asl20;
    mainProgram = "nb";
    platforms = lib.platforms.darwin;
  };
})
