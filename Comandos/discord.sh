#!bin/bash
# RUN AS ROOT
if [ $EUID -ne 0 ]
then
  echo -e "\033[1;31mRun script as root\033[0m" >&2
  exit 1
fi

# DOWNLOAD LATEST VERSION FOLLOWING API REDIRECTS
curl -L \
  --progress-bar \
  --request GET \
  --url 'https://discord.com/api/download?platform=linux&format=tar.gz' \
  --output discord.tar.gz

# CLEAR OLD INSTALLATION
rm -rf \
  /usr/share/discord\
  /bin/discord \
  /usr/share/applications/discord.desktop

# INSTALL
tar -xf discord.tar.gz

cp -r Discord /usr/share/discord

ln -s /usr/share/discord/Discord /bin/discord
ln -s /usr/share/discord/discord.desktop /usr/share/applications/discord.desktop

# CLEANUP
rm -rf Discord discord.tar.gz
