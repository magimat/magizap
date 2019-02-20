FROM arm32v7/perl

ADD zap2xml.pl /zap2xml.pl

RUN chmod 777 /zap2xml.pl

RUN cpan HTTP::Cookies
RUN cpan LWP::UserAgent
RUN cpan JSON

RUN apt-get update 
RUN apt-get install -y cron

ADD crontab /etc/cron.d/tv-cron
RUN chmod 0644 /etc/cron.d/tv-cron

RUN crontab /etc/cron.d/tv-cron

ADD go.sh /usr/local/bin/go.sh

RUN chmod 777 /usr/local/bin/go.sh

CMD /usr/local/bin/go.sh