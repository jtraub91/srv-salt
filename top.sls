base
  '*':
    - common  
  'minion1':
    # minion1 is the webserver
    - apache
    - python
    - flask_app
  'minion2':
    # minion2 is the db
    - postgresql
