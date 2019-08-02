install_python2:
  pkg.installed:
    - pkgs:
      - python
      - python-pip
    - version: '2.7.*'

install_python3:
  pkg.installed:
    - pkgs:
      - python3: '3.5.*'
      - python3-pip
      - python3-venv

install_virtualenv_python3:
  pip.installed:
    - bin_env: '/usr/bin/pip3'
    - pkgs:
      - virtualenv
    - require:
      - pkg: install_python3 

