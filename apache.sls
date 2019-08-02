install_apache:
  pkg.installed:
    - name: apache2

install_mod_wsgi:
  pkg.installed:
    - name: libapache2-mod-wsgi
    - require:
      - pkg: install_apache
