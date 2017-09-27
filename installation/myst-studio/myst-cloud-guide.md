

## Installation on Oracle Container Cloud Service


login.sh -output

```
version: '2'
services:
  web:
    image: 067343992071.dkr.ecr.us-west-2.amazonaws.com/myst-studio:oow17
    ports:
     - "8085:8080"
    links:
     - "db"
     - "repo"
    expose:
     - "8080" 
  db:
    image: mysql:5.7.17
    environment:
     - MYSQL_ROOT_PASSWORD=welcome1
     - MYSQL_DATABASE=fusioncloud 
     - MYSQL_USER=fusioncloud
     - MYSQL_PASSWORD=welcome1
    expose:
     - "3306"
  oauth2proxy:
    image: 067343992071.dkr.ecr.us-west-2.amazonaws.com/oauth2proxy
  ci:
    image: 067343992071.dkr.ecr.us-west-2.amazonaws.com/myst/jenkins/myhealth-demo
    links:
     - "web"
     - "repo"
    ports:
     - "8081:8080"  
  repo:
    image: 067343992071.dkr.ecr.us-west-2.amazonaws.com/myst/artifactory
    ports:
     - "8083:8081"
  https:
    image: 067343992071.dkr.ecr.us-west-2.amazonaws.com/myst/https/myhealth-demo
    ports:
     - "443:443"
     - "80:80"
    links:
     - "web" 
     - "repo"
     - "ci"
```

    command: oauth2_proxy --email-domain="rubiconred.com" --upstream=http://books/ --client-id=279173790648-shle9464orla2raf8o381ki0585k6dtt.apps.googleusercontent.com --client-secret=p2hZD-9SuzjoR7x-OPLlTF4s --cookie-secret=1-YOO_cscSgYzgPtbjKmYw==

Put this within HTTP

    server {  
      server_name moce.testdrive.fusioncloud.com;  
      listen 80;  
      
      location / {  
        proxy_set_header        Host $host;  
        proxy_set_header        X-Real-IP $remote_addr;  
        proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;  
        proxy_set_header        X-Forwarded-Proto $scheme;  
      
        proxy_read_timeout  90;  
        proxy_pass http://web:8080;  
      }  
    } 

https://129.144.253.160/api/v2/registries/validate
{"username":"AWS","password":"eyJwYXlsb2FkIjoibDBiNk9xdHIzTHNndnJVTmx1UTIzMDJneGs5Qlk5Sm1DMmN5K1ZEOHZxMWFSYlNhME16QW1wa0toZjNlUCsxN3VkMmhXQlE1OEtZMm1LbFZlRkNacmdFZDFQbkxCbzdCcitoa1kzcDVjbFdKZi9jRXNhZkJuaTdXRWRISUZ1VTlJdk1mRUY4REgvNjlhY0VLWWU4UjE1bHRZc3p2eGFJeGF1Vm4wNlFVbElTZkJDUzMwWmRHcjNpNmQ0QzVGVXFyc2ZONDV4dnRCRk9yR3l3K1ZJN2tEeXR5VjVHbnBic0RNS3gyanJiM1d4bmNUR2lUNEhJQSt5N2h6K3dNaUlxUHIvZUQ1OEljRWpkK1Uwb2dxWTJYdGRUU05jaTI4NWFxQnp1SVJJb21Ib2NRRzhOVTJSbDNQWTdGQkhKZWdhVVhKbXU5a2xZcGM3bjZJTU1sNTlhTTZ6QWUyQmhtUnlZdE5BL3NrOEQ1R3RLZlpMaEtVNFJXR1c4Vm1yZ3hVNlV6YkgvYTRiSjZUZzZzcVUzMGJVc3pEbUM1NjdtQkpxWk5aU2tXZ2ZyWW4wOUZRK1ZtS0ZiOEt4REc3TFZMVzhuSlVBSk10WUhlQ1krNDhrc2dKT2dVaFhOVFdlSzF6a1VIUVBhTHJ3MURjUkJKK3RLeTdBTVRLMXJ5emxNb2hOd2hyQmVJRHhpUUlKbWY3cHhuNXhBTkpIeU5WSjFWUkpHeW9mc3U2VXpDTHNWVnhsdzhCQzNZaVZyVndtTFZHeThuWmJqRXNJeENkK214SW8yM3FsKzhiZjNFZlR6U3NFd0x2STFDenJldGxGMXNuVmdNZHJ3d0NSYWRPOGZhVDhPczNwVkRpVnZqZzA4VmNqZ2EzbVB3dlIrKzB2bTNRS3cyLzJ0RURnUFhYTnlDaWc4N3BxU3dqY1dlVjQrc1FHK0RuVDU1c1BPYXBPRWhXVjgwT051RDYxN3kyNzQvNVRPT09lZGE0TDYvZHVwa1h2QmdEcU9Cc3FhNW53WFhiYlF5VWlPRzlOOUR5dUpUVER1dGcrTlBubnBlNktJQlZmMDkxd3RhL25BaTNYd0RoM2lTaUIyU0IyMkhFdHBvMkJCbjNpRFkzQWNrY09qZlRlSGxXN1l4Rlp3Ulk0RHowTXk4elZISGpTbWE3V1RPdEZMb2cxMXBmaDdIa2pTZXk5NytRTkh2QWxrZk1sbWhrWW96b0F0b281MzNWN0ZBQ1hsWE5IamZwL0FubUJpUExkd245YVd5dTdlR3VhMk9vSWVSTm1VUDF6Vy9VbTBqYUJvSDNuZUJpYnVId0x3eUZYRngzaFhYclhVSnAwTjE1MlAwZHpwTWllVkduYzZVbDJETU9aK0NUcjJJdHdzMHVnV0ZWbG1SWHI2Rjc1ckJqTklnTXR5OFFNY21uU0w3bis5Y0VXam1adEpqS1p6biIsImRhdGFrZXkiOiJBUUVCQUhqNmxjNFhJSncvN2xuMEhjMDBETWVrNkdFeEhDYlk0UklwVE1DSTU4SW5Vd0FBQUg0d2ZBWUpLb1pJaHZjTkFRY0dvRzh3YlFJQkFEQm9CZ2txaGtpRzl3MEJCd0V3SGdZSllJWklBV1VEQkFFdU1CRUVES3laeU1MY1Q4RGlWalFYSndJQkVJQTdZbllZRmQ4SkRvcVEvdjB3anN0MSt0ZXBhWmtBT1VyNFYvRU9pQTRpcTQ4dHRLUE5IOS9RSkEyRXU2WHFpanZQdXZ6Z0dEUzNZaVNvbUZjPSIsInZlcnNpb24iOiIxIiwidHlwZSI6IkRBVEFfS0VZIn0=","url":"https://067343992071.dkr.ecr.us-west-2.amazonaws.com","description":"Rubicon Red MyST Registry"}




https://129.144.253.160/api/v2/registries/
POST
{"username":"AWS","password":"eyJwYXlsb2FkIjoibDBiNk9xdHIzTHNndnJVTmx1UTIzMDJneGs5Qlk5Sm1DMmN5K1ZEOHZxMWFSYlNhME16QW1wa0toZjNlUCsxN3VkMmhXQlE1OEtZMm1LbFZlRkNacmdFZDFQbkxCbzdCcitoa1kzcDVjbFdKZi9jRXNhZkJuaTdXRWRISUZ1VTlJdk1mRUY4REgvNjlhY0VLWWU4UjE1bHRZc3p2eGFJeGF1Vm4wNlFVbElTZkJDUzMwWmRHcjNpNmQ0QzVGVXFyc2ZONDV4dnRCRk9yR3l3K1ZJN2tEeXR5VjVHbnBic0RNS3gyanJiM1d4bmNUR2lUNEhJQSt5N2h6K3dNaUlxUHIvZUQ1OEljRWpkK1Uwb2dxWTJYdGRUU05jaTI4NWFxQnp1SVJJb21Ib2NRRzhOVTJSbDNQWTdGQkhKZWdhVVhKbXU5a2xZcGM3bjZJTU1sNTlhTTZ6QWUyQmhtUnlZdE5BL3NrOEQ1R3RLZlpMaEtVNFJXR1c4Vm1yZ3hVNlV6YkgvYTRiSjZUZzZzcVUzMGJVc3pEbUM1NjdtQkpxWk5aU2tXZ2ZyWW4wOUZRK1ZtS0ZiOEt4REc3TFZMVzhuSlVBSk10WUhlQ1krNDhrc2dKT2dVaFhOVFdlSzF6a1VIUVBhTHJ3MURjUkJKK3RLeTdBTVRLMXJ5emxNb2hOd2hyQmVJRHhpUUlKbWY3cHhuNXhBTkpIeU5WSjFWUkpHeW9mc3U2VXpDTHNWVnhsdzhCQzNZaVZyVndtTFZHeThuWmJqRXNJeENkK214SW8yM3FsKzhiZjNFZlR6U3NFd0x2STFDenJldGxGMXNuVmdNZHJ3d0NSYWRPOGZhVDhPczNwVkRpVnZqZzA4VmNqZ2EzbVB3dlIrKzB2bTNRS3cyLzJ0RURnUFhYTnlDaWc4N3BxU3dqY1dlVjQrc1FHK0RuVDU1c1BPYXBPRWhXVjgwT051RDYxN3kyNzQvNVRPT09lZGE0TDYvZHVwa1h2QmdEcU9Cc3FhNW53WFhiYlF5VWlPRzlOOUR5dUpUVER1dGcrTlBubnBlNktJQlZmMDkxd3RhL25BaTNYd0RoM2lTaUIyU0IyMkhFdHBvMkJCbjNpRFkzQWNrY09qZlRlSGxXN1l4Rlp3Ulk0RHowTXk4elZISGpTbWE3V1RPdEZMb2cxMXBmaDdIa2pTZXk5NytRTkh2QWxrZk1sbWhrWW96b0F0b281MzNWN0ZBQ1hsWE5IamZwL0FubUJpUExkd245YVd5dTdlR3VhMk9vSWVSTm1VUDF6Vy9VbTBqYUJvSDNuZUJpYnVId0x3eUZYRngzaFhYclhVSnAwTjE1MlAwZHpwTWllVkduYzZVbDJETU9aK0NUcjJJdHdzMHVnV0ZWbG1SWHI2Rjc1ckJqTklnTXR5OFFNY21uU0w3bis5Y0VXam1adEpqS1p6biIsImRhdGFrZXkiOiJBUUVCQUhqNmxjNFhJSncvN2xuMEhjMDBETWVrNkdFeEhDYlk0UklwVE1DSTU4SW5Vd0FBQUg0d2ZBWUpLb1pJaHZjTkFRY0dvRzh3YlFJQkFEQm9CZ2txaGtpRzl3MEJCd0V3SGdZSllJWklBV1VEQkFFdU1CRUVES3laeU1MY1Q4RGlWalFYSndJQkVJQTdZbllZRmQ4SkRvcVEvdjB3anN0MSt0ZXBhWmtBT1VyNFYvRU9pQTRpcTQ4dHRLUE5IOS9RSkEyRXU2WHFpanZQdXZ6Z0dEUzNZaVNvbUZjPSIsInZlcnNpb24iOiIxIiwidHlwZSI6IkRBVEFfS0VZIn0=","url":"https://067343992071.dkr.ecr.us-west-2.amazonaws.com","description":"Rubicon Red MyST Registry","email":"craig.barr@rubiconred.com"}



https://129.144.253.160/api/v2/registries/f33c458d6979d8d0
PUT
{"registry_id":"f33c458d6979d8d0","url":"067343992071.dkr.ecr.us-west-2.amazonaws.com","email":"craig.barr@rubiconred.com","username":"AWS","password":"eyJwYXlsb2FkIjoicXlxRjdSMi9tcVRWMnZoZnNrbi9Tam41MUtwM2pINS96dXNzQ1FzYlM2SHhHZU94ZXU4ZnpiWURrcDVYbmRROEtWYy9xWmlxQTZzZGQrVWhCTVM2aCtlbFRyN2R4cGRiYlRpcExDMFc4eGxrVHJDZ0lic1NBVFZ2djFjNUYwVUl1M3BjR3VXL1ZVWFhJczQyaURYTVJVTjVSZjdCVmhIV1BGcVFkcXFiRjdrMnRpanF0ZkUrdWtjNU05ZWdkZjR2U0xSc3o1aUM5dkJYZzk1NktWQ2tVcnJOZG9HaUhRbHdjbzdUVnJSS3pja08vWHB5NlJEL3p2QzdBdkJLN0QvZThEQWpPVDJYbFEvdyttVGV3WWpsSnhGZWd0ZUM2SnVmYStURWsrMWJmR0pOajRKQ05ZV2JBU3ZvemhRNEJNOXAxMEZ2ZkRsd0R1QUc0eFFkdlJIRFRCNUVVMXdmeWpLVlJSUTA2Y1NncDZjdk9hZDVVQmI1b2hjdkxnZ2NmdXhMb3I1UE9ZVWx2N2RINkp2U3dwbG0rSE5FZlVLMWEzck1VZ2JlTTZ3cVY4aEM0TGFvWjBBNEtxZEUvL2lIZ3k3QmVmOHluRENxTGV4bytVaHgwRXU4RWJ6WGhkWkZ1TzI4M2o4TjQ3RVpKY3Y4MzJwcVlZejB4bXU5bTZwcFhGYkdSWGtnK0pxRndWWVgvaERUemVpeTBpdFhieUhYZDJtTlYvWUdmN2VpNEFFL012S2lLMW5QTldVUjhXNlNiOXd5M1BjQ0RlQnl6UFo5VldUaENMWGFQRm0xTkpobFRsMndQSjhCb0tqMUdSaDhRa2d6YXpBZ1EvNFNJL3pLZmRCT2hpNDFyMFFCejV4dkNpNlJRS1RWYlY5c3ZTUFN1T1QxRFBvd2hPeFZrOUliT0V2ZVBkL085bXlIQ1JMZzVSRlFvOWFYRDVOS1VodFpReTkvQVZwbkRXRXlqMGNRTEozcE9BT1VOUG5wZzJ3Z2dtQnBpWmJ5WDVRS1VUaTBEYWZyM1B6bENqQ1dGY3lBbW4rckhCYTVpbzRKQkVONDFNOCsvVjc0cUlHZXRoVStHTkR3TVlpSHBuVFEzT3ZURFMxVUpUMmw2T2Z3ZUJWMVRtbFNHZStBb21ucDVhVWZkVGFCb3N1L0xTczdhZ2dQaGpoY3JVM0pVMFdBMmVjYkN3RDNhc3B5eHVjbDNKakVCdTlnZ1ltVnE0Q3RSSDBCQ051RSt3dVJLMEJUa29RbHoxbjhFcEcxSEtIZzNXTGs2dStWbUpIMDB6OHdNelVDaXJqWEpTa1p3NTVVSEhSNU5jZkhOU1ErL1ZKeXVHblY3Zk41clQ4ckd1RTJkNE1UdDE1MlNGMlUvVGJIYVJMU2l0QUtGaVN5YWg0L0puSjRsdTJrYVZlYVJMMXhSZUYvcjd5V1J1OVhjUzdmN0RMWiIsImRhdGFrZXkiOiJBUUVCQUhqNmxjNFhJSncvN2xuMEhjMDBETWVrNkdFeEhDYlk0UklwVE1DSTU4SW5Vd0FBQUg0d2ZBWUpLb1pJaHZjTkFRY0dvRzh3YlFJQkFEQm9CZ2txaGtpRzl3MEJCd0V3SGdZSllJWklBV1VEQkFFdU1CRUVETm1YQ3ZKdHJwbVEwU3FIT0FJQkVJQTc5S09IRmZjeWY3Si9tV29uQVlGVnBITzdsOStpdG5QekQxZ1p4WTVyVWNEU2s3RnZzOElZRG9reis2ZGh4ZnVGVEwvV0xkM01OZTlhUmxFPSIsInZlcnNpb24iOiIxIiwidHlwZSI6IkRBVEFfS0VZIn0=","description":"Rubicon Red MyST Registry"}
