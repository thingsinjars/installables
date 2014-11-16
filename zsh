#!/bin/bash
if [ ! -f /home/vagrant/.zshrc ]; then
    yum install -y zsh
    curl -L http://install.ohmyz.sh | sh
    cp /root/.zshrc /home/vagrant/.zshrc
    cat /etc/profile.d/opt_path.sh >> /home/vagrant/.zshrc
    chown -R vagrant:vagrant /home/vagrant/.zshrc
    cp -R /root/.oh-my-zsh /home/vagrant/.oh-my-zsh
    chown -R vagrant:vagrant /home/vagrant/.oh-my-zsh
fi
chsh -s `which zsh` vagrant
cat /etc/profile.d/opt_path.sh >> /home/vagrant/.zshrc