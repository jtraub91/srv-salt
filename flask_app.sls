create_wsgi_user_and_group:
  user.present:
    - name: wsgi

clone_repo:
  git.latest:
    - name: https://github.com/jtraub91/supersimpleflaskapp.git
    - target: /srv/supersimpleflaskapp
    - branch: master

create_virtual_env:
  cmd.run:
    - name: 'cd /srv/supersimpleflaskapp && virtualenv venv'

wsgi_chown:
  file.directory:
    - name: /srv/supersimpleflaskapp
    - user: wsgi
    - group: wsgi
    - mode: 755
    - recurse:
      - user
      - group
      - mode

apache_wsgi_virtual_host_file:
  file.managed:
    - name: /etc/apache2/sites-available/supersimpleflaskapp.conf
    - source: salt://supersimpleflaskapp.conf

apache_conf:
  file.managed:
    - name: /etc/apache2/apache2.conf
    - source: salt://apache2.conf

disensite_000default:
  cmd.run:
    - name: "a2dissite 000-default"

ensite_ssfa:
  cmd.run:
    - name: "a2ensite supersimpleflaskapp"

restart_apache:
  cmd.run:
    - name: "service apache2 restart"

reload_apache:
  cmd.run:
    - name: "service apache2 reload"

