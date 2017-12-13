#!/usr/bin/python3
# Update all pip packages

import pip
from subprocess import call

packages = [dist.project_name for dist in pip.get_installed_distributions()]

for p in packages:
    call("sudo -H pip install --upgrade " + p, shell=True)
