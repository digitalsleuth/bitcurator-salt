include:
  - bitcurator.packages.python3-virtualenv

brunnhilde-venv:
  virtualenv.managed:
    - name: /opt/brunnhilde
    - venv_bin: /usr/bin/virtualenv
    - pip_pkgs:
      - pip>=24.1.3
      - setuptools>=70.0.0
      - wheel>=0.38.4
    - require:
      - sls: bitcurator.packages.python3-virtualenv

brunnhilde:
  pip.installed:
    - bin_env: /opt/brunnhilde/bin/python3
    - upgrade: True
    - require:
      - virtualenv: brunnhilde-venv

brunnhilde-symlink:
  file.symlink:
    - name: /usr/local/bin/brunnhilde
    - target: /opt/brunnhilde/bin/brunnhilde
    - makedirs: False
    - require:
      - pip: brunnhilde
