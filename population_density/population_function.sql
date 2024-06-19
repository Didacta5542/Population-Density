use ejercicios;
show tables;
select * from cities_population;

-- funcion que calcula la densidad y encuentra las densidades minimas y maximas
create function dbo.getcitydensities()
returns @CityDensities table(
	city nvarchar(255),
    country nvarchar(255),
    density int,
    min_density int,
    max_density int
)
as
begin
-- CTE densidad de poblacion
with city_density as (
	select city,
		country,
        round(population/area) as density
        from cities_population
),
min_max_densities as (
	select
		max(density) as max_density
        min(density) as min_density}
	from city_density
)

-- insertamos los resultados en la tabla que retornamos
insert into @CityDensities(city, country, density, min_density, max_density)
select 
	cd.density,
    cd.country,
	cd.density,
	mmd.min_density,
    mmd.max_density
from 
	city_density cd, 
    min_max_densities mmd;

return;
end;


