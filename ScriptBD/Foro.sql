-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema foro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema foro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `foro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `foro` ;

-- -----------------------------------------------------
-- Table `foro`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `foro`.`tipo_usuario` (
  `idtipo_usuario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipo_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `foro`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `foro`.`usuario` (
  `idUsuario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) CHARACTER SET 'utf8mb3' NOT NULL,
  `contrasenia` VARCHAR(16) NOT NULL,
  `tipo_usuario_idtipo_usuario` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  INDEX `fk_usuario_tipo_usuario1_idx` (`tipo_usuario_idtipo_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_tipo_usuario1`
    FOREIGN KEY (`tipo_usuario_idtipo_usuario`)
    REFERENCES `foro`.`tipo_usuario` (`idtipo_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 30
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `foro`.`articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `foro`.`articulo` (
  `idArticulo` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(1000) CHARACTER SET 'utf8mb3' NOT NULL,
  `contenido` VARCHAR(1000) CHARACTER SET 'utf8mb3' NOT NULL,
  `fecha_articulo` DATE NOT NULL,
  `usuario_idUsuario` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idArticulo`),
  UNIQUE INDEX `idArticulo_UNIQUE` (`idArticulo` ASC) VISIBLE,
  INDEX `fk_articulo_usuario_idx` (`usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_articulo_usuario`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `foro`.`usuario` (`idUsuario`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 65
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `foro`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `foro`.`categoria` (
  `idCategoria` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(255) CHARACTER SET 'utf8mb3' NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE INDEX `nombre_categoria_UNIQUE` (`nombre_categoria` ASC) VISIBLE,
  UNIQUE INDEX `idCategoria_UNIQUE` (`idCategoria` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `foro`.`articulo_x_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `foro`.`articulo_x_categoria` (
  `idArticulo_x_Categoria` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `articulo_idArticulo` INT UNSIGNED NOT NULL,
  `categoria_idCategoria` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idArticulo_x_Categoria`),
  UNIQUE INDEX `idArticulo_x_Categoria_UNIQUE` (`idArticulo_x_Categoria` ASC) VISIBLE,
  INDEX `fk_articulo_x_categoria_articulo1_idx` (`articulo_idArticulo` ASC) VISIBLE,
  INDEX `fk_articulo_x_categoria_categoria1_idx` (`categoria_idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_articulo_x_categoria_articulo1`
    FOREIGN KEY (`articulo_idArticulo`)
    REFERENCES `foro`.`articulo` (`idArticulo`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_articulo_x_categoria_categoria1`
    FOREIGN KEY (`categoria_idCategoria`)
    REFERENCES `foro`.`categoria` (`idCategoria`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 81
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `foro`.`comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `foro`.`comentario` (
  `idComentario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `contenido_comentario` VARCHAR(255) CHARACTER SET 'utf8mb3' NOT NULL,
  `fecha_comentario` DATE NOT NULL,
  `articulo_idArticulo` INT UNSIGNED NOT NULL,
  `id_usuario` INT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`idComentario`),
  UNIQUE INDEX `idComentario_UNIQUE` (`idComentario` ASC) VISIBLE,
  INDEX `fk_comentario_articulo1_idx` (`articulo_idArticulo` ASC) VISIBLE,
  INDEX `comentario_ibfk_1` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `comentario_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `foro`.`usuario` (`idUsuario`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_comentario_articulo1`
    FOREIGN KEY (`articulo_idArticulo`)
    REFERENCES `foro`.`articulo` (`idArticulo`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
