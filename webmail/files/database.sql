use {{database}}

CREATE TABLE virtual_domains (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE virtual_users (
id INT NOT NULL AUTO_INCREMENT,
domain_id INT NOT NULL,
password VARCHAR(106) NOT NULL,
email VARCHAR(120) NOT NULL,
maildir VARCHAR(120) NOT NULL,
PRIMARY KEY (ID),
UNIQUE KEY email (email),
FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO virtual_domains(id, name) VALUES('1', '{{domaine}}');
INSERT INTO virtual_users(id, domain_id, password, email, maildir) VALUES(1, 1, ENCRYPT('{{password_email}}', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), '{{email}}', '{{repertoire_email}}');
