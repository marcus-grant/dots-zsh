# Dockerfile to setup a debian based bash testing environment
FROM debian
LABEL maintainer=marcusfg@gmail.com

RUN apt-get update && apt install -y \
    zsh \
    sudo \
    less \
    git \
    curl \
    nano \
    vim  \
    fd-find \
    ripgrep \
    fzf

RUN export EDITOR=nano
RUN mkdir /root/.dots
RUN mkdir /root/.dots/zsh
# RUN rm /root/.zshrc /root/.zprofile /root/.zshenv
RUN ln -sf /root/.dots/zsh/rc.zsh /root/.zshrc
RUN ln -sf /root/.dots/zsh/profile.zsh /root/.zprofile
RUN ln -sf /root/.dots/zsh/env.zsh /root/.zshenv
RUN curl -o /tmp/starship-install.sh https://starship.rs/install.sh
RUN chmod +x /tmp/starship-install.sh 
RUN /tmp/starship-install.sh -y

WORKDIR /root

CMD /bin/zsh
