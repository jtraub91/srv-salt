install_python2:
  pkg.installed:
    - pkgs:
      - python
      - python-pip

install_python3:
  pkg.installed:
    - pkgs:
      - python3
      - python3-pip

install_virtualenv_python3:
  pip.installed:
    - bin_env: '/usr/bin/pip3'
    - pkgs:
      - virtualenv
    - require:
      - pkg: install_python3 

