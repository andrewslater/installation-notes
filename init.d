# Create init.d symlink for the service (e.g. Spring Boot fully executable jar)
sudo ln -s /home/webapp/webapp.jar /etc/init.d/webapp

# Configure /etc/init.d/webapp to automatically start on boot
sudo update-rc.d webapp defaults

# Stop service from automatically starting
sudo update-rc.d webapp remove
