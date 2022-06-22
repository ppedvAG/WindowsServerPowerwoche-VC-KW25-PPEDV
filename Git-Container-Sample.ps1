git clone https://github.com/MicrosoftDocs/Virtualization-Documentation.git

# Navigate into the sample directory
Set-Location -Path Virtualization-Documentation\windows-container-samples\asp-net-getting-started

# Create the Dockerfile for our project
New-Item -Name Dockerfile -ItemType file

docker build -t my-asp-app .

docker run -d -p 5000:80 --name myapp my-asp-app