# FROM python:3.9-slim
# # install the notebook package
# RUN pip install --no-cache --upgrade pip && \
#     pip install --no-cache notebook jupyterlab

# # create user with a home directory
# ARG NB_USER
# ARG NB_UID
# ENV USER ${NB_USER}
# ENV HOME /home/${NB_USER}

# RUN adduser --disabled-password \
#     --gecos "Default user" \
#     --uid ${NB_UID} \
#     ${NB_USER}
# WORKDIR ${HOME}
# USER ${USER}


FROM ghcr.io/jamesdbrock/ihaskell-notebook:master@sha256:78e7f89d2ffc716da2ca46f4f02efcc3d3f26147c5f4603686dfff0c3a28dd3d

USER root

RUN mkdir /home/$NB_USER/fpsig
COPY *.ipynb /home/$NB_USER/fpsig/
RUN chown --recursive $NB_UID:users /home/$NB_USER/fpsig

# ARG EXAMPLES_PATH=/home/$NB_USER/ihaskell_examples
# COPY notebook_extra/WidgetRevival.ipynb $EXAMPLES_PATH/
# RUN chown $NB_UID:users $EXAMPLES_PATH/WidgetRevival.ipynb

USER $NB_UID

ENV JUPYTER_ENABLE_LAB=yes
