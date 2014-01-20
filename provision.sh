#############################################################
# Install Jenkins
#############################################################
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get -y install jenkins

#############################################################
# Install dependencies
#############################################################
apt-get -y install apache2
a2enmod proxy
a2enmod proxy_http

#############################################################
# Setup Apache proxy
#############################################################
cp /vagrant/VirtualHost/jenkins.conf /etc/apache2/sites-available
a2ensite jenkins.conf
service apache2 restart

