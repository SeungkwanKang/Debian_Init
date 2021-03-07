FROM kangsk/chipyard:1.0
ENV DEBIAN_FRONTEND noninteractive

RUN cd /root/chipyard && \
	printf "%s\n%s\n" -Xms4096m -Xmx4096m > .jvmopts && \
	printf "%s\n%s\n" -Dsbt.sourcemode=true -Dsbt.workspace=/root/chipyard/tools > .sbtopts && \
	touch .scalafmt.conf