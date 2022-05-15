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
RUN mkdir /root/.config
RUN mkdir /root/.config/zsh
# RUN rm /root/.zshrc /root/.zprofile /root/.zshenv
RUN ln -sf /root/.config/zsh/rc.zsh /root/.zshrc
RUN ln -sf /root/.config/zsh/profile.zsh /root/.zprofile
RUN ln -sf /root/.config/zsh/env.zsh /root/.zshenv
RUN curl -o /tmp/starship-install.sh https://starship.rs/install.sh
RUN chmod +x /tmp/starship-install.sh 
RUN /tmp/starship-install.sh -y

WORKDIR /root

CMD /bin/zsh
