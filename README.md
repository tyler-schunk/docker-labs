# Setup Docker w/ JuiceShop container 
1. In your host OS terminal, run `docker run -d -p 3000:3000 bkimminich/juice-shop:latest`
2. Confirm the container is running in Docker Desktop and access using the following link: http://localhost:3000

# Setup Docker w/ Attack Box & JuiceShop containers 
1. Download the [compose.yaml](https://github.com/tyler-schunk/docker-labs/blob/main/compose.yaml) file to a dedicated folder on your computer.
2. Navigate to the folder in the terminal.
3. Run the command "docker compose up --detach"
4. Confirm the containers are running in docker desktop.
![image](https://github.com/user-attachments/assets/23106162-f1d6-4af3-ad2d-13867a936768)
5. Services should be accessable using the following links:
    1. OWASP Juice Shop: http://localhost:3000/
    2. KASM Kali: https://localhost:6901/  - I've seen issues accessing via Firefox so make sure to try other browsers. Confirmed to be working on Chrome.
        1. user: kasm_user
        2. pass: password
6. After loggin into KASM Kali, run the following commands in the terminal.
    1. `wget https://raw.githubusercontent.com/tyler-schunk/docker-labs/refs/heads/main/attackbox-setup.sh`
    2. `chmod +x attackbox-setup.sh`
    3. `./attackbox-setup.sh`
8. Your attackbox should be ready now.
