Running the Project
Build the Docker image:

docker build -t python-nodejs-app .


Run the container:

docker run -p 8080:8080 -p 5000:5000 python-nodejs-app


Accessing the Apps
Python API: Access at http://localhost:5000/api/python
Node.js API: Access at http://localhost:8080/api/node


This setup provides a simple example of running both Python and Node.js apps in a single Docker container, making it easy to expand or add more features as needed.