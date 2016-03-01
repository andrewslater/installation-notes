https://willwarren.com/2014/07/03/roll-dynamic-dns-service-using-amazon-route53/

    sudo aptitude install awscli

Set up IAM access credentials (use domain-manager user)
    
    $ aws configure
    Access Key ID: <enter aws access key> 
    Secret Access Key: <enter aws secret key> 

Create [/home/ubuntu/update-route53.sh](scripts/update-route53.sh)

Add cron entry to run script at boot and every 30 min (Example shows multiple subdomains being shared by the same server)
    
    $ crontab -e
    @reboot ubuntu /home/ubuntu/update-route53.sh {build,jenkins,nexus}.example.com
    */30 * * * * /home/ubuntu/update-route53.sh {build,jenkins,nexus}.example.com


