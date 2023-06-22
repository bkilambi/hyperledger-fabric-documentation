echo "starting the script \n"

echo "installing git \n "
sudo apt-get -y install git 

echo "installing cURL \n"
sudo apt-get -y install curl 

echo "installing docker \n" 
sudo apt-get -y install docker-compose 

echo "confirm latest version for docker and docker compose \n"
docker --version
docker-compose --version

echo "start docker \n"
sudo systemctl start docker 

username=$(whoami)

echo "add user to docker group \n"
sudo usermod  -a -G docker $username

echo "installing jq \n"
sudo apt -y install jq

echo "installing mongodb \n"
sudo apt update 
sudo apt -y install wget curl gnupg2 software-properties-common apt-transport-https ca-certificates lsb-release
curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-6.gpg
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt -y install mongodb-org
sudo systemctl enable --now mongod
sudo systemctl statusmongod
mongod --version

echo "installing nodejs \n"
sudo apt install -y nodejs

echo "installing npm \n"
sudo apt -y install npm

echo "installing node version manager \n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

echo "installing nvm correct verion \n"
nvm install -y 16.18.0
node -v

echo "making directory for hyperledger fabric \n"
mkdir hyperledger-fabric
cd hyperledger-fabric

echo "installing remaining prerequisites and hyperledger fabric \n"
curl -sSL https://bit.ly2ysbOFE | bash -s

docker ps

echo "exporting the path \n"
cd fabric-samples
cd bin
PWD=$pwd
cd ..
export PATH=$PATH+":"+$PWD

cd fabric-samples 
ls 

cd test-network

echo "activate network \n"
./network.sh up

echo "check that network is set up properly \n"
docker ps -a

echo "Finished......................>"
