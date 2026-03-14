function glog --description 'Pretty git log graph'
    git log --graph --decorate --pretty=format:'%C(auto)%h%d %C(#888888)(%an; %ar) %Creset %s'
end
