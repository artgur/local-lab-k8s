#!/usr/bin/env sh
_MISE_CONFIG_DIR=${_REMOTE_USER_HOME}/.config/mise/
mkdir -p ${_MISE_CONFIG_DIR}
cp ./mise.toml.default ${_MISE_CONFIG_DIR}/config.toml
chown -R ${_REMOTE_USER} ${_MISE_CONFIG_DIR}
echo "export MISE_GLOBAL_CONFIG_FILE=~/.config/mise/config.toml" >> ${_REMOTE_USER_HOME}/.zshrc
echo 'source <(mise completion zsh)' >> ${_REMOTE_USER_HOME}/.zshrc
echo 'eval "$(/usr/local/bin/mise activate --shims)"' >> ${_REMOTE_USER_HOME}/.zshrc
sudo -u ${_REMOTE_USER} /usr/local/bin/mise install
sudo -u ${_REMOTE_USER} /usr/local/bin/mise cache clear

