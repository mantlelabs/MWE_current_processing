FROM ubuntu:16.04

LABEL maintainer="Michael Wess <michael.wess@boku.ac.at>"

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

ARG USERNAME
ARG UID
ARG GROUP
ARG GID

#  install all necessary packages, prepare environment, add user etc.
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
		apt-utils && \
	apt-get install -y --no-install-recommends \
		software-properties-common && \
	apt-get install -y --no-install-recommends \
		python3-pip \
		python3-dev && \
	apt-get clean autoclean && \
	apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/* && \
	pip3 install \
		setuptools \
		wheel && \
	pip3 install \
		redis \
		rq && \
	useradd \
		--uid ${UID} \
		--create-home \
		--no-log-init \
		--shell /bin/bash \
		${USERNAME} && \
	groupmod -g ${GID} ${GROUP} && \
	usermod -g ${GID} ${USERNAME} && \
	echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
	usermod -aG sudo ${USERNAME}

USER ${USERNAME}

WORKDIR /home/${USERNAME}/src




