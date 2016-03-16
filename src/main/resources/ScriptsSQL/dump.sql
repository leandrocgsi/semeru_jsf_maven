-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.8


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema semeru_jsf_maven_db
--

CREATE DATABASE IF NOT EXISTS semeru_jsf_maven_db;
USE semeru_jsf_maven_db;

--
-- Definition of table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
CREATE TABLE `cidade` (
  `IdCidade` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(80) NOT NULL,
  PRIMARY KEY (`IdCidade`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cidade`
--

/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` (`IdCidade`,`Nome`) VALUES 
 (1,'PATOS DE MINAS'),
 (3,'PATROCÍNIO'),
 (5,'UBERLÂNDIA'),
 (6,'UBERABA'),
 (13,'ARAGUARI'),
 (20,'GOIÂNIA'),
 (21,'BRASÍLIA'),
 (22,'FORTALEZA'),
 (24,'JOÃO PESSOA'),
 (25,'CAMAÇARI'),
 (26,'ANARQUILÓPOLIS');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;


--
-- Definition of table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE `endereco` (
  `IdEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `Bairro` varchar(80) DEFAULT NULL,
  `CEP` varchar(9) DEFAULT NULL,
  `Complemento` int(11) DEFAULT NULL,
  `NomeLogradouro` varchar(80) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `IdCidade` int(11) NOT NULL,
  `IdEstado` int(11) NOT NULL,
  `IdPessoa` int(11) DEFAULT NULL,
  `IdTipoEndereco` int(11) NOT NULL,
  `IdTipoLogradouro` int(11) NOT NULL,
  PRIMARY KEY (`IdEndereco`),
  KEY `EnderecoTipoLogradouro` (`IdTipoLogradouro`),
  KEY `EnderecoCidade` (`IdCidade`),
  KEY `EnderecoTipoEndereco` (`IdTipoEndereco`),
  KEY `EnderecoEstado` (`IdEstado`),
  KEY `EnderecoPessoa` (`IdPessoa`),
  CONSTRAINT `EnderecoCidade` FOREIGN KEY (`IdCidade`) REFERENCES `cidade` (`IdCidade`),
  CONSTRAINT `EnderecoEstado` FOREIGN KEY (`IdEstado`) REFERENCES `estado` (`IdEstado`),
  CONSTRAINT `EnderecoPessoa` FOREIGN KEY (`IdPessoa`) REFERENCES `pessoa` (`IdPessoa`),
  CONSTRAINT `EnderecoTipoEndereco` FOREIGN KEY (`IdTipoEndereco`) REFERENCES `tipoendereco` (`IdTipoEndereco`),
  CONSTRAINT `EnderecoTipoLogradouro` FOREIGN KEY (`IdTipoLogradouro`) REFERENCES `tipologradouro` (`IdTipoLogradouro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `endereco`
--

/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` (`IdEndereco`,`Bairro`,`CEP`,`Complemento`,`NomeLogradouro`,`Numero`,`IdCidade`,`IdEstado`,`IdPessoa`,`IdTipoEndereco`,`IdTipoLogradouro`) VALUES 
 (1,'AHFGSDGFS','11111-111',0,'WERTYUI',21,1,11,1,1,1);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;


--
-- Definition of table `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `IdEstado` int(11) NOT NULL AUTO_INCREMENT,
  `NomeEstado` varchar(40) NOT NULL,
  PRIMARY KEY (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estado`
--

/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`IdEstado`,`NomeEstado`) VALUES 
 (1,'ACRE'),
 (2,'ALAGOAS'),
 (3,'AMAZONAS'),
 (4,'AMAPÁ'),
 (5,'BAHIA'),
 (6,'CEARÁ'),
 (7,'DISTRITO FEDERAL'),
 (8,'ESPÍRITO SANTO'),
 (9,'GOIÁS'),
 (10,'MARANHÃO'),
 (11,'MINAS GERAIS'),
 (12,'MATO GROSSO DO SUL'),
 (13,'MATO GROSSO'),
 (14,'PARÁ'),
 (15,'PARAÍBA'),
 (16,'PERNAMBUCO'),
 (17,'PIAUÍ'),
 (18,'PARANÁ'),
 (19,'RIO DE JANEIRO'),
 (20,'RIO GRANDE DO NORTE'),
 (21,'RORAIMA'),
 (22,'RONDÔNIA'),
 (23,'RIO GRANDE DO SUL'),
 (24,'SANTA CATARINA'),
 (25,'SERGIPE'),
 (26,'SÃO PAULO'),
 (27,'TOCANTINS');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;


--
-- Definition of table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
CREATE TABLE `pessoa` (
  `IdPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `CPF` varchar(14) NOT NULL,
  `DataDeCadastro` date NOT NULL,
  `DataDeNascimento` date NOT NULL,
  `Email` varchar(80) NOT NULL,
  `Name` varchar(80) NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  `IdSexo` int(11) NOT NULL,
  `Login` varchar(25) DEFAULT NULL,
  `Permissao` varchar(36) DEFAULT NULL,
  `Senha` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`IdPessoa`),
  UNIQUE KEY `Login` (`Login`),
  KEY `PessoaSexo` (`IdSexo`),
  CONSTRAINT `PessoaSexo` FOREIGN KEY (`IdSexo`) REFERENCES `sexo` (`IdSexo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pessoa`
--

/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` (`IdPessoa`,`CPF`,`DataDeCadastro`,`DataDeNascimento`,`Email`,`Name`,`Telefone`,`IdSexo`,`Login`,`Permissao`,`Senha`) VALUES 
 (1,'12345667644','2013-01-12','2013-01-01','teste@live.com','ADMIN','(11) 1111-1111',1,'admin','ROLE_ADMIN','d033e22ae348aeb5660fc2140aec35850c4da997');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;


--
-- Definition of table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
CREATE TABLE `sexo` (
  `IdSexo` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(9) NOT NULL,
  PRIMARY KEY (`IdSexo`),
  UNIQUE KEY `Descricao` (`Descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sexo`
--

/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` (`IdSexo`,`Descricao`) VALUES 
 (2,'FEMININO'),
 (1,'MASCULINO');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;


--
-- Definition of table `tipoendereco`
--

DROP TABLE IF EXISTS `tipoendereco`;
CREATE TABLE `tipoendereco` (
  `IdTipoEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `DescricaoTipoEndereco` varchar(35) NOT NULL,
  PRIMARY KEY (`IdTipoEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipoendereco`
--

/*!40000 ALTER TABLE `tipoendereco` DISABLE KEYS */;
INSERT INTO `tipoendereco` (`IdTipoEndereco`,`DescricaoTipoEndereco`) VALUES 
 (1,'RESIDENCIAL'),
 (2,'COMERCIAL'),
 (3,'RODOVIA'),
 (4,'FAZENDA'),
 (5,'INDÚSTRIA'),
 (6,'CHÁCARA'),
 (7,'VILA');
/*!40000 ALTER TABLE `tipoendereco` ENABLE KEYS */;


--
-- Definition of table `tipologradouro`
--

DROP TABLE IF EXISTS `tipologradouro`;
CREATE TABLE `tipologradouro` (
  `IdTipoLogradouro` int(11) NOT NULL AUTO_INCREMENT,
  `DescricaoTipoLogradouro` varchar(40) NOT NULL,
  PRIMARY KEY (`IdTipoLogradouro`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipologradouro`
--

/*!40000 ALTER TABLE `tipologradouro` DISABLE KEYS */;
INSERT INTO `tipologradouro` (`IdTipoLogradouro`,`DescricaoTipoLogradouro`) VALUES 
 (1,'RUA'),
 (2,'ALAMEDA'),
 (3,'AVENIDA'),
 (4,'VIELA'),
 (5,'BECO'),
 (6,'TRAVESSA'),
 (7,'PRAÇA');
/*!40000 ALTER TABLE `tipologradouro` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
