FROM stackexchange/bosun:0.6.0-pre
RUN apt-get -qq update
RUN hostname
RUN cat /etc/hosts

RUN apt-get -qy update
RUN apt-get -qy install sendmail sendmail-bin mailutils

RUN apt-get -qy install python-pip
RUN pip install superlance

RUN apt-get -qy install htop

# update supervisord
RUN echo >>/etc/supervisor/conf.d/supervisord.conf
RUN echo [eventlistener:memmon] >>/etc/supervisor/conf.d/supervisord.conf
RUN echo command=memmon --program=bosun=150MB --email=taylor.monacelli@streambox.com >>/etc/supervisor/conf.d/supervisord.conf
RUN echo events=TICK_60 >>/etc/supervisor/conf.d/supervisord.conf
RUN cat /etc/supervisor/conf.d/supervisord.conf
