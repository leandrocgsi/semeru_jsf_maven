Semeru JSF Maven
================

[![Build Status](https://travis-ci.org/leandrocgsi/semeru_jsf_maven.svg?branch=master)](https://travis-ci.org/leandrocgsi/semeru_jsf_maven)
[![Gitter](https://badges.gitter.im/leandrocgsi/semeru_jsf_maven.svg)](https://gitter.im/leandrocgsi/semeru_jsf_maven?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

Esse é um projeto simples desenvolvido no curso "Curso De JSF Do Zero À Nuvem" disponibilizado gratuitamente no [Youtube](https://www.youtube.com/playlist?list=PL18bbNo7xuh9d1AyAeC77O8xRz6hPD3iJ).

Frameworks e Tecnologias Utilizadas
================
* [JSF (Mojarra)](https://javaserverfaces.java.net/)
* [Primefaces](http://www.primefaces.org/)
* [JPA](http://www.oracle.com/technetwork/java/javaee/tech/persistence-jsp-140049.html)
* [Hibernate](http://hibernate.org/)
* [Maven](https://maven.apache.org/)
* [Spring Security](http://projects.spring.io/spring-security/)
* [MySQL](https://www.mysql.com/)
* [MySQL Administrator](https://downloads.mysql.com/archives/administrator/) - Que foi descontinuado e você pode substituir pelo [Heidi SQL](http://www.heidisql.com/)
* [Apache Tomcat](http://tomcat.apache.org/)

IDE's
================

O projeto foi desenvolvido no [Netbeans](https://netbeans.org/) mas roda em qualquer IDE como [Eclipse](https://eclipse.org) ou [IntelliJ IDEA](https://www.jetbrains.com/idea/) pois foi construído com o framework [Maven](https://maven.apache.org/). 

Como Fazer o Build do Projeto
================
Acesse a raiz do projeto (onde se encontra o arquivo pom.xml) e execute o comando:

```sh
mvn clean install -T 4C
```

Onde clean irá limpar o projeto e install irá buidá-lo -T 4C é opcional e servem para que o build seja executado mais rapidamente com threads em 4 núcleos do seu processador.

Restaurando/Criando o Banco de Dados
================

O banco de dados é criado automaticamente pelo Hibernate durante a primeira execução do projeto mas caso você julgue necessário você pode restaurar um backup do banco [disponível nesse link aqui](https://github.com/leandrocgsi/semeru_jsf_maven/blob/master/src/main/resources/ScriptsSQL/dump.sql) e restaurar usando o HeidiSQL ou sua ferramenta de banco de dados favorita.

O Spring Security
================

As senhas são convertidas para SHA1 antes de serem gravadas no banco. Para criar um novo usuário caso o banco esteja vazio você pode inserir manualmente na base e encriptar a senha em SHA1. Caso você prefira restaurar o backup a partir do script mencionado acima ao rodar o projeto poderá logar com as credenciais usuário: "admin" e senha: "admin".

Dúvidas Sobre o Projeto
================

Em caso de dúvidas você poderá acessar o [Gitter do projeto](https://gitter.im/leandrocgsi/semeru_jsf_maven?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge) ou acessar o blog [Semeru](http://semeru.com.br).
