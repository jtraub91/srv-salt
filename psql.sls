install_postgresql:
  pkg.installed:
    - name: postgresql

create_db_user:
  postgres_user.present:
    - name: 'ssfa'
    - password: 'ssfa'
    - createdb: True

create_db:
  postgres_database.present:
    - name: 'ssfa'
    - owner: 'ssfa'

