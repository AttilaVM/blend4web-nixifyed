{ stdenv, python36, python36Packages, blender, nodejs-8_x }:

let
  targetDir = "./blend4web_ce";
  archiveFile = "./blend4web.zip";
  env = [
  python36
  python36Packages.pip
  python36Packages.requests
  blender
  nodejs-8_x
];
in
  stdenv.mkDerivation {
    name        = "blend4web";
    buildInputs = env;
    shellHook   = ''
      if [ ! -d ${targetDir} ]; then
         curl https://www.blend4web.com/pub/blend4web_ce_17_12_0.zip --output ${archiveFile}
         7z x ${archiveFile} && rm archiveFile
      fi

      cd ${targetDir}/tools/node/
      rm -r node-v8.9.1-linux-x64
      ln -s ${nodejs-8_x} node
      ln -s ${nodejs-8_x} node-v8.9.1-linux-x64
      blender
    '';
}
