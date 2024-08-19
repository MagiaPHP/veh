-- phpMyAdmin SQL Dump
-- version 5.2.1-4.fc40
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 19, 2024 at 02:38 PM
-- Server version: 10.11.8-MariaDB
-- PHP Version: 8.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `factuxorg_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `veh_drivers`
--

CREATE TABLE `veh_drivers` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `country` varchar(2) NOT NULL,
  `license` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `number` varchar(250) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veh_driver_licenses`
--

CREATE TABLE `veh_driver_licenses` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `veh_driver_licenses`
--

INSERT INTO `veh_driver_licenses` (`id`, `name`, `category`, `order_by`, `status`) VALUES
(1, 'Type A', 'A', 1, 1),
(2, 'Type B', 'B', 1, 1),
(3, 'Type C', 'C', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `veh_fuels`
--

CREATE TABLE `veh_fuels` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `veh_fuels`
--

INSERT INTO `veh_fuels` (`id`, `name`, `code`, `order_by`, `status`) VALUES
(1, 'Gasolina 95 Sin plomo E5', '95', 1, 1),
(2, 'Gasolina 98 Sin plomo E5', '98', 1, 1),
(3, 'Gasóleo A', 'A', 1, 1),
(4, 'Gasóleo A+', 'A+', 1, 1),
(5, 'Gasóleo B', 'B', 1, 1),
(6, 'Nitrogeno', 'NITRO', 1, 1),
(7, 'Helio', 'HELIO', 1, 1),
(8, 'Electrico', 'ELEC', 1, 1),
(9, 'Diesel', 'DIESEL', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `veh_insurers`
--

CREATE TABLE `veh_insurers` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `insurer_code` varchar(50) NOT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veh_vehicles`
--

CREATE TABLE `veh_vehicles` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `marca` varchar(250) DEFAULT NULL,
  `modelo` varchar(250) DEFAULT NULL,
  `serie` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `pasangers` int(11) NOT NULL,
  `year` date DEFAULT NULL,
  `chasis` varchar(250) DEFAULT NULL,
  `color` varchar(250) DEFAULT NULL,
  `alto` decimal(9,2) DEFAULT NULL,
  `ancho` decimal(9,2) DEFAULT NULL,
  `largo` decimal(9,2) DEFAULT NULL,
  `date_buy` date DEFAULT NULL,
  `mma` int(11) NOT NULL COMMENT 'masa máxima autorizada',
  `towing_system` int(1) DEFAULT NULL,
  `towing_system_kl` int(11) DEFAULT NULL,
  `date_registre` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `veh_vehicles`
--

INSERT INTO `veh_vehicles` (`id`, `name`, `marca`, `modelo`, `serie`, `type`, `pasangers`, `year`, `chasis`, `color`, `alto`, `ancho`, `largo`, `date_buy`, `mma`, `towing_system`, `towing_system_kl`, `date_registre`, `order_by`, `status`) VALUES
(3, 'Carro blanco', 'Mercedees', 'Vito', 'A12', 'tipo1', 9, '1997-01-01', 'mdpsoefosjkzorjkfjsoekodka', 'White', 1.90, 2.50, 5.20, '2020-01-01', 2500, 1, 1, '2024-04-22 18:36:31', 1, 1),
(5, 'camioneta', 'bmw', 'a1', 'serie1', 'auto', 5, '2024-01-01', '22154154512544', 'negro', 150.00, 250.00, 350.00, '2024-01-01', 2500, 0, 150, '2024-07-11 19:54:01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `veh_vehicles_drivers`
--

CREATE TABLE `veh_vehicles_drivers` (
  `id` int(11) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `date_start` date NOT NULL,
  `notes` mediumtext DEFAULT NULL,
  `date_registre` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veh_vehicles_fuel`
--

CREATE TABLE `veh_vehicles_fuel` (
  `id` int(11) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `fuel_code` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `value` decimal(9,2) NOT NULL,
  `paid_by` int(11) DEFAULT NULL COMMENT 'Quien Pago ?',
  `ref` varchar(250) DEFAULT NULL COMMENT 'Facture o ticket',
  `notes` mediumtext DEFAULT NULL,
  `registred_by` int(11) NOT NULL,
  `date_registre` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veh_vehicles_traffic_ticket`
--

CREATE TABLE `veh_vehicles_traffic_ticket` (
  `id` int(11) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `pv_police` varchar(250) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `date_registre` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veh_vehicle_activity`
--

CREATE TABLE `veh_vehicle_activity` (
  `id` int(11) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `date_start` date NOT NULL,
  `time_start` time DEFAULT NULL,
  `kl_start` int(11) DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `kl_end` int(11) DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `kl_difference` int(11) GENERATED ALWAYS AS (`kl_end` - `kl_start`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veh_vehicle_insurance`
--

CREATE TABLE `veh_vehicle_insurance` (
  `id` int(11) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `insurance_code` varchar(50) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `contrat_number` varchar(250) NOT NULL,
  `countries_ok` text NOT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veh_vehicle_plates`
--

CREATE TABLE `veh_vehicle_plates` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `old_plate` varchar(50) DEFAULT NULL,
  `date_registre` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_by` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `veh_drivers`
--
ALTER TABLE `veh_drivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD UNIQUE KEY `contact_id` (`contact_id`,`license`),
  ADD KEY `drives_licence` (`license`),
  ADD KEY `country` (`country`);

--
-- Indexes for table `veh_driver_licenses`
--
ALTER TABLE `veh_driver_licenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category` (`category`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `veh_fuels`
--
ALTER TABLE `veh_fuels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `veh_insurers`
--
ALTER TABLE `veh_insurers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `insurer_code` (`insurer_code`),
  ADD KEY `insurers_contacts` (`contact_id`);

--
-- Indexes for table `veh_vehicles`
--
ALTER TABLE `veh_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `veh_vehicles_drivers`
--
ALTER TABLE `veh_vehicles_drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plate` (`plate`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `veh_vehicles_fuel`
--
ALTER TABLE `veh_vehicles_fuel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref` (`ref`),
  ADD KEY `vehicles_fuel_vehicle` (`plate`),
  ADD KEY `vehicles_fuel_user` (`registred_by`),
  ADD KEY `fuel_code` (`fuel_code`);

--
-- Indexes for table `veh_vehicles_traffic_ticket`
--
ALTER TABLE `veh_vehicles_traffic_ticket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pv_police` (`pv_police`),
  ADD KEY `vehiculo_multas_vehicle` (`plate`),
  ADD KEY `vehiculo_multas_driver` (`driver_id`);

--
-- Indexes for table `veh_vehicle_activity`
--
ALTER TABLE `veh_vehicle_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_activity_driver` (`driver_id`),
  ADD KEY `plate` (`plate`);

--
-- Indexes for table `veh_vehicle_insurance`
--
ALTER TABLE `veh_vehicle_insurance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `insurance_id` (`insurance_code`,`contrat_number`),
  ADD UNIQUE KEY `contrat_number` (`contrat_number`),
  ADD KEY `vehicle_insurance_vehicle` (`plate`);

--
-- Indexes for table `veh_vehicle_plates`
--
ALTER TABLE `veh_vehicle_plates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`),
  ADD UNIQUE KEY `plate_2` (`plate`),
  ADD KEY `vehicle_plates_vahicles` (`vehicle_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `veh_drivers`
--
ALTER TABLE `veh_drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `veh_driver_licenses`
--
ALTER TABLE `veh_driver_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `veh_fuels`
--
ALTER TABLE `veh_fuels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `veh_insurers`
--
ALTER TABLE `veh_insurers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `veh_vehicles`
--
ALTER TABLE `veh_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `veh_vehicles_drivers`
--
ALTER TABLE `veh_vehicles_drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `veh_vehicles_fuel`
--
ALTER TABLE `veh_vehicles_fuel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `veh_vehicles_traffic_ticket`
--
ALTER TABLE `veh_vehicles_traffic_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `veh_vehicle_activity`
--
ALTER TABLE `veh_vehicle_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `veh_vehicle_insurance`
--
ALTER TABLE `veh_vehicle_insurance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `veh_vehicle_plates`
--
ALTER TABLE `veh_vehicle_plates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `veh_drivers`
--
ALTER TABLE `veh_drivers`
  ADD CONSTRAINT `drives_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `drives_licence` FOREIGN KEY (`license`) REFERENCES `veh_driver_licenses` (`name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `veh_drivers_ibfk_1` FOREIGN KEY (`country`) REFERENCES `countries` (`countryCode`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `veh_insurers`
--
ALTER TABLE `veh_insurers`
  ADD CONSTRAINT `insurers_contacts` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `veh_vehicles_drivers`
--
ALTER TABLE `veh_vehicles_drivers`
  ADD CONSTRAINT `veh_vehicles_drivers_ibfk_1` FOREIGN KEY (`plate`) REFERENCES `veh_vehicle_plates` (`plate`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `veh_vehicles_drivers_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `veh_drivers` (`contact_id`);

--
-- Constraints for table `veh_vehicles_fuel`
--
ALTER TABLE `veh_vehicles_fuel`
  ADD CONSTRAINT `veh_vehicles_fuel_ibfk_1` FOREIGN KEY (`fuel_code`) REFERENCES `veh_fuels` (`code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `veh_vehicles_fuel_ibfk_2` FOREIGN KEY (`plate`) REFERENCES `veh_vehicle_plates` (`plate`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicles_fuel_user` FOREIGN KEY (`registred_by`) REFERENCES `users` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `veh_vehicles_traffic_ticket`
--
ALTER TABLE `veh_vehicles_traffic_ticket`
  ADD CONSTRAINT `vehiculo_multas_driver` FOREIGN KEY (`driver_id`) REFERENCES `veh_drivers` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `vehiculo_multas_plate` FOREIGN KEY (`plate`) REFERENCES `veh_vehicle_plates` (`plate`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `veh_vehicle_activity`
--
ALTER TABLE `veh_vehicle_activity`
  ADD CONSTRAINT `veh_vehicle_activity_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `veh_drivers` (`contact_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicle_activity_plates` FOREIGN KEY (`plate`) REFERENCES `veh_vehicle_plates` (`plate`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `veh_vehicle_insurance`
--
ALTER TABLE `veh_vehicle_insurance`
  ADD CONSTRAINT `vehicle_insurance_plates` FOREIGN KEY (`plate`) REFERENCES `veh_vehicle_plates` (`plate`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `veh_vehicle_plates`
--
ALTER TABLE `veh_vehicle_plates`
  ADD CONSTRAINT `vehicle_plates_vahicles` FOREIGN KEY (`vehicle_id`) REFERENCES `veh_vehicles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
