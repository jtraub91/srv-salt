install_apache:
  pkg.installed:
    - name: apache2

install_mod_wsgi:
  pkg.installed:
    - pkgs: 
      - libapache2-mod-wsgi-py3
    - require:
      - pkg: install_apache
