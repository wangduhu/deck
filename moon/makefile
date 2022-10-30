
TMUX_SRC_CONF := $(PWD)/shell/tmux.conf
TMUX_DST_CONF := $(HOME)/.tmux.conf
TMP_DIR := /tmp

ZSH_SRC_CONF := $(PWD)/shell/rc.zsh
ZSH_DST_CONF := $(HOME)/.zshrc

BASH_SRC_CONF := $(PWD)/shell/rc.bash
BASH_DST_CONF := $(HOME)/.bashrc

SH_CONF_SRC_DIR := $(PWD)/shell/sh.d
SH_CONF_DST_DIR := $(HOME)/.sh.d

NGINX_SRC_CONF := $(PWD)/nginx/nginx.conf
NGINX_DST_CONF := /usr/local/etc/nginx/nginx.conf

TRASH := trash


.PHONY: init-shell init-tmux init-zsh init-bash

init-shell: init-tmux init-zsh init-bash init-sh-common
	@echo "init shell done"

init-tmux:
	@echo "init tmux conf"
	if [[ -a $(TMUX_DST_CONF) ]]; then $(TRASH) $(TMUX_DST_CONF); fi
	ln -sf $(TMUX_SRC_CONF) $(TMUX_DST_CONF)

init-zsh:
	@echo "init zsh rc"
	if [[ -a $(ZSH_DST_CONF) ]]; then $(TRASH) $(ZSH_DST_CONF); fi
	ln -sf $(ZSH_SRC_CONF) $(ZSH_DST_CONF)

init-bash:
	@echo "init bash rc"
	if [[ -a $(BASH_DST_CONF) ]]; then $(TRASH) $(BASH_DST_CONF); fi
	ln -sf $(BASH_SRC_CONF) $(BASH_DST_CONF)

init-sh-common:
	if [[ -a $(SH_CONF_DST_DIR) ]]; then $(TRASH) $(SH_CONF_DST_DIR); fi
	ln -sf $(SH_CONF_SRC_DIR) $(SH_CONF_DST_DIR)


.PHONY: svc svd

svd:
	mkdir -p /tmp/supervisor
	supervisord -c $(PWD)/supervisor/supervisord.conf

svc:
	supervisorctl -c $(PWD)/supervisor/supervisord.conf


.PHONY: init-nginx
init-nginx:
	if [[ -a $(NGINX_DST_CONF) ]]; then $(TRASH) $(NGINX_DST_CONF); fi
	ln -sf $(NGINX_SRC_CONF) $(NGINX_DST_CONF)
