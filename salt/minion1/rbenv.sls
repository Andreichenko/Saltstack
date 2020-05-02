rbenv-deps:
  pkg.installed:
    - pkgs:
        - gcc
        - bzip2
        - gcc-c++
        - make
        - openssl-devel
        - libyaml-devel
        - libffi-devel
        - readline-devel
        - openssl-devel
        - zlib-devel
        - gdbm-devel
        - ncurses-devel

ruby-2.3.1:
  rbenv.installed:
    - default: True
    - require:
      - pkg: rbenv-deps

git_rbenv_path:
# File.append searches the file for text before it appends so it won't append multiple times
  file.append:
    - name: /etc/profile
    - text:
        - export RBENV_ROOT="/usr/local/rbenv"
        - export PATH="$RBENV_ROOT/bin:$PATH"
        - eval "$(rbenv init -)"
