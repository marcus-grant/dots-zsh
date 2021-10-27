# Dockerfile to setup a debian based bash testing environment
FROM debian
LABEL maintainer=marcusfg@gmail.com

RUN apt-get update && apt install -y \
    bash \
    zsh \
    sudo \
    firewalld \
    less \
    sed \
    git \
    curl \
    nano \
    fzf \
    fd-find \
    vim 

# FOR building py build to test asdf for python
RUN apt-get update; sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
dirmngr gpg gawk

RUN useradd -ms /bin/bash test; echo "test:test" | chpasswd; adduser test sudo

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
RUN git clone git://github.com/pyenv/pyenv.git /pyenv
RUN /pyenv/plugins/python-build/install.sh

WORKDIR /root
CMD /bin/zsh
