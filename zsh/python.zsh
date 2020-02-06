gpip() {
  PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

gpip3() {
  PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
