FROM debian:buster

ARG FTP_USER_NAME=$FTP_USER_NAME
ARG FTP_USER_PASS=$FTP_USER_PASS
ARG FTP_USER_HOME=$FTP_USER_HOME

RUN apt-get update
RUN apt-get install vsftpd vim -y

RUN useradd ${FTP_USER_NAME}
RUN echo ${FTP_USER_NAME}:${FTP_USER_PASS} | chpasswd 
RUN echo ${FTP_USER_NAME} | tee -a  /etc/vsftpd.userlist

RUN echo "write_enable=YES" >> /etc/vsftpd.conf
RUN echo "chroot_local_user=YES" >> /etc/vsftpd.conf
RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
RUN sed -i 's/secure_chroot_dir=\/var\/run\/vsftpd\/empty/secure_chroot_dir=\/home\/misaki/' /etc/vsftpd.conf
RUN echo "pasv_enable=YES" >> /etc/vsftpd.conf
RUN echo "pasv_min_port=40000" >> /etc/vsftpd.conf
RUN echo "pasv_max_port=40009" >> /etc/vsftpd.conf
RUN echo "userlist_enable=YES" >> /etc/vsftpd.conf
RUN echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
RUN echo "userlist_deny=NO" >> /etc/vsftpd.conf

RUN mkdir -p ${FTP_USER_HOME}/ftp
RUN chown -R ${FTP_USER_NAME}:${FTP_USER_PASS} ${FTP_USER_HOME}

EXPOSE 21 40000-40009

CMD echo "My Portfolio is Running.." ; vsftpd