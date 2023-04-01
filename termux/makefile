ROOT := /data/data/com.termux/files
HOME := $(ROOT)/home
PREFIX := $(ROOT)/usr

NGINX_SRC_CONF := $(PWD)/nginx.conf
NGINX_DST_CONF := /data/data/com.termux/files/usr/etc/nginx/nginx.conf
NGINX_SRC_KEY := $(PWD)/localssl
NGINX_DST_KEY := /data/data/com.termux/files/usr/etc/nginx/localssl

TERMUX_SRC_CONF := $(PWD)/termux.properties
TERMUX_DST_CONF := /data/data/com.termux/files/home/.termux/termux.properties

SPACEMACS_SRC_CONF := $(PWD)/dotspacemacs.el
SPACEMACS_DST_CONF := /data/data/com.termux/files/home/.spacemacs

TRASH := rm -rf

.PHONY: init-nginx
init-nginx:

	$(TRASH) $(NGINX_DST_CONF)
	ln -sf $(NGINX_SRC_CONF) $(NGINX_DST_CONF)
	$(TRASH) $(NGINX_DST_KEY)
	ln -sf $(NGINX_SRC_KEY) $(NGINX_DST_KEY)


.PHONY: init-TERMUX
init-termux:
	$(TRASH) $(TERMUX_DST_CONF)
	ln -sf $(TERMUX_SRC_CONF) $(TERMUX_DST_CONF)


.PHONY: init-spacemacs
init-spacemacs:
	$(TRASH) $(SPACEMACS_DST_CONF)
	ln -sf $(SPACEMACS_SRC_CONF) $(SPACEMACS_DST_CONF)


.PHONY: init-media
init-media:
	ln -sf $(HOME)/Wally/pictures/trivial/pets $(HOME)/media/img/
	ln -sf $(HOME)/Wally/pictures/trivial/beauty $(HOME)/media/img/
	ln -sf $(HOME)/Wally/pictures/trivial/covers $(HOME)/media/img/
	ln -sf $(HOME)/Wally/pictures/trivial/fun $(HOME)/media/img/
	ln -sf $(HOME)/Wally/pictures/trivial/nature $(HOME)/media/img/
	ln -sf $(HOME)/Wally/pictures/trivial/saying $(HOME)/media/img/
	ln -sf $(HOME)/Wally/pictures/trivial/stills $(HOME)/media/img/
