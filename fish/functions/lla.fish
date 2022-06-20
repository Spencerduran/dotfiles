# Defined in - @ line 1
function lla --wraps='ls -lart' --description 'alias lla=ls -la'
  ls -lart $argv;
end
