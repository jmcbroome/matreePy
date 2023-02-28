FROM continuumio/miniconda3:latest
USER root
WORKDIR /home
RUN git clone --recurse-submodules https://github.com/jmcbroome/BTE.git
WORKDIR BTE
RUN conda env create -f bte.yml
SHELL ["conda", "run", "-n", "bte", "/bin/bash", "-c"]
RUN python3 setup.py build_ext
RUN python3 setup.py install