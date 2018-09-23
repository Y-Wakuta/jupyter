from jupyter/base-notebook

#ここでrootに変えないとaptが使えない
USER root 
WORKDIR /home/jovyan

RUN apt-get update
RUN apt-get install wget sudo
RUN sudo apt-get install -y libtool libffi-dev ruby ruby-dev make git libzmq3-dev autoconf pkg-config

RUN git clone https://github.com/zeromq/czmq
# ADD czmq ./czmq
WORKDIR /home/jovyan/czmq
RUN ls
RUN ./autogen.sh && ./configure && make && make install

WORKDIR /home/jovyan
RUN gem install cztop iruby
RUN iruby register --force

#ここでrootからjovyanに変えないとjupyternotebookがpermissionの都合で起動しない
USER jovyan 
RUN pip install jupyterthemes
RUN jt -t monokai -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T
CMD ["start-notebook.sh","--NotebookApp.password='sha1:2deb58c0f1df:8589e663a8af5b65ca536046801a7c21500d7e56'"]