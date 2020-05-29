FROM registry.cn-hangzhou.aliyuncs.com/k8ops-base/centos:7-v1

RUN set -eux \
  ; install_packages zsh git vim \
  ; chsh -s /bin/zsh

COPY ./rootfs /

RUn set -eux \
  ; oh-my-zsh-install.sh --keep-zshrc \
  ; mv ~/.oh-my-zsh/custom{,bak}\
  ; git clone https://github.com/seanly/oh-my-zsh-custom.git  ~/.oh-my-zsh/custom

WORKDIR /root

ENV PATH=/root/.krew/bin:$PATH
RUN set -eux \
  ; kubectl krew system receipts-upgrade \
  ; kubectl krew install ctx \
  ; kubectl krew install ns

ENV SHELL=/bin/zsh
ENTRYPOINT ["/bin/zsh"]
