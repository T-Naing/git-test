# Use an official Python runtime as a parent image
FROM python:3.12

# Set the working directory in the container
WORKDIR /home/jovyan

# Copy the requirements.txt file to the /home/jovyan directory
COPY requirements.txt /home/jovyan/requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files to the /home/jovyan directory
COPY . /home/jovyan/

# Define environment variables
ENV NB_USER jovyan
ENV NB_UID 1000

# Run Jupyter Notebook when the container launches
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser"]
