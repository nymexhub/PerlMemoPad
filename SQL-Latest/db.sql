-- phpMyAdmin SQL Dump
-- version 2.6.2-Debian-3sarge1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jan 13, 2006 at 04:22 AM
-- Server version: 4.0.24
-- PHP Version: 4.3.10-16
-- 
-- Database: `felipe`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `blog`
-- 

CREATE TABLE `blog` (
  `id` int(11) NOT NULL auto_increment,
  `date` varchar(18) NOT NULL default '',
  `pre_note` longtext NOT NULL,
  `note` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM AUTO_INCREMENT=1565 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `blog_com`
-- 

CREATE TABLE `blog_com` (
  `id` int(11) NOT NULL auto_increment,
  `id_iddata` int(11) NOT NULL default '0',
  `nombre` varchar(100) NOT NULL default '',
  `comenta` longtext NOT NULL,
  `activo` char(1) NOT NULL default '',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM AUTO_INCREMENT=24 ;


