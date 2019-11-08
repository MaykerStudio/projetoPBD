-- MySQL Script generated by MySQL Workbench
-- Thu Nov  7 02:27:29 2019
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
-- Table `argus`.`Pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Pessoas` (
  `codPessoa` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Naturalidade` VARCHAR(40) NOT NULL,
  `Dt_nascimento` DATE NOT NULL,
  `CPF` VARCHAR(14) NULL,
  `Status` ENUM("Ativo", "Inativo") NOT NULL,
  PRIMARY KEY (`codPessoa`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) INVISIBLE,
  INDEX `index_Nome_pessoas` (`Nome` ASC) INVISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`ResponsaveisFinanceiros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`ResponsaveisFinanceiros` (
  `codPessoa` INT NOT NULL,
  `codAluno` INT NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  `Status` ENUM("Ativo", "Inativo") NOT NULL,
  PRIMARY KEY (`codPessoa`, `codAluno`),
  INDEX `fk_CPF_resp_idx` (`CPF` ASC) VISIBLE,
  INDEX `index_codResp` (`codPessoa` ASC) VISIBLE,
  INDEX `fk_codAluno_resp_idx` (`codAluno` ASC) VISIBLE,
  CONSTRAINT `fk_codPessoa_resp`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `argus`.`Pessoas` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codAluno_resp`
    FOREIGN KEY (`codAluno`)
    REFERENCES `argus`.`Pessoas` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_CPF_resp`
    FOREIGN KEY (`CPF`)
    REFERENCES `argus`.`Pessoas` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Alunos` (
  `codPessoa` INT NOT NULL,
  `nomeMae` VARCHAR(100) NOT NULL,
  `nomePai` VARCHAR(100) NOT NULL,
  `codResponsavelFin` INT NOT NULL,
  `Status` ENUM("Ativo", "Inativo") NOT NULL,
  PRIMARY KEY (`codPessoa`),
  INDEX `index_codMae` (`nomeMae` ASC) VISIBLE,
  INDEX `index_codPai` (`nomePai` ASC) VISIBLE,
  INDEX `index_codPessoa_aluno` (`codPessoa` ASC) VISIBLE,
  INDEX `index_responsavel` (`codResponsavelFin` ASC) VISIBLE,
  CONSTRAINT `fk_codPessoa_aluno`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `argus`.`Pessoas` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Responsavel_aluno`
    FOREIGN KEY (`codResponsavelFin`)
    REFERENCES `argus`.`ResponsaveisFinanceiros` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
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
-- Table `argus`.`Professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Professores` (
  `codPessoa` INT NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  `formacao` VARCHAR(15) NOT NULL,
  `cursoFormacao` VARCHAR(45) NOT NULL,
  `Status` VARCHAR(7) NOT NULL,
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
-- Table `argus`.`Disciplinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Disciplinas` (
  `codDisciplina` VARCHAR(3) NOT NULL,
  `Nome` VARCHAR(20) NOT NULL,
  `Status` ENUM("Ativo", "Inativo") NOT NULL,
  PRIMARY KEY (`codDisciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Curriculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Curriculo` (
  `codCurriculo` VARCHAR(5) NOT NULL,
  `Nome` VARCHAR(40) NOT NULL,
  `Tipo` ENUM("Bimestral", "Trimestral") NOT NULL,
  PRIMARY KEY (`codCurriculo`),
  INDEX `index_codCurriculo_curr` (`codCurriculo` ASC) INVISIBLE,
  INDEX `index_tipo_cur` (`Tipo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Curriculo-Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Curriculo-Disciplina` (
  `codCurriculo` VARCHAR(5) NOT NULL,
  `codDisciplina` VARCHAR(3) NOT NULL,
  `ano` INT NOT NULL,
  `anoLetivo` INT NOT NULL,
  `cargaHoraria` INT NOT NULL,
  PRIMARY KEY (`codCurriculo`, `codDisciplina`, `ano`, `anoLetivo`),
  INDEX `index_codCurriculo_CD` (`codCurriculo` ASC) VISIBLE,
  INDEX `index_codDisciplina_CD` (`codDisciplina` ASC) VISIBLE,
  INDEX `index_ano_CD` (`ano` ASC) VISIBLE,
  INDEX `index_anoLetivo_CD` (`anoLetivo` ASC) VISIBLE,
  INDEX `index_cargaHoraria_CD` (`cargaHoraria` ASC) VISIBLE,
  UNIQUE INDEX `uniques` (`codDisciplina` ASC, `codCurriculo` ASC, `anoLetivo` ASC, `ano` ASC) INVISIBLE,
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
-- Table `argus`.`Professores-Disciplinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Professores-Disciplinas` (
  `codProfessor` INT NOT NULL,
  `codDisciplina` VARCHAR(3) NOT NULL,
  `codCurriculo` VARCHAR(5) NOT NULL,
  `ano` INT NOT NULL,
  INDEX `codProfessor_INDEX` (`codProfessor` ASC) VISIBLE,
  INDEX `codDisciplina_INDEX` (`codDisciplina` ASC) VISIBLE,
  PRIMARY KEY (`codDisciplina`, `codCurriculo`, `ano`),
  INDEX `index_curriculo_PD` (`codCurriculo` ASC) VISIBLE,
  INDEX `index_ano_PD` (`ano` ASC) VISIBLE,
  CONSTRAINT `fk_codProfessor_inner`
    FOREIGN KEY (`codProfessor`)
    REFERENCES `argus`.`Professores` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codDisciplina_inner`
    FOREIGN KEY (`codDisciplina`)
    REFERENCES `argus`.`Curriculo-Disciplina` (`codDisciplina`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codCurriculo_inner`
    FOREIGN KEY (`codCurriculo`)
    REFERENCES `argus`.`Curriculo-Disciplina` (`codCurriculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ano_inner`
    FOREIGN KEY (`ano`)
    REFERENCES `argus`.`Curriculo-Disciplina` (`ano`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Turmas` (
  `codTurma` INT NOT NULL AUTO_INCREMENT,
  `codCurriculo` VARCHAR(5) NOT NULL,
  `anoLetivo` INT NOT NULL,
  `ano` INT NOT NULL,
  PRIMARY KEY (`codTurma`),
  INDEX `index_curriculo_turm` (`codCurriculo` ASC) VISIBLE,
  INDEX `index_anoLetivo_turm` (`anoLetivo` ASC) VISIBLE,
  CONSTRAINT `fk_curriculo_turmas`
    FOREIGN KEY (`codCurriculo`)
    REFERENCES `argus`.`Curriculo` (`codCurriculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Notas` (
  `codAluno` INT NOT NULL,
  `codDisciplina` VARCHAR(3) NOT NULL,
  `serie` INT NOT NULL,
  `anoLetivo` INT NOT NULL,
  `unidade` ENUM("Bimestral", "Trimestral") NOT NULL,
  `valorUnidade` INT NOT NULL,
  `media` FLOAT NULL,
  `situacao` ENUM("Pendente", "Atualizado") NOT NULL,
  PRIMARY KEY (`codAluno`, `codDisciplina`, `serie`, `anoLetivo`, `unidade`, `valorUnidade`),
  INDEX `index_codAluno_notas` (`codAluno` ASC) INVISIBLE,
  INDEX `index_codDisciplina_notas` (`codDisciplina` ASC) INVISIBLE,
  INDEX `index_serie_notas` (`serie` ASC) INVISIBLE,
  INDEX `index_anoLetivo_notas` (`anoLetivo` ASC) VISIBLE,
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
-- Table `argus`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Usuarios` (
  `codPessoa` INT NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  `User` VARCHAR(25) NOT NULL,
  `Senha` VARCHAR(32) NOT NULL,
  `Tipo` VARCHAR(10) NOT NULL,
  `Status` ENUM("Ativo", "Inativo") NOT NULL,
  PRIMARY KEY (`codPessoa`),
  INDEX `index_codPessoa_usu` (`codPessoa` ASC) INVISIBLE,
  INDEX `index_CPF_usu` (`CPF` ASC) INVISIBLE,
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


-- -----------------------------------------------------
-- Table `argus`.`LogSistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`LogSistema` (
  `order` INT NOT NULL AUTO_INCREMENT,
  `codPessoa` INT NOT NULL,
  `Acao` VARCHAR(300) NOT NULL,
  `Data` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  PRIMARY KEY (`order`, `codPessoa`, `Data`, `Hora`),
  INDEX `index_codPessoas_log` (`codPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_codPessoa_log`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `argus`.`Usuarios` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Precos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Precos` (
  `codCurriculo` VARCHAR(5) NOT NULL,
  `anoLetivo` INT NOT NULL,
  `valor` DOUBLE NOT NULL,
  PRIMARY KEY (`codCurriculo`, `anoLetivo`, `valor`),
  INDEX `index_codCurriculo_preco` (`codCurriculo` ASC) INVISIBLE,
  INDEX `index_anoLetivo_precos` (`anoLetivo` ASC) INVISIBLE,
  CONSTRAINT `fk_codCurriculo_precos`
    FOREIGN KEY (`codCurriculo`)
    REFERENCES `argus`.`Curriculo` (`codCurriculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Pagamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Pagamentos` (
  `codResponsavel` INT NOT NULL,
  `codCurriculo` VARCHAR(5) NOT NULL,
  `anoLetivo` INT NOT NULL,
  `codAluno` INT NOT NULL,
  `codBarras` VARCHAR(100) NOT NULL,
  `numeroDaParcela` INT NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codResponsavel`, `codCurriculo`, `anoLetivo`, `codAluno`, `codBarras`),
  UNIQUE INDEX `codBarras_UNIQUE` (`codBarras` ASC) INVISIBLE,
  INDEX `index_codAluno_pag` (`codAluno` ASC) INVISIBLE,
  INDEX `index_codCurriclo_pag` (`codCurriculo` ASC) INVISIBLE,
  INDEX `index_codResponsavel_pag` (`codResponsavel` ASC) INVISIBLE,
  INDEX `index_anoLetivo_pag` (`anoLetivo` ASC) INVISIBLE,
  CONSTRAINT `fk_codCurriclo_pag`
    FOREIGN KEY (`codCurriculo`)
    REFERENCES `argus`.`Precos` (`codCurriculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codResponsavel_pag`
    FOREIGN KEY (`codResponsavel`)
    REFERENCES `argus`.`ResponsaveisFinanceiros` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codAluno_pag`
    FOREIGN KEY (`codAluno`)
    REFERENCES `argus`.`Alunos` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`Contatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Contatos` (
  `codPessoa` INT NOT NULL,
  `Telefone` VARCHAR(13) NULL,
  `Celular` VARCHAR(14) NOT NULL,
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
-- Table `argus`.`MudancaDeSenhas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`MudancaDeSenhas` (
  `CPF` VARCHAR(14) NOT NULL,
  `dataSolicitacao` DATE NOT NULL,
  `horaSolicitacao` TIME NOT NULL,
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
-- Table `argus`.`Aluno-Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`Aluno-Turma` (
  `codAluno` INT NOT NULL,
  `codTurma` INT NOT NULL,
  `situacao` ENUM("Pendente", "Aprovado", "Reprovado") NOT NULL,
  PRIMARY KEY (`codAluno`, `codTurma`),
  INDEX `index_codAluno_turma` (`codAluno` ASC) INVISIBLE,
  INDEX `index_codTurma_turma` (`codTurma` ASC) VISIBLE,
  CONSTRAINT `fk_codAluno_turma`
    FOREIGN KEY (`codAluno`)
    REFERENCES `argus`.`Alunos` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codTurma_turma`
    FOREIGN KEY (`codTurma`)
    REFERENCES `argus`.`Turmas` (`codTurma`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `argus`.`MediaGeralAluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `argus`.`MediaGeralAluno` (
  `codAluno` INT NOT NULL,
  `codDisciplina` VARCHAR(3) NOT NULL,
  `serie` INT NOT NULL,
  `anoLetivo` INT NOT NULL,
  `media` FLOAT NULL,
  `situacao` ENUM("Pendente", "AM", "AP", "RP") NOT NULL,
  PRIMARY KEY (`codAluno`, `anoLetivo`, `serie`, `codDisciplina`),
  INDEX `fk_codDisciplina_media_idx` (`codDisciplina` ASC) VISIBLE,
  CONSTRAINT `fk_codAluno_media`
    FOREIGN KEY (`codAluno`)
    REFERENCES `argus`.`Alunos` (`codPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_codDisciplina_media`
    FOREIGN KEY (`codDisciplina`)
    REFERENCES `argus`.`Disciplinas` (`codDisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `argus` ;

-- -----------------------------------------------------
-- procedure getResponsaveis
-- -----------------------------------------------------

DELIMITER $$
USE `argus`$$
CREATE PROCEDURE getResponsaveis()
BEGIN 
	SELECT pessoas.codPessoa, pessoas.Nome, pessoas.Naturalidade, pessoas.Dt_nascimento, pessoas.CPF, Pessoas.Status
	FROM Pessoas
	INNER JOIN ResponsaveisFinanceiros
	WHERE Pessoas.codPessoa = ResponsaveisFinanceiros.codPessoa;
END;$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getResponsavelDoAluno
-- -----------------------------------------------------

DELIMITER $$
USE `argus`$$
CREATE PROCEDURE getResponsavelDoAluno(IN codResponsavel INT)
BEGIN 
	SELECT Distinct pessoas.codPessoa, pessoas.Nome, pessoas.Naturalidade, pessoas.Dt_nascimento, pessoas.CPF, ResponsaveisFinanceiros.codAluno, Pessoas.Status
	FROM Pessoas
	INNER JOIN ResponsaveisFinanceiros
	WHERE Pessoas.codPessoa = codResponsavel;
END;$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getAlunos
-- -----------------------------------------------------

DELIMITER $$
USE `argus`$$
CREATE PROCEDURE getAlunos(IN Turma INT)
BEGIN 
	SELECT pessoas.codPessoa, pessoas.Nome, pessoas.Naturalidade, pessoas.Dt_nascimento, pessoas.CPF, Alunos.nomeMae, Alunos.nomePai, Alunos.codResponsavelFin, Pessoas.Status, `Aluno-Turma`.situacao
	FROM Pessoas
	INNER JOIN `Aluno-Turma`, Alunos
	WHERE Pessoas.codPessoa = `Aluno-Turma`.codAluno AND `Aluno-Turma`.codTurma = Turma AND Pessoas.codPessoa = Alunos.codPessoa;
END;$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure generateNotas
-- -----------------------------------------------------

DELIMITER $$
USE `argus`$$
CREATE PROCEDURE generateNotas(IN alunocodigo INT, IN turmacodigo INT, IN curriculo VARCHAR(5), IN anoLetivoCur INT, IN ano INT)
BEGIN 
    DECLARE codDisciplinaNota VARCHAR(3) DEFAULT NULL;
   
	DECLARE done TINYINT DEFAULT FALSE;
    
    DECLARE cursor1 CURSOR FOR SELECT `Curriculo-Disciplina`.codDisciplina FROM `Curriculo-Disciplina` WHERE `Curriculo-Disciplina`.codCurriculo = curriculo AND
					`Curriculo-Disciplina`.ano = ano AND `Curriculo-Disciplina`.anoLetivo = anoLetivoCur;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cursor1;
    my_loop:
	LOOP
        
        FETCH NEXT FROM cursor1 INTO codDisciplinaNota;
        
        IF done THEN
			LEAVE my_loop;
		ELSE
			INSERT INTO MediaGeralAluno(codAluno, codDisciplina, serie, anoLetivo, media, situacao) VALUES(alunoCodigo, codDisciplinaNota, ano, anoLetivoCur, 0.0, "Pendente");
			IF (SELECT tipo FROM curriculo WHERE codCurriculo = curriculo) = 'Bimestral' THEN
				INSERT INTO Notas(codAluno, codDisciplina, serie, anoLetivo, unidade, valorUnidade, media, situacao) 
				VALUES(alunoCodigo, codDisciplinaNota, ano, anoLetivoCur,(SELECT tipo FROM curriculo WHERE codCurriculo = curriculo), 1, 0.0, "Pendente"),
                (alunoCodigo, codDisciplinaNota, ano, anoLetivoCur,(SELECT tipo FROM curriculo WHERE codCurriculo = curriculo), 2, 0.0, "Pendente"),
                (alunoCodigo, codDisciplinaNota, ano, anoLetivoCur,(SELECT tipo FROM curriculo WHERE codCurriculo = curriculo), 3, 0.0, "Pendente"),
                (alunoCodigo, codDisciplinaNota, ano, anoLetivoCur,(SELECT tipo FROM curriculo WHERE codCurriculo = curriculo), 4, 0.0, "Pendente"),
                (alunoCodigo, codDisciplinaNota, ano, anoLetivoCur,(SELECT tipo FROM curriculo WHERE codCurriculo = curriculo), 5, 0.0, "Pendente");
            ELSE
				INSERT INTO Notas(codAluno, codDisciplina, serie, anoLetivo, unidade, valorUnidade, media) 
				VALUES(alunoCodigo, codDisciplinaNota, ano, anoLetivoCur,(SELECT tipo FROM curriculo WHERE codCurriculo = curriculo), 1, 0.0, "Pendente"),
                (alunoCodigo, codDisciplinaNota, ano, anoLetivoCur,(SELECT tipo FROM curriculo WHERE codCurriculo = curriculo), 2, 0.0, "Pendente"),
                (alunoCodigo, codDisciplinaNota, ano, anoLetivoCur,(SELECT tipo FROM curriculo WHERE codCurriculo = curriculo), 3, 0.0, "Pendente"),
                (alunoCodigo, codDisciplinaNota, ano, anoLetivoCur,(SELECT tipo FROM curriculo WHERE codCurriculo = curriculo), 4, 0.0, "Pendente");
			END IF;
		END IF;
	END LOOP;
    
    CLOSE cursor1;
    
END;$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure checkDisciplinas
-- -----------------------------------------------------

DELIMITER $$
USE `argus`$$
CREATE PROCEDURE checkDisciplinas(IN codCur varchar(3), IN anoLetivoCur int, IN anoCur int)
BEGIN 
    DECLARE done TINYINT DEFAULT FALSE;
	
    DECLARE codDisciplina VARCHAR(3);
    DECLARE cargaHoraria int;
    
    DECLARE cursor1 CURSOR FOR SELECT `Curriculo-Disciplina`.codDisciplina, `Curriculo-Disciplina`.cargaHoraria FROM `Curriculo-Disciplina` WHERE `Curriculo-Disciplina`.codCurriculo = codCur AND
					`Curriculo-Disciplina`.ano = anoCur AND `Curriculo-Disciplina`.anoLetivo = anoLetivoCur-1;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
	if (SELECT DISTINCT `curriculo-disciplina`.anoLetivo FROM `curriculo-disciplina` 
		WHERE `curriculo-disciplina`.codCurriculo = codCur AND `curriculo-disciplina`.ano = anoCur and `curriculo-disciplina`.anoLetivo = anoLetivoCur) IS NULL THEN
		OPEN cursor1;
		my_loop:
		LOOP
			FETCH NEXT FROM cursor1 INTO codDisciplina, cargaHoraria;
			
			IF done THEN
				LEAVE my_loop;
			ELSE
				INSERT INTO `curriculo-disciplina` VALUES(codCur, codDisciplina, anoCur, anoLetivoCur, cargaHoraria);
			END IF;
		END LOOP;
		CLOSE cursor1;
	END IF; 
END;$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure setSituacaoAluno
-- -----------------------------------------------------

DELIMITER $$
USE `argus`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `setSituacaoAluno`(IN codAluno INT, IN codDisciplina VARCHAR(3), IN serie INT, IN anoLetivo INT, IN unidade VARCHAR(10), IN valorUnidade INT)
BEGIN
	DECLARE mediaVar FLOAT;
    IF unidade = 'Bimestral' AND valorUnidade = 4 THEN
		SELECT AVG(media) INTO mediaVar FROM argus.notas WHERE notas.codAluno = codAluno AND notas.codDisciplina = codDisciplina AND
						notas.serie = serie AND notas.anoLetivo = anoLetivo AND notas.valorUnidade < 5;
		IF mediaVar >= 7 THEN
			INSERT INTO MediaGeralAluno VALUES(codAluno, codDisciplina, serie, anoLetivo, mediaVar, 'AM') ON DUPLICATE KEY UPDATE MediaGeralAluno.media = mediaVar, MediaGeralAluno.situacao = 'AM';
		END IF;
	ELSE IF unidade = 'Bimestral' AND valorUnidade = 5 THEN
		SELECT AVG(media) INTO mediaVar FROM argus.notas WHERE notas.codAluno = codAluno AND notas.codDisciplina = codDisciplina AND
						notas.serie = serie AND notas.anoLetivo = anoLetivo;
		IF mediaVar >= 5 THEN
			INSERT INTO MediaGeralAluno VALUES(codAluno, codDisciplina, serie, anoLetivo, mediaVar, 'AP') ON DUPLICATE KEY UPDATE MediaGeralAluno.media = mediaVar, MediaGeralAluno.situacao = 'AP';
		ELSE
			INSERT INTO MediaGeralAluno VALUES(codAluno, codDisciplina, serie, anoLetivo, mediaVar, 'RP') ON DUPLICATE KEY UPDATE MediaGeralAluno.media = mediaVar, MediaGeralAluno.situacao = 'RP';
		END IF;
	END IF;
	IF unidade = 'Trimestral' AND valorUnidade = 3 THEN
		SELECT AVG(media) INTO mediaVar FROM argus.notas WHERE notas.codAluno = codAluno AND notas.codDisciplina = codDisciplina AND
						notas.serie = serie AND notas.anoLetivo = anoLetivo AND valorUnidade < 4;
		IF mediaVar >= 7 THEN
			INSERT INTO MediaGeralAluno VALUES(codAluno, codDisciplina, serie, anoLetivo, mediaVar, 'AM') ON DUPLICATE KEY UPDATE MediaGeralAluno.media = mediaVar, MediaGeralAluno.situacao = 'AM';
		END IF;
	ELSE IF unidade = 'Trimestral' AND valorUnidade = 4 THEN
		SELECT AVG(media) INTO mediaVar FROM argus.notas WHERE notas.codAluno = codAluno AND notas.codDisciplina = codDisciplina AND
						notas.serie = serie AND notas.anoLetivo = anoLetivo;
		IF mediaVar >= 5 THEN
			INSERT INTO MediaGeralAluno VALUES(codAluno, codDisciplina, serie, anoLetivo, mediaVar, 'AP') ON DUPLICATE KEY UPDATE MediaGeralAluno.media = mediaVar, MediaGeralAluno.situacao = 'AP';
		ELSE
			INSERT INTO MediaGeralAluno VALUES(codAluno, codDisciplina, serie, anoLetivo, mediaVar, 'RP') ON DUPLICATE KEY UPDATE MediaGeralAluno.media = mediaVar, MediaGeralAluno.situacao = 'RP';
        END IF;
    END IF;
	END IF;
	END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `argus`.`ViewUsuario`
-- -----------------------------------------------------
USE `argus`;
CREATE  OR REPLACE VIEW `ViewUsuario`
AS SELECT pessoas.codPessoa, pessoas.Nome, pessoas.Naturalidade, pessoas.Dt_nascimento, pessoas.CPF, usuarios.User, usuarios.Senha, usuarios.Tipo, usuarios.Status
FROM pessoas
INNER JOIN usuarios
ON pessoas.codPessoa = usuarios.codPessoa;

-- -----------------------------------------------------
-- View `argus`.`ViewProfessor`
-- -----------------------------------------------------
USE `argus`;
CREATE  OR REPLACE VIEW `ViewProfessor`
AS SELECT pessoas.codPessoa, pessoas.Nome, pessoas.Naturalidade, pessoas.Dt_nascimento, pessoas.CPF, pessoas.Status, professores.formacao, professores.cursoFormacao
FROM pessoas
INNER JOIN professores
ON pessoas.codPessoa = professores.codPessoa;

-- -----------------------------------------------------
-- View `argus`.`ViewAluno`
-- -----------------------------------------------------
USE `argus`;
CREATE  OR REPLACE VIEW `ViewAluno` 
AS SELECT DISTINCT pessoas.codPessoa, pessoas.Nome, pessoas.Naturalidade, pessoas.Dt_nascimento, pessoas.CPF, Alunos.nomeMae, Alunos.nomePai, Alunos.codResponsavelFin, Pessoas.Status
FROM Pessoas
INNER JOIN Alunos , `Aluno-Turma`
WHERE Pessoas.codPessoa = Alunos.codPessoa;

-- -----------------------------------------------------
-- View `argus`.`ViewTurma`
-- -----------------------------------------------------
USE `argus`;
CREATE  OR REPLACE VIEW `ViewTurma`
AS SELECT Turmas.codTurma, Turmas.codCurriculo, Curriculo.Nome, Turmas.anoLetivo, Turmas.ano
FROM Turmas
INNER JOIN Curriculo
WHERE Turmas.codCurriculo = Curriculo.codCurriculo;
USE `argus`;

DELIMITER $$
USE `argus`$$
CREATE DEFINER = CURRENT_USER TRIGGER `argus`.`Pessoas_AFTER_UPDATE` AFTER UPDATE ON `Pessoas` FOR EACH ROW
BEGIN
	UPDATE usuarios SET usuarios.Status = NEW.Status
	WHERE usuarios.codPessoa = NEW.codPessoa;
    
    UPDATE professores SET professores.Status = NEW.Status
    WHERE professores.codPessoa = NEW.codPessoa;
    
    UPDATE alunos SET alunos.Status = NEW.Status
    WHERE alunos.codPessoa = NEW.codPessoa;
END$$

USE `argus`$$
CREATE DEFINER = CURRENT_USER TRIGGER `argus`.`Turmas_BEFORE_INSERT` BEFORE INSERT ON `Turmas` FOR EACH ROW
BEGIN
	DECLARE codCur VARCHAR(3);
    DECLARE anoLetivoCur INT;
    DECLARE anoCur INT;    
    call checkDisciplinas(NEW.codCurriculo, NEW.anoLetivo, NEW.ano);
END$$

USE `argus`$$
CREATE DEFINER = CURRENT_USER TRIGGER `argus`.`Notas_BEFORE_UPDATE` BEFORE UPDATE ON `Notas` FOR EACH ROW
BEGIN
	SET NEW.situacao = "Atualizado";
END$$

USE `argus`$$
CREATE DEFINER = CURRENT_USER TRIGGER `argus`.`Notas_AFTER_UPDATE` AFTER UPDATE ON `Notas` FOR EACH ROW
BEGIN
	CALL setSituacaoAluno(NEW.codAluno, NEW.codDisciplina, NEW.serie, NEW.anoLetivo, NEW.unidade, NEW.valorUnidade);
END$$

USE `argus`$$
CREATE DEFINER = CURRENT_USER TRIGGER `argus`.`Aluno-Turma_AFTER_INSERT` AFTER INSERT ON `Aluno-Turma` FOR EACH ROW
BEGIN
	DECLARE curriculo VARCHAR(5) DEFAULT NULL;
	DECLARE anoLetivoCur INT DEFAULT NULL;
    DECLARE ano INT DEFAULT NULL;
    
	SELECT Turmas.codCurriculo, Turmas.anoLetivo, Turmas.ano INTO curriculo, anoLetivoCur, ano FROM Turmas WHERE Turmas.codTurma = NEW.codTurma;
	CALL generateNotas(NEW.codAluno, NEW.codTurma, curriculo, anoLetivoCur, ano);  
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
