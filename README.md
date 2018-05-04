My customize of https://github.com/eugeneware/docker-wordpress-nginx
(php7.2, ubuntu 16.04)


### Build

    docker build -t zuqqhi2/docker-wordpress-nginx .

### SSL Setting

1.Set DNS Record
2.Check with browser
3.Update wordpress URL in dashboard
4.Run activate-ssl script

    docker exec -it ${CONTAINER_ID} /activate-ssl.sh full ${DOMAIN_NAME}

5. Check with browser
