# Adapted from James Brock https://github.com/IHaskell/learn-you-a-haskell-notebook/blob/master/Dockerfile

FROM ghcr.io/jamesdbrock/ihaskell-notebook:master@sha256:78e7f89d2ffc716da2ca46f4f02efcc3d3f26147c5f4603686dfff0c3a28dd3d

USER root

RUN mkdir /home/$NB_USER/fpsig
COPY *.ipynb /home/$NB_USER/fpsig/
RUN chown --recursive $NB_UID:users /home/$NB_USER/fpsig

USER $NB_UID

ENV JUPYTER_ENABLE_LAB=yes
