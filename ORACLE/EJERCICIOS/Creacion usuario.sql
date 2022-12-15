alter session set "_oracle_script"=true;  
create user EDITORIAL identified by EDITORIAL;
GRANT CONNECT, RESOURCE, DBA TO EDITORIAL;