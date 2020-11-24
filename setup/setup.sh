#app_root
app_root=/usr/local/app;
if [ ! -d $app_root  ]; then
  mkdir -p /usr/local/app;
fi

#startup_file
startup_file=/usr/local/app/startup.sh;
if [ ! -f $startup_file  ]; then
  cp startup.sh /usr/local/app/startup.sh;
fi

#fonts_root
fonts_root=/usr/local/app/fonts
if [ ! -d $fonts_root  ]; then
  mkdir -p /usr/local/app/fonts;
fi
