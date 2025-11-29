--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--													Load Scripts, loading data in the tables --> Stored Procedure, Bulk Insert, Silver Layer
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

create or alter procedure silver.load_silver as 
begin

	declare @start_time datetime , @end_time datetime , @batch_start_time datetime , @batch_end_time datetime;

	begin try

		set @batch_start_time = getdate();

		print'============================================================================================================================================================================='
		print'                                                                   Loading Silver Layer                                                                                      '
		print'============================================================================================================================================================================='

		-- this quiry because we choose the truncate & insert process
		set @start_time = getdate(); -- to know what time the data loading start
		print'Truncating table: silver.Date';
		truncate table silver.Date;

		-- be careful if you run this code twice it will duplicate the data, to avoid this write the truncate table quiry before it as shown
		print'Inserting data into table: silver.Date';
		bulk insert silver.Date
		from 'D:\Important\Depi\Microsoft Data Engineering\Graduation Project\Project\Queries\Silver Layer\Date.csv'
		with(
			firstrow = 2,
			fieldterminator = ';',
			tablock -- tablock is for improving the performance
		);

		set @end_time = getdate(); -- to know what time the data loading end
		print'File Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds'; -- to know how much time the data loading takes
		
		-- this quiry just to make sure that we imported the data correctly
		select * from Silver.Date;

		print'--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'

		print'Truncating table: silver.LocalAuthority';
		set @start_time = getdate(); -- to know what time the data loading start
		truncate table silver.LocalAuthority;

		print'Inserting data into table: silver.LocalAuthority';
		bulk insert silver.LocalAuthority
		from 'D:\Important\Depi\Microsoft Data Engineering\Graduation Project\Project\Queries\Silver Layer\LocalAuthority.csv'
		with(
			firstrow = 2,
			fieldterminator = ';',
			tablock 
		);

		set @end_time = getdate(); -- to know what time the data loading end
		print'File Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds' -- to know how much time the data loading takes
	
		select * from silver.LocalAuthority;

		print'--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'

		print'Truncating table: silver.Location';
		set @start_time = getdate();
		truncate table silver.Location;

		print'Inserting data into table: silver.Location';
		bulk insert silver.Location
		from 'D:\Important\Depi\Microsoft Data Engineering\Graduation Project\Project\Queries\Silver Layer\Location.csv'
		with(
			firstrow = 2,
			fieldterminator = ';',
			tablock 
		);

		set @end_time = getdate(); 
		print'File Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds' 
	
		select * 
		from silver.Location;

		print'--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'

		print'Truncating table: silver.Region';
		set @start_time = getdate(); 
		truncate table silver.Region;

		print'Inserting data into table: silver.Region';
		bulk insert silver.Region
		from 'D:\Important\Depi\Microsoft Data Engineering\Graduation Project\Project\Queries\Silver Layer\Region.csv'
		with(
			firstrow = 2,
			fieldterminator = ';',
			tablock 
		);

		set @end_time = getdate(); 
		print'File Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds'

		select *
		from silver.Region;

		print'--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'

		print'Truncating table: silver.Road';
		set @start_time = getdate(); 
		truncate table silver.Road;

		print'Inserting data into table: silver.Road';
		bulk insert silver.Road
		from 'D:\Important\Depi\Microsoft Data Engineering\Graduation Project\Project\Queries\Silver Layer\Road.csv'
		with(
			firstrow = 2,
			fieldterminator = ';',
			tablock 
		);

		set @end_time = getdate(); 
		print'File Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds' 
	
		select * 
		from silver.Road;

		print'--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'

		print'Truncating table: silver.Traffic';
		set @start_time = getdate(); 
		truncate table silver.Traffic;

		print'Inserting data into table: silver.Traffic';
		bulk insert silver.Traffic
		from 'D:\Important\Depi\Microsoft Data Engineering\Graduation Project\Project\Queries\Silver Layer\Traffic.csv'
		with(
			firstrow = 2,
			fieldterminator = ';',
			tablock 
		);

		set @end_time = getdate(); 
		print'File Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds' 
	
		select * 
		from silver.Traffic;

		set @batch_end_time = getdate();
		print'Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds'
		print'============================================================================================================================================================================'
		print'Loading Silver Layer Is Compeleted';
		print'Total Batch Load Duration is: ' + cast(datediff(second, @batch_start_time, @batch_end_time) as nvarchar) + ' seconds'
		print'============================================================================================================================================================================'

	end try

	-- This code is gonna to run only if there is an error in the begin try and end try
	begin catch
		print'============================================================================================================================================================================'
		print'ERROR OCCURED DURING  LOADING SILVER LAYER';
		print'ERROR MESSAGE' + ERROR_MESSAGE();
		print'ERROR MESSAGE' + CAST (ERROR_MESSAGE() AS NVARCHAR);
		print'ERROR MESSAGE' + CAST (ERROR_STATE() AS NVARCHAR);
		print'============================================================================================================================================================================'
	end catch

end


exec silver.load_silver;
