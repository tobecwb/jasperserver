# JasperReports Server Community Edition
Docker image aiming to run **JasperServer Community Edition** in the quickest and simplest way, with the objective of developing and testing reports.

The image already has integrated PostgreSQL, Apache Tomcat and Chromium (for PDF export). There is no need for docker compose or other dockers with a database and other functions.

## Start the Container
### Using Command Line
To start the JasperServer container, execute `docker run` specifying this image:

E.g. `docker run -d --name jasperserver -p 8080:8080 tobe81cwb/jasperserver`


## Login to JasperReports Web
1. Go to URL http://${dockerHost}:8080/jasperserver/
2. Login using credentials: jasperadmin/jasperadmin


## Ports
* **8080**: Apache Tomcat
* **5432**: PostgreSQL


## Volumes
* **/home/jasper/jasperreports-server-cp-7.8.0/postgresql/data**


## Version name:
`v{JasperServer Version}-{image build version}` so, `v7.8.0-2` is `JasperServer Version 7.8.0`, and image version is `2` 


## History:
### `v7.8.0-1` - Initial release:
Initial image, with JasperServer 7.8.0 and default configuration

### `v7.8.0-2`:
* Enable file data sources in UI:
  - https://community.jaspersoft.com/documentation/tibco-jasperreports-server-administrator-guide/v780/file-data-sources


## How to build this image
Use `docker build -t tobe81cwb/jasperserver .` 
