cd ..
cd ..
path=`pwd`
printf "[Unit]\nDescription=Nabu Platform Service\n\n[Service]\nExecStart=java -Dglass.platform=Monocle -Dmonocle.platform=Headless -Ddevelopment=false -Dversion=2 -cp \"$path/lib/*:$path\" be.nabu.eai.server.Standalone properties=$path/server.properties\nKillMode=process\nRestart=on-failure\n\n[Install]\nWantedBy=multi-user.target\n" > $path/nabu.service

# enable the system service
sudo systemctl enable "$path/nabu.service"