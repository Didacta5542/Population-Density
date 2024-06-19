create database ejercicios;
show databases;
use ejercicios;

create table cities_population(
	city varchar(50) not null,
    country varchar(50) not null,
    population int not null,
    area float not null
);

show tables;
-- insertamos valores
insert into cities_population (city, country, population, area)
values 
	('Metropolis', 'Countryland', 1000000, 500),
    ('Smallville', 'Countryland', 50000, 1000),
    ('Coastcity', 'Oceanland', 300000, 0),
    ('Starcity', 'Mountainous', 600000, 600),
    ('Gotham', 'Islander', 1500000, 300),
    ('Rivertown', 'Plainsland', 100000, 5000),
    ('Lakecity', 'Forestland', 100000, 5000),
    ('Hilltown', 'Hillside', 200000, 450),
    ('Forestville', 'Forestland', 500000, 700),
    ('Oceanview', 'Seaside', 800000, 0);
    
select * from cities_population;


-- densidad de poblacion
with city_density as (
	select city,
		country,
        -- density
        round(population/area) as density
	from cities_population
),
min_max_densities as (
	select
		-- densidad maxima
        max(density) as max_density,
        min(density) as min_density
	from city_density
)
-- select * from city_density;
-- seleccionamos las ciudades con la densidad maxima y minima
select 
	cd.city,
    cd.country,
    cd.density
from city_density cd
join
	min_max_densities mmd
on
	cd.density = mmd.min_density
	or
    cd.density = mmd.max_density;