docker network create my_netwwork

docker build -f Dockerfile.primary -t primary_image .

docker run -d --name primary_container --network my_network --hostname primary_image primary_image:latest

docker build -f Dockerfile.secondary -t secondary_image .

docker run -d --name secondary_container --network my_network --hostname secondary_image secondary_image:latest


Not sure if docker compose would work here or not as we need to specify the order 
in which these images would run. For instance primary would run first but can also be run second to test if connection to first image is 
ok. However a docker compose might provide common netwroking between the two images. 
