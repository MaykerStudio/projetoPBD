-- MySQL Script generated by MySQL Workbench
-- Fri Sep 13 06:03:34 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema argus
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema argus
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `argus` DEFAULT CHARACTER SET utf8 ;
USE `argus` ;

-- -----------------------------------------------------
-- Table `argus`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Alunos` (
  `Nome` VARCHAR(60) NOT NULL,
  `codPessoa` INT NOT NULL,
  `codCurriculo` ENUM("EF-Iniciais", "EF-Finais", "EM") NOT NULL,
  `codMae` INT NOT NULL,
  `codPai` INT NOT NULL,
  `codReponsávelFin` INT NOT NULL,
  `Status` ENUM("Ativo", "Inativo") NOT NULL,
  `codTurma` INT NOT NULL,
  PRIMARY KEY (`codPessoa`, `codCurriculo`, `codMae`, `codPai`, `codReponsávelFin`),
  INDEX `index_codMae` (`codMae` ASC) VISIBLE,
  INDEX `index_codPai` (`codPai` ASC) VISIBLE,
  INDEX `index_codPessoa_aluno` (`codPessoa` ASC) VISIBLE,
  INDEX `index_responsavel` (`codReponsávelFin` ASC) VISIBLE,
  INDEX `index_codCurriculo_aluno` (`codCurriculo` ASC) VISIBLE,
  INDEX `index_Nome_aluno` (`Nome` ASC) VISIBLE,
  INDEX `index_codTurma_aluno` (`codTurma` ASC) VISIBLE,
  CONSTRAINT `fk_codMae`
    FOREIGN KEY (`codMae`)
    REFERENCES `argus`.`Pais` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codPai`
    FOREIGN KEY (`codPai`)
    REFERENCES `argus`.`Pais` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codPessoa_aluno`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `argus`.`Pessoas` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codCurriculo_aluno`
    FOREIGN KEY (`codCurriculo`)
    REFERENCES `argus`.`Curriculo` (`codCurriculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Nome_aluno`
    FOREIGN KEY (`Nome`)
    REFERENCES `argus`.`Pessoas` (`Nome`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Responsavel_aluno`
    FOREIGN KEY (`codReponsávelFin`)
    REFERENCES `argus`.`Pessoas` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codTurma_aluno`
    FOREIGN KEY (`codTurma`)
    REFERENCES `argus`.`Turmas` (`codTurma`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Contatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Contatos` (
  `codPessoa` INT NOT NULL,
  `Telefone` VARCHAR(13) NULL,
  `Celular` VARCHAR(14) NULL,
  `Email` VARCHAR(45) NULL,
  `whatsapp` TINYINT NOT NULL,
  PRIMARY KEY (`codPessoa`),
  INDEX `index_codPessoa_cont` (`codPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_codPessoa_cont`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `argus`.`Pessoas` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Curriculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Curriculo` (
  `codCurriculo` ENUM("EF-Iniciais", "EF-Finais", "EM") NOT NULL,
  `AnoLetivo` YEAR(4) NOT NULL,
  `codTurma` INT NOT NULL,
  `Tipo` ENUM("Bimestral", "Semestral") NOT NULL,
  PRIMARY KEY (`codCurriculo`, `AnoLetivo`, `codTurma`, `Tipo`),
  INDEX `index_AnoLetivo_cur` (`AnoLetivo` ASC) INVISIBLE,
  UNIQUE INDEX `codTurma_UNIQUE` (`codTurma` ASC) VISIBLE,
  INDEX `index_codTurma_curriculo` (`codTurma` ASC) VISIBLE,
  CONSTRAINT `fk_codTurma_curriculo`
    FOREIGN KEY (`codTurma`)
    REFERENCES `argus`.`Turmas` (`codTurma`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Curriculo-Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Curriculo-Disciplina` (
  `codCurriculo` ENUM("EF-Iniciais", "EF-Finais", "EM") NOT NULL,
  `codDisciplina` INT NOT NULL,
  PRIMARY KEY (`codCurriculo`, `codDisciplina`),
  INDEX `index_codCurriculo_CD` (`codCurriculo` ASC) VISIBLE,
  INDEX `index_codDisciplina_CD` (`codDisciplina` ASC) VISIBLE,
  CONSTRAINT `fk_codCurriculo_CD`
    FOREIGN KEY (`codCurriculo`)
    REFERENCES `argus`.`Curriculo` (`codCurriculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codDisciplina_CD`
    FOREIGN KEY (`codDisciplina`)
    REFERENCES `argus`.`Disciplinas` (`codDisciplina`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Disciplinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Disciplinas` (
  `codDisciplina` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(20) NOT NULL,
  `CargaHoraria` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`codDisciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Enderecos` (
  `codPessoa` INT NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `Numero` INT NOT NULL,
  `Complemento` VARCHAR(45) NULL,
  `Bairro` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codPessoa`),
  INDEX `INDEX_codPessoa` (`codPessoa` ASC) INVISIBLE,
  CONSTRAINT `fk_codPessoa_end`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `argus`.`Pessoas` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`LogSistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`LogSistema` (
  `codPessoa` INT NOT NULL,
  `Acao` VARCHAR(100) NOT NULL,
  `Data` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  PRIMARY KEY (`codPessoa`, `Data`, `Hora`),
  INDEX `index_codPessoas_log` (`codPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_codPessoa_log`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `argus`.`Usuarios` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`MudancaDeSenhas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`MudancaDeSenhas` (
  `CPF` VARCHAR(14) NOT NULL,
  `NovaSenha` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`CPF`),
  INDEX `index_CPF_ms` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  CONSTRAINT `fk_CPF_ms`
    FOREIGN KEY (`CPF`)
    REFERENCES `argus`.`Usuarios` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Notas` (
  `codAluno` INT NOT NULL,
  `codDisciplina` INT NOT NULL,
  `AnoLetivo` VARCHAR(45) NOT NULL,
  `Nota` FLOAT NOT NULL,
  `Situação` ENUM("Pendente", "AM", "AP", "RP") NOT NULL,
  PRIMARY KEY (`codAluno`, `codDisciplina`, `AnoLetivo`),
  INDEX `index_codAluno` (`codAluno` ASC) INVISIBLE,
  INDEX `index_codDisciplina_notas` (`codDisciplina` ASC) INVISIBLE,
  CONSTRAINT `fk_codAluno_notas`
    FOREIGN KEY (`codAluno`)
    REFERENCES `argus`.`Alunos` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codDisciplina_notas`
    FOREIGN KEY (`codDisciplina`)
    REFERENCES `argus`.`Disciplinas` (`codDisciplina`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Pagamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Pagamentos` (
  `codResponsavel` INT NOT NULL,
  `codCurriculo` ENUM("EF-Iniciais", "EF-Finais", "EM") NOT NULL,
  `codAluno` INT NOT NULL,
  `codBarras` VARCHAR(100) NOT NULL,
  `NumeroDaParcela` INT NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codResponsavel`, `codCurriculo`, `codAluno`, `codBarras`, `NumeroDaParcela`),
  UNIQUE INDEX `codBarras_UNIQUE` (`codBarras` ASC) VISIBLE,
  INDEX `index_codAluno_pag` (`codAluno` ASC) INVISIBLE,
  INDEX `index_codCurriclo_pag` (`codCurriculo` ASC) INVISIBLE,
  INDEX `index_codResponsavel_pag` (`codResponsavel` ASC) INVISIBLE,
  CONSTRAINT `fk_codCurriclo_pag`
    FOREIGN KEY (`codCurriculo`)
    REFERENCES `argus`.`Curriculo` (`codCurriculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codResponsavel_pag`
    FOREIGN KEY (`codResponsavel`)
    REFERENCES `argus`.`Responsaveis` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codAluno_pag`
    FOREIGN KEY (`codAluno`)
    REFERENCES `argus`.`Alunos` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Pais` (
  `codPessoa` INT NOT NULL,
  `Status` ENUM("Ativo", "Inativo") NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`codPessoa`),
  INDEX `fk_codPessoa` (`codPessoa` ASC) INVISIBLE,
  CONSTRAINT `fk_CPF_Pais`
    FOREIGN KEY (`CPF`)
    REFERENCES `argus`.`Pessoas` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codPessoa_Pais`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `argus`.`Pessoas` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Pessoas` (
  `codPessoa` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(60) NOT NULL,
  `Naturalidade` VARCHAR(40) NOT NULL,
  `Dt_nascimento` DATE NOT NULL,
  `CPF` VARCHAR(14) NULL,
  `Status` ENUM("Ativo", "Inativo") NOT NULL,
  PRIMARY KEY (`codPessoa`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) INVISIBLE,
  INDEX `index_Nome_pessoas` (`Nome` ASC) INVISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Precos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Precos` (
  `codCurrículo` ENUM("EF-Iniciais", "EF-Finais", "EM") NOT NULL,
  `AnoLetivo` YEAR(4) NOT NULL,
  `Valor` DOUBLE NOT NULL,
  PRIMARY KEY (`codCurrículo`, `AnoLetivo`, `Valor`),
  INDEX `index_codCurriculo_preco` (`codCurrículo` ASC) INVISIBLE,
  CONSTRAINT `fk_codCurriculo_precos`
    FOREIGN KEY (`codCurrículo`)
    REFERENCES `argus`.`Curriculo` (`codCurriculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Professores` (
  `codPessoa` INT NOT NULL,
  `Status` ENUM("Ativo", "Inativo") NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`codPessoa`),
  INDEX `INDEX_codPessoa` (`codPessoa` ASC) VISIBLE,
  INDEX `INDEX_CPF` (`CPF` ASC) VISIBLE,
  CONSTRAINT `fk_codPessoa_prof`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `argus`.`Pessoas` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_CPF_prof`
    FOREIGN KEY (`CPF`)
    REFERENCES `argus`.`Pessoas` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Professores-Disciplinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Professores-Disciplinas` (
  `codProfessor` INT NOT NULL,
  `codDisciplina` INT NOT NULL,
  `codCurriculo` ENUM("EF-Iniciais", "EF-Finais", "EM") NOT NULL,
  INDEX `codProfessor_INDEX` (`codProfessor` ASC) INVISIBLE,
  INDEX `codDisciplina_INDEX` (`codDisciplina` ASC) VISIBLE,
  PRIMARY KEY (`codProfessor`, `codDisciplina`, `codCurriculo`),
  INDEX `index_curriculo_PD` (`codCurriculo` ASC) INVISIBLE,
  CONSTRAINT `fk_codProfessor_inner`
    FOREIGN KEY (`codProfessor`)
    REFERENCES `argus`.`Professores` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codDisciplina_inner`
    FOREIGN KEY (`codDisciplina`)
    REFERENCES `argus`.`Disciplinas` (`codDisciplina`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codCurriculo_inner`
    FOREIGN KEY (`codCurriculo`)
    REFERENCES `argus`.`Curriculo` (`codCurriculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Responsaveis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Responsaveis` (
  `codPessoa` INT NOT NULL,
  `codAluno` INT NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  `Nome` VARCHAR(60) NOT NULL,
  `Status` ENUM("Ativo", "Inativo") NOT NULL,
  PRIMARY KEY (`codPessoa`, `codAluno`, `CPF`),
  INDEX `indexes_resp` (`codPessoa` ASC, `codAluno` ASC, `Nome` ASC, `CPF` ASC) INVISIBLE,
  INDEX `fk_codAluno_resp_idx` (`codAluno` ASC) VISIBLE,
  INDEX `fk_CPF_resp_idx` (`CPF` ASC) VISIBLE,
  INDEX `fk_Nome_resp_idx` (`Nome` ASC) VISIBLE,
  CONSTRAINT `fk_codPessoa_resp`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `argus`.`Pessoas` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codAluno_resp`
    FOREIGN KEY (`codAluno`)
    REFERENCES `argus`.`Alunos` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_CPF_resp`
    FOREIGN KEY (`CPF`)
    REFERENCES `argus`.`Pessoas` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Nome_resp`
    FOREIGN KEY (`Nome`)
    REFERENCES `argus`.`Pessoas` (`Nome`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`SessaoPedagogica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`SessaoPedagogica` (
  `codPedagogo` INT NOT NULL,
  `Data` DATETIME NOT NULL,
  `Detalhamento` MEDIUMTEXT NOT NULL,
  `Status` ENUM("Em Atendimento", "Concluído") NOT NULL,
  PRIMARY KEY (`codPedagogo`, `Data`),
  INDEX `index_codPedagogo_sessao` (`codPedagogo` ASC) INVISIBLE,
  CONSTRAINT `fk_codPedagogo_sp`
    FOREIGN KEY (`codPedagogo`)
    REFERENCES `argus`.`Usuarios` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Turmas` (
  `codTurma` INT NOT NULL AUTO_INCREMENT,
  `codAluno` INT NOT NULL,
  `curriculo` ENUM("EF-Iniciais", "EF-Finais", "EM") NOT NULL,
  `codDisicplina` INT NOT NULL,
  `serie` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`codTurma`, `curriculo`, `codDisicplina`, `serie`, `codAluno`),
  INDEX `index_codAluno_turmas` (`codAluno` ASC) VISIBLE,
  INDEX `index_codDisciplina_turmas` (`codDisicplina` ASC) VISIBLE,
  INDEX `index_curriculo_turm` (`curriculo` ASC) VISIBLE,
  CONSTRAINT `fk_codAluno_turmas`
    FOREIGN KEY (`codAluno`)
    REFERENCES `argus`.`Alunos` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codDisciplina_turmas`
    FOREIGN KEY (`codDisicplina`)
    REFERENCES `argus`.`Disciplinas` (`codDisciplina`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_curriculo_turmas`
    FOREIGN KEY (`curriculo`)
    REFERENCES `argus`.`Curriculo` (`codCurriculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Usuarios` (
  `codPessoa` INT NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  `User` VARCHAR(25) NOT NULL,
  `Senha` VARCHAR(40) NOT NULL,
  `Tipo` ENUM("Admin", "Secretaria", "Direcao", "Pedagogo") NOT NULL,
  `Status` ENUM("Ativo", "Inativo") NOT NULL,
  PRIMARY KEY (`codPessoa`),
  INDEX `index_codPessoa_usu` (`codPessoa` ASC) INVISIBLE,
  INDEX `index_CPF_usu` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  CONSTRAINT `fk_codPessoa_usu`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `argus`.`Pessoas` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_CPF_usu`
    FOREIGN KEY (`CPF`)
    REFERENCES `argus`.`Pessoas` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
