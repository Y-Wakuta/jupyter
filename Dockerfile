from jupyter/base-notebook

RUN pip install jupyterthemes
RUN jt -t monokai -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T
CMD ["start-notebook.sh","--NotebookApp.password='sha1:2deb58c0f1df:8589e663a8af5b65ca536046801a7c21500d7e56'"]
