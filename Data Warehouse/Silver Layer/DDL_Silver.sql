/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/

IF OBJECT_ID('silver.LocalAuthority', 'U') IS NOT NULL
    DROP TABLE silver.LocalAuthority;
GO

CREATE TABLE silver.LocalAuthority (
    local_authority_id INT,
    local_authority_name NVARCHAR(125),
    local_authority_code NVARCHAR(125)
);
GO

IF OBJECT_ID('silver.Location', 'U') IS NOT NULL
    DROP TABLE silver.Location;
GO

CREATE TABLE silver.Location (
    Location_id NVARCHAR(100),
    easting INT,
    northing INT,
    latitude Decimal(10,8),
    longitude varchar(100),
    region_id INT,
    local_authority_id INT
);
GO

IF OBJECT_ID('silver.Region', 'U') IS NOT NULL
    DROP TABLE silver.Region;
GO

CREATE TABLE silver.Region (
    region_id INT,
    region_name NVARCHAR(100),
    region_ons_code NVARCHAR(100)
);
GO

IF OBJECT_ID('silver.Road', 'U') IS NOT NULL
    DROP TABLE silver.Road;
GO

CREATE TABLE silver.Road (
    Road_id NVARCHAR(100),
    road_name NVARCHAR(100),
	road_category NVARCHAR(25),
	road_type NVARCHAR(30),
	start_junction_road_name NVARCHAR(50),
	end_junction_road_name NVARCHAR(50),
	link_length_km varchar(20)
);
GO

IF OBJECT_ID('silver.Traffic', 'U') IS NOT NULL
    DROP TABLE silver.Traffic;
GO

CREATE TABLE silver.Traffic (
    Traffic_id NVARCHAR(100),
    Road_id NVARCHAR(100),
    region_id INT,
	Location_id NVARCHAR(100),
	local_authority_id INT,
	Date_id NVARCHAR(100),
	count_point_id INT,
	direction_of_travel NVARCHAR(10),
	hour INT,
	pedal_cycles INT,
	two_wheeled_motor_vehicles INT,
	cars INT,
	buses INT,
	LGVs INT,
	HGVs_2_rigid_axle INT,
	HGVs_3_rigid_axle INT,
	HGVs_4_rigid_axle INT,
	HGVs_4_articulated_axle INT,
	HGVs_5_articulated_axle INT,
	HGVs_6_articulated_axle INT,
	all_HGVs INT,
	all_motor_vehicles INT
);
GO

IF OBJECT_ID('silver.Date', 'U') IS NOT NULL
    DROP TABLE silver.Date;
GO

CREATE TABLE silver.Date (
    Date_id NVARCHAR(100),
    count_date varchar(50),
    day INT,
    month INT,
	year INT,
);
GO
