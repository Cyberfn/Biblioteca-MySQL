-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`autores` (
  `ID_Autor` INT NOT NULL,
  `Nome` VARCHAR(255) NULL DEFAULT NULL,
  `Nacionalidade` VARCHAR(100) NULL DEFAULT NULL,
  `Data_Nascimento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Autor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`livros` (
  `ID_Livro` INT NOT NULL,
  `Titulo` VARCHAR(255) NULL DEFAULT NULL,
  `Autor_ID` INT NULL DEFAULT NULL,
  `Genero` VARCHAR(100) NULL DEFAULT NULL,
  `Ano_Publicacao` INT NULL DEFAULT NULL,
  `Editora` VARCHAR(100) NULL DEFAULT NULL,
  `Num_Paginas` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Livro`),
  INDEX `Autor_ID` (`Autor_ID` ASC) VISIBLE,
  CONSTRAINT `livros_ibfk_1`
    FOREIGN KEY (`Autor_ID`)
    REFERENCES `biblioteca`.`autores` (`ID_Autor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`usuarios` (
  `ID_Usuario` INT NOT NULL,
  `Nome` VARCHAR(255) NULL DEFAULT NULL,
  `Endereco` VARCHAR(255) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Telefone` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`emprestimos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`emprestimos` (
  `ID_Emprestimo` INT NOT NULL,
  `Livro_ID` INT NULL DEFAULT NULL,
  `Usuario_ID` INT NULL DEFAULT NULL,
  `Data_Emprestimo` DATE NULL DEFAULT NULL,
  `Data_Devolucao_Previsao` DATE NULL DEFAULT NULL,
  `Data_Devolucao_Real` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Emprestimo`),
  INDEX `Livro_ID` (`Livro_ID` ASC) VISIBLE,
  INDEX `Usuario_ID` (`Usuario_ID` ASC) VISIBLE,
  CONSTRAINT `emprestimos_ibfk_1`
    FOREIGN KEY (`Livro_ID`)
    REFERENCES `biblioteca`.`livros` (`ID_Livro`),
  CONSTRAINT `emprestimos_ibfk_2`
    FOREIGN KEY (`Usuario_ID`)
    REFERENCES `biblioteca`.`usuarios` (`ID_Usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
