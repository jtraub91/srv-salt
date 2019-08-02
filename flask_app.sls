create_wsgi_user:
  user.present:
    - name: wsgi

check_if_wsgi_group_present:
  group.present:
    - name: wsgi

clone_repo:
  git.latest:
    - name: https://github.com/jtraub91/supersimpleflaskapp.git
    - target: /srv/supersimpleflaskapp
    - branch: master

create_virtual_env:
  cmd.run:
    - name: 'cd /srv/supersimpleflaskapp && virtualenv venv'

install_requirements:
  cmd.run:
    - name: 'cd /srv/supersimpleflaskapp && . venv/bin/activate && pip install -r /srv/supersimpleflaskapp/requirements.txt'

wsgi_chown:
  file.directory:
    - name: /srv/supersimpleflaskapp
    - user: wsgi
    - group: wsgi
    - mode: 644
    - recurse:
      - user
      - group
      - mode

apache_conf:
  file.managed:
    - name: /etc/apache2/apache2.conf
    - source: salt://apache-conf/apache2.conf

apache_wsgi_virtual_host_file:
  file.managed:
    - name: /etc/apache2/sites-available/supersimpleflaskapp.conf
    - source: salt://apache-conf/supersimpleflaskapp.conf

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

